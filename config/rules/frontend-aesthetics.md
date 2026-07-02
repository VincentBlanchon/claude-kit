---
paths: ["**/*.tsx", "**/*.jsx", "**/*.css", "**/*.vue", "**/*.svelte", "**/*.html"]
---

## Esthetique frontend (anti-slop)

Regle transverse a tout front (web et mobile). Principe de fond (source : guide officiel Anthropic "Frontend Aesthetics, A Prompting Guide") : le beau se joue dans la METHODE, pas dans l'outil. Par defaut une IA converge vers le generique ("AI slop"), il faut la DIRIGER.

### Avant de coder un ecran : un design plan en 2 passes
1. Poser le plan : 4 a 6 couleurs nommees, 2 roles de typo (une display a caractere utilisee avec retenue + une de texte), et UN seul element SIGNATURE (la seule chose qu'on doit retenir de l'ecran).
2. Auto-critique : "ce plan ressemble-t-il a ce que je sortirais pour n'importe quel autre site du meme genre ?" Si oui, reviser AVANT de coder.

### Regle d'or
Depense ton audace a UN seul endroit. L'element signature porte le caractere, tout le reste reste calme et discipline. L'accumulation d'effets (animations, degrades, glass) fait "sentir l'IA". Avant de livrer, retire un accessoire (Chanel).

### Donner une direction (a l'oeil, sans etre designer)
- Choisir une FAMILLE esthetique nommee plutot que subir le defaut : Editorial Minimalism, Terminal-Core, Warm Editorial, Cinematic Dark, Data-Dense Pro, Neon Brutalist.
- Referencer des marques reelles ("comme Linear, Stripe, A24") et dire POURQUOI ca marche.
- Contraintes negatives explicites dans le prompt (pas d'Inter par defaut, pas de degrade violet, pas des 3 cartes-icones).

### Tells du slop a bannir par defaut
Inter par defaut, degrades violet/indigo, hero centre + 3 cartes-icones, coins en pilule, ombres molles et glow, glassmorphism systematique, emojis decoratifs, em dashes, copy generique ("Unlock the power of", "Seamlessly"), tout centre. Test : si un ecran pourrait etre celui de 20 autres startups, c'est rate.

### Re-thematiser sans coder
Si le projet est sur un design system tokenise (shadcn/ui : couleurs via CSS variables dans un seul fichier), l'editeur de theme visuel no-code `tweakcn` permet de changer toute l'identite a l'oeil et d'exporter les tokens, sans toucher au code des composants.

### Pour aller au fond
Cette regle est le rappel leger, toujours charge. Le detail complet (692 regles UI/UX, 15 themes, ponderees par frequence) vit dans le skill **`designsense`**, a charger sur toute tache front.
