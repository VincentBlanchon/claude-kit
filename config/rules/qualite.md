---
paths: ["**/*.ts", "**/*.tsx", "**/*.js", "**/*.jsx", "**/*.mjs", "**/*.vue", "**/*.svelte", "**/*.css", "**/*.py"]
---

## Standards qualite universels

- Zero warning en lint. Zero erreur de type.
- Pas de `any` en TypeScript — utiliser `unknown` avec type guards.
- Erreurs typees `unknown` dans les catch.
- Pas de duplication — extraire si motif repete 3+ fois.
- Le code est lisible sans commentaires explicatifs.
- Gestion des erreurs complete — pas de happy path only.
- Ne jamais se contenter de "ca marche" — viser l'excellence.
- Toute logique metier DOIT avoir des tests.
