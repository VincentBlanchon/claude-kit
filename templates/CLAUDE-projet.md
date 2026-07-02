# {{PROJECT_NAME}} : {{PROJECT_TAGLINE}}

> Les regles de travail globales (reflechir avant de coder, simplicite, preuve) vivent dans `~/.claude/CLAUDE.md` et `~/.claude/rules/`.
> Ce fichier contient UNIQUEMENT le contexte specifique a {{PROJECT_NAME}}. Moins de 100 lignes.

## Description
{{PROJECT_DESCRIPTION_2_3_PHRASES}}

## Commandes
- `{{DEV_CMD}}` : dev server
- `{{BUILD_CMD}}` : production build
- `{{LINT_CMD}}` : linter
- `{{TEST_CMD}}` : tests
- `{{TYPECHECK_CMD}}` : typecheck

## Architecture
- **Framework :** {{FRAMEWORK}}
- **Langage :** {{LANGUAGE}}
- **Styling :** {{STYLING}}
- **Auth :** {{AUTH}}
- **DB :** {{DB}}
- **Deploiement :** {{DEPLOY}}

## Regles metier non negociables

<!-- UNIQUEMENT le specifique projet, que l'agent ne peut pas deviner en lisant le code.
     Exemples : "les montants sont TOUJOURS en centimes",
     "jamais d'acces direct a la table X, passer par le service Y". -->

## Pieges connus (Things That Will Bite You)

<!-- A remplir au fil du temps. Format : **[Sujet]** : piege + exemple + raison.
     Limite : 10 entrees max. Au-dela, purger les plus anciennes. -->

## References
@docs/vision-produit.md
