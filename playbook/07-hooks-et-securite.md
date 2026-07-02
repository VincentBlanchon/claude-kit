# 07. Hooks et sécurité : l'enforcement automatique

## L'idée maîtresse : consigne < enforcement

Une règle écrite dans `CLAUDE.md` est une **consigne** : très bien suivie en temps normal, mais elle peut glisser (session longue, contexte saturé, formulation ambiguë). Un hook ou une permission est de l'**enforcement** : le système l'applique, l'agent ne peut pas l'oublier.

La conséquence pratique : **tout ce qui peut être enforcé doit l'être, et sort du CLAUDE.md.** « Toujours vérifier les types » est une consigne fragile ; un hook qui lance le typecheck à chaque fin de tour est un fait. Garde le CLAUDE.md pour ce qui demande du jugement, donne le reste à la machine.

## Les permissions : le premier rempart

Dans `settings.json`, trois niveaux, appliqués dans cet ordre : `deny` (bloqué, non négociable), `ask` (confirmation demandée), `allow` (silencieux). **Un deny ne peut être contourné ni par l'agent, ni par une instruction dans un fichier lu, ni par un prompt malveillant.** C'est le seul mécanisme qui a cette propriété : réserve-le à ce qui est grave.

Le kit installe cette base :

```json
{
  "permissions": {
    "deny": [
      "Read(**/.env*)",
      "Read(**/.ssh/**)",
      "Read(**/secrets/**)",
      "Bash(rm -rf /*)",
      "Bash(git push --force*)"
    ],
    "ask": ["Bash(git push*)", "Bash(rm *)", "WebFetch"]
  }
}
```

**Pourquoi bloquer la lecture des secrets** alors que « l'agent est de mon côté » : parce qu'un secret lu entre dans le contexte, et que le contexte finit dans des logs, des résumés, parfois du code généré. Un secret que l'agent n'a jamais vu ne peut fuir nulle part. Trois vecteurs à couvrir : la lecture directe (`.env`), la sortie d'exécution (des tests qui affichent les variables d'environnement : utiliser un `.env.test` avec des valeurs bidon), et les recherches qui matchent des secrets.

## Les hooks : des scripts aux moments clés

Un hook est un script branché sur un événement du cycle de vie : début de session, avant/après chaque outil, fin de tour. Son code de sortie décide : `0` laisse passer, `2` bloque et renvoie le message à l'agent, qui doit s'y conformer.

Le kit installe quatre hooks :

| Hook | Événement | Ce qu'il fait |
|---|---|---|
| `git-diagnostic.sh` | Début de session | État du repo : retard sur le remote, fichiers en attente, branches d'agent non mergées. Muet si tout va bien |
| `lint-format.sh` | Après chaque écriture de fichier | Formate et linte le fichier touché (biome/prettier selon le projet) |
| `block-no-verify.sh` | Avant chaque commande shell | Refuse `git commit --no-verify` : les garde-fous ne se contournent pas |
| `typecheck-on-stop.sh` | Fin de tour | Typecheck complet ; bloque si l'agent a introduit de NOUVELLES erreurs (les erreurs préexistantes du projet ne comptent pas : système de baseline) |

Ce dernier illustre un principe important : **l'enforcement intelligent est un cliquet, pas un mur.** Exiger zéro erreur sur un projet qui en a 50 d'historique bloquerait tout ; exiger « pas une de plus » fait progresser sans paralyser.

## Écrire son propre hook : les deux pièges

1. **Les données arrivent sur stdin en JSON**, pas en variables d'environnement. Le pattern correct :
```bash
input=$(cat)
file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty')
```
2. **Un hook lent se paie à chaque déclenchement.** Au-delà d'une seconde ou deux, il dégrade toute la session : garder les hooks rapides, et tester en isolement (`echo '{"tool_input":{"file_path":"/tmp/t.ts"}}' | bash mon-hook.sh`).

## Les trois profils, selon l'enjeu

- **Minimal** (tout projet, même non-code) : diagnostic git à l'ouverture, notification quand l'agent attend.
- **Standard** (projet code, ce que le kit installe) : minimal + lint/format + blocage `--no-verify` + typecheck en fin de tour.
- **Strict** (production, données réelles) : standard + blocage des commandes destructives, scan de secrets en pre-commit, et revue sécurité obligatoire avant merge (agent `security-auditor`).

## L'hygiène de base, hooks ou pas

- Jamais de secret dans le code ni dans un fichier versionné : variables d'environnement, point.
- Valider toute entrée externe (formulaires, webhooks, paramètres d'URL) côté serveur.
- Vérification d'authentification au début de chaque route API, pas « plus tard ».
- Pas de données sensibles dans les logs.

Ces règles vivent dans `rules/securite.md` (installé par le kit) et l'agent `security-auditor` les contrôle avant les merges sensibles.
