## Verification : la preuve ou rien

- « C'est fait » sans preuve n'existe pas. Preuve = sortie de tests + typecheck propre + comportement constate dans le vrai environnement.
- Toute logique metier a des tests. La sortie complete fait foi, pas un resume.
- Toute UI se verifie dans un VRAI navigateur avant d'etre declaree finie :
  - Desktop (~1440px) : rendu conforme, zero erreur console, etats interactifs OK.
  - Mobile (~375px) : rien ne deborde, zones tactiles utilisables, formulaires remplissables.
  - Etats oublies : vide, erreur, chargement, texte long.
- Apres une retouche visuelle, la preuve se refait. Une verification d'avant-retouche ne prouve rien.
- Vocabulaire interdit en cloture de tache : « ca devrait marcher », « normalement c'est bon ». Soit la preuve existe, soit la tache est encore en cours.
- Rapporter fidelement : si un test echoue, le dire avec la sortie ; si une etape a saute, le dire.
- Rapport d'agent ≠ preuve : un subagent qui dit « termine » se verifie par SON DIFF (git diff), jamais par son rapport. Idem workflows et taches background.
- La preuve s'execute FRAICHE : un resultat d'il y a 20 minutes ne prouve rien sur le code d'apres.
