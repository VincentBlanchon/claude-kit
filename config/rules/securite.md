---
paths: ["**/*.ts", "**/*.tsx", "**/*.js", "**/*.jsx", "**/*.mjs", "**/*.vue", "**/*.svelte", "**/*.css", "**/*.py", "**/*.sql", "**/*.json", "**/*.env.example"]
---

## Securite

- Valider tous les inputs externes (API, formulaires, webhooks).
- Auth check au debut de chaque route handler API.
- Jamais de secrets dans le code — variables d'environnement.
- Rate limiting sur les endpoints sensibles.
- Pas de donnees sensibles dans les logs.
- Avant TOUT changement touchant des donnees reelles (fichiers, base, prod) : etat des lieux chiffre, reponse explicite a « peut-on perdre quelque chose ? », et sauvegarde. Jamais de merge sur une inconnue de donnees.

### Vetting MCP / skills tiers (avant toute installation)
1. Provenance : editeur identifiable, repo public, adoption reelle (stars/telechargements).
2. Permissions minimales : lecture seule si possible, jamais un scope large "par confort".
3. Test d abord sur un projet jetable, jamais directement sur un projet de prod.
4. 3-5 serveurs MCP actifs MAX au global ; le reste par projet ou par agent.
5. Au moindre doute (skill obscure, demande de credentials) : ne pas installer, demander.
