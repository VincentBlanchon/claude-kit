## Securite

- Valider tous les inputs externes (API, formulaires, webhooks).
- Auth check au debut de chaque route handler API.
- Jamais de secrets dans le code — variables d'environnement.
- Rate limiting sur les endpoints sensibles.
- Pas de donnees sensibles dans les logs.
- Avant TOUT changement touchant des donnees reelles (fichiers, base, prod) : etat des lieux chiffre, reponse explicite a « peut-on perdre quelque chose ? », et sauvegarde. Jamais de merge sur une inconnue de donnees.
