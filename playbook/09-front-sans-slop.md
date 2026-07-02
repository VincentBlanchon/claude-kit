# 09. Du front sans slop

## Le constat

Livré à lui-même, un agent converge vers l'interface générique : la même que celle de vingt autres projets sortis le même jour. Ce n'est pas un manque de capacité, c'est une régression vers la moyenne de ce qu'il a vu. Le « AI slop » a une signature si constante qu'elle se détecte au premier regard.

**Les tells classiques à bannir explicitement** : la police par défaut du moment (Inter partout), les dégradés violet/indigo, le hero centré avec ses trois cartes à icônes, les coins en pilule systématiques, les ombres molles qui « glowent », le glassmorphism plaqué, les emojis décoratifs, la copy creuse (« Libérez la puissance de… »). Le test : si l'écran pourrait être celui de vingt autres startups, c'est raté.

La bonne nouvelle : **le beau se joue dans la méthode, pas dans l'outil.** Diriger l'agent suffit à sortir du générique.

## La méthode : un design plan avant de coder

Avant tout écran, deux passes :

**Passe 1 : poser le plan.**
- 4 à 6 couleurs **nommées** (pas « une palette moderne » : des valeurs, avec leurs rôles)
- 2 rôles typographiques : une display à caractère, utilisée avec retenue, et une police de texte
- UN élément **signature** : la seule chose qu'on doit retenir de l'écran

**Passe 2 : l'auto-critique.** « Ce plan ressemble-t-il à ce que je produirais pour n'importe quel autre site du même genre ? » Si oui, réviser AVANT de coder. C'est la passe que tout le monde saute et qui fait toute la différence.

## La règle d'or : l'audace à UN seul endroit

Dépense ton originalité sur l'élément signature ; tout le reste reste calme et discipliné. L'accumulation d'effets (animations partout, dégradés, verre dépoli, glow) est précisément ce qui « sent l'IA ». Avant de livrer, retire un accessoire.

## Diriger sans être designer

Tu n'as pas besoin de savoir dessiner, tu as besoin de savoir **nommer** :

1. **Une famille esthétique** plutôt que le défaut : Editorial Minimalism, Terminal-Core, Warm Editorial, Cinematic Dark, Data-Dense Pro, Neon Brutalist… Nommer une famille, c'est éliminer 90 % du générique d'un coup.
2. **Des références réelles** : « comme Linear », « comme Stripe », « comme A24 », en disant POURQUOI (la densité, la froideur précise, le contraste éditorial).
3. **Des contraintes négatives explicites** : pas d'Inter, pas de dégradé violet, pas de hero à trois cartes. L'agent respecte remarquablement bien les interdits nommés.
4. **Un rôle** : « tu es directeur artistique senior, exigeant, qui déteste le générique ».

## La chaîne complète sur un vrai projet

1. **Verrouiller la direction artistique une fois** : palette, typos, ambiance, réfs, dans un `DESIGN.md` à la racine. Ensuite elle est **gelée** : tout écran en découle, aucun écran ne la renégocie.
2. **Charger les standards à chaque tâche UI.** Le skill `designsense` du kit contient ~700 règles pondérées par thème (layout, typo, couleur, composants, motion, landing, mobile…) : il cadre l'exécution au niveau du détail, là où la DA cadre l'intention.
3. **Un design system dans le code** : les composants de base vivent dans `src/components/ui/`, validés une fois, réutilisés partout. Jamais de CSS improvisé écran par écran.
4. **La preuve visuelle** (chapitre 04) : desktop, mobile, états vides/erreur/chargement, dans un vrai navigateur, avant tout merge.

## Le motion, l'oublié qui fait le premium

Une page pixel-perfect mais figée perd l'essentiel de la qualité perçue. Hover, transitions, entrées de page : des valeurs sobres et cohérentes (150-300 ms, easing standard), partout, plutôt qu'un feu d'artifice à un endroit. Attention au passage maquette → code : une maquette statique ne porte pas le motion, il faut le spécifier en notes et le ré-injecter à l'implémentation, sinon il disparaît.

## Re-thématiser sans tout recoder

Si le projet est sur un design system tokenisé (shadcn/ui : les couleurs vivent dans des variables CSS d'un seul fichier), changer toute l'identité visuelle = changer les tokens. Des éditeurs visuels comme tweakcn permettent de le faire à l'œil et d'exporter les variables, sans toucher au code des composants. Autrement dit : investis dans les tokens au départ, et la direction artistique reste renégociable à coût quasi nul.
