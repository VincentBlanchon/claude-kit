## Securite

- Valider tous les inputs externes (API, formulaires, webhooks).
- Auth check au debut de chaque route handler API.
- Jamais de secrets dans le code — variables d'environnement.
- Rate limiting sur les endpoints sensibles.
- Pas de donnees sensibles dans les logs.
