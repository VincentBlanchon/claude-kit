---
theme: Layout, grille & espacement
type: ui-ux-standard
audience: agent-llm
sources: basti
rules_count: 17
videos_count: 89
---

# Layout, grille & espacement — standards UI/UX

> Règles pour un agent qui construit du front. Agnostique de charte. Appliquer par défaut sauf contrainte projet.

## Règles

- **⭐ R1 — Espacer généreusement : plusieurs centaines de px entre sections sur une landing ; au moindre doute, +20% de padding vertical. Plus d'air sur grand écran.** Pourquoi: le manque de vide est l'erreur n°1 du débutant — des blocs collés étouffent et font « daté ». ✓ De l'air entre groupes, dans et entre les cartes ; exagérer le vertical · ✗ Coller les blocs ou remplir chaque vide par aversion du vide. (src: njXLcyrMMKc, gDG_em0qtC0, CHboIoYXU5A etc.)

- **⭐ R2 — Borner la lecture : `max-width` conteneur (~1200–1440px, marges renforcées au-delà), texte plafonné à ~600–800px (60–75 car./ligne), `line-height ≥ 1.5`.** Pourquoi: un texte pleine largeur sur grand écran est illisible (l'œil perd le début de ligne) et un contenu bord à bord paraît cheap. ✓ Conteneur centré + gouttières, bloc texte ≤ ~700px, interligne aéré · ✗ Étirer un paragraphe/hero jusqu'aux bords. (src: xuBGcm3SLWM, CHboIoYXU5A, GyT7sM3SvFk etc.)

- **⭐ R3 — Aligner paragraphes, listes et grilles à gauche ; même axe sur toutes les pages. Centrage réservé aux titres héros courts (2–4 lignes) et légendes.** Pourquoi: un bloc multi-lignes centré crée un bord gauche en dents de scie qui force l'œil à recalculer chaque ligne. ✓ Fer à gauche pour onboarding, formulaires, listes, cartes · ✗ Centrer un paragraphe/CTA/grille de résultats, ou alterner gauche/centré. (src: wdwxRCUJKk4, wFhs3s7M1YE, NEgct_mJIZE etc.)

- **⭐ R4 — Tout caler sur une échelle de 8 (espacements, paddings, hauteurs, arrondis) ET sur une grille explicite (ex. 12 colonnes, gouttières ~24px), alignements et dimensions réguliers.** Pourquoi: des valeurs au jugé (12/19/42) et des alignements « random » se ressentent immédiatement comme amateurs. ✓ Échelle 8 homogène par catégorie d'élément ; chaque bloc sur des repères partagés · ✗ Paddings arbitraires, marges inégales, cotes bâtardes (31.3/63.88). (src: Iwt1XP4c2DM, H0aZGKzdQas, CwiRIETV2rM etc.)

- **⭐ R5 — Loi de proximité : `padding interne < gap entre composants` ; un élément plus proche de son groupe que du bord.** Pourquoi: si le padding d'une carte égale le gap entre cartes, les éléments flottent sans appartenance. ✓ Rapprocher titre+paragraphe, logo+libellé ; l'écart interne ne dépasse jamais l'externe · ✗ Espacement uniforme qui rattache un libellé au mauvais bloc. (src: nbioxMzxHB4, abrRIgqS7t0, koVpOamlryM etc.)

- **⭐ R6 — Hiérarchie avant décoration et avant l'entassement : l'info clé domine (taille/contraste/position), habillage minimal. Limiter les couches simultanées (≈ une image + un niveau de texte + un gradient par espace).** Pourquoi: une illustration/mascotte qui vole la vedette à la donnée, ou un mur de blocs au même poids, sature et fait « bon marché ». Marque : nom ≈1.5–2× la baseline. ✓ Identifier le dominant à t=0, réduire les mineurs · ✗ Tout au même poids ; image hero + dégradé noir opaque juste pour rattraper le contraste. ⚠ Débat: une densité forte peut signaler « bon plan » sur un e-commerce — ne pas épurer aveuglément sans comprendre la cible. (src: Jb8zWUDd16Q, H0aZGKzdQas, awdZItdAz7E etc.)

- **⭐ R7 — Donner au contenu central le maximum de place entouré de vide ; pas de boîtes imbriquées ni d'overlay qui le recouvre.** Pourquoi: les cadres dans cadres (poupée russe) ou un overlay chargé étouffent le sujet. En mode tâche focalisée (éditeur, exercice), réduire le chrome. ✓ Sujet en grand, large marge, fond neutre · ✗ Empiler boîte dans boîte, ou grande image en arrière-plan derrière le contenu. (src: gDG_em0qtC0, KOS6cHL8E44, 9KbYE1uAgtA etc.)

- **◐ R8 — Une seule idée par strate horizontale (≈80–90% de hauteur d'écran), lue séquentiellement de haut en bas ; ne pas montrer plusieurs strates d'emblée.** Pourquoi: une landing se lit « slide par slide » ; deux slides visibles à la fois cassent le rythme de découverte. ✓ Sections verticales nettes, un message chacune, CTA invitant à scroller · ✗ Mélanger plusieurs messages dans une bande. (src: CHboIoYXU5A, IVFuk2eP77I, koVpOamlryM etc.)

- **◐ R9 — Adapter la densité de la grille au nombre d'items : agrandir les cartes quand ils sont rares, resserrer en multi-colonnes quand ils sont nombreux.** Pourquoi: une densité fixe laisse soit du vide soit un entassement ; sur un classement, des cellules trop hautes ratent l'overview. ✓ Ajuster taille de cellule au nombre à montrer d'un coup · ✗ Même taille que le contenu soit à 2 ou 50 items. (src: 5v-nUs332rM, _qJsGxE_Azg, ZKU6vLJN18U etc.)

- **◐ R10 — Calibrer l'échelle des composants face à un site de référence réel : « tout est trop gros » est le tell n°1 du débutant.** Pourquoi: des tailles surdimensionnées (cartes, boutons, corps) cassent la densité d'info utile. ✓ Screenshoter une référence à côté, réduire (souvent 50–75%), corps ~12–20px, kits iOS/Android pour le natif · ✗ Boutons à 100px, corps à 28px « pour remplir ». (src: GwaW_kUsDWs, Awoo_YRhaS8, Iwt1XP4c2DM etc.)

- **◐ R11 — Layout responsive multi-zone, mobile-first (375px) : les mêmes blocs se réagencent par breakpoint, jamais une version figée par format.** Pourquoi: ~60% du trafic est mobile ; partir du desktop et compresser surcharge le mobile, et multiplier les exports par ratio est coûteux. ✓ Valider hiérarchie en 375px puis enrichir ; positions par breakpoint, scroll page entière sur mobile · ✗ Desktop puis compression en cachant des éléments ; mises en page figées par device. (src: QxXxi-rWF9k, gDG_em0qtC0, wFhs3s7M1YE etc.)

- **◐ R12 — Construire cartes et écrans en frames + auto-layout (fill, gap défini) ; une carte = un composant.** Pourquoi: l'auto-layout impose des espacements cohérents et survit aux changements de contenu ; un placement manuel casse au moindre ajout. ✓ Empiler dans un auto-layout avec gap · ✗ Fausses cartes = rectangles de fond empilés, positionnement libre. (src: z4MaPOCNaXU, WchiZ2lPeoY, 5Fj6DBpqK04 etc.)

- **◐ R13 — Zoning constant sur tout le produit (menu / titre / actions / contenu au même endroit) et en-tête fixe : seul le contenu scrolle, les actions ont une position stable.** Pourquoi: faire bouger titre, actions ou nav d'un écran à l'autre fragilise la confiance et désoriente. ✓ Gabarit fixe via tokens d'espacement, barre haute fixe + contenu scrollable · ✗ Déplacer titre/actions selon l'écran ; CTA qui suivent le contenu et créent des sauts. (src: y1FaqXCaWGc, 3SDoL9iCaHk, I5E4NmtTAT8 etc.)

- **◐ R14 — Concevoir d'abord le zoning (wireframe basse fidélité) : réaffecter les espaces morts, fixer les ratios de surface, valider le flux avant de styliser.** Pourquoi: décider la structure avant l'esthétique évite de tout refaire une fois la charte posée. ✓ Rôle à chaque zone (ex. 2/3 info / 1/3 stats), rectangles bruts nommés, valider, puis habiller · ✗ Couleurs/ombres sur un zoning non validé qui laisse de grands vides. (src: VjQDkMRmnxA, GwaW_kUsDWs etc.)

- **◐ R15 — Conclure un écran d'options par sa/ses 1–2 action(s) principale(s), isolées et agrandies, hors des réglages. Sur cartes/cellules : empiler les infos, jamais coincer deux éléments extensibles sur une ligne.** Pourquoi: une action clé noyée dans les paramètres se perd ; un titre long + une valeur sur la même ligne se télescopent. ✓ Primaire sortie et agrandie (haut sur éditeur) ; titre puis méta empilés, séparés par picto fin (~16px), valeur dominante · ✗ Boutons intercalés entre champs ; « label : value » à deux-points et pointillés. (src: 5Fj6DBpqK04, YEbP-aFbbmg, t4d6dTXLxBk etc.)

- **○ R16 — Liste/grille tranchée : full-largeur partout OU gouttière régulière partout, jamais de mélange ni de trou blanc. Si un bloc est masqué, le layout reflow.** Pourquoi: l'espace perdu non assumé et les trous blancs trahissent une implémentation paresseuse. ✓ Un modèle de carte appliqué à toute la liste, grilles impaires gérées (pas d'orpheline), reflow CSS · ✗ Items qui flottent avec marges irrégulières ; rectangle vide après suppression. (src: z4MaPOCNaXU, ZKU6vLJN18U, FLSDT6_nSFM etc.)

- **○ R17 — Respecter le sens de lecture (gauche-droite / haut-bas), formulaires en une colonne, pas de lecture en Z. Strates à fonds alternés pleine largeur (texte borné en colonne centrée) ; transitions abruptes adoucies par un élément de liaison ; troncature signalée par un léger débord.** Pourquoi: contredire le sens de lecture force l'œil à zigzaguer ; une coupe nette du haut d'un visuel lit comme un bug. ✓ Flux attendu, fonds de section pleine largeur, bande/card de liaison entre strates très différentes · ✗ Lecture en Z ; alternance gauche-droite mécanique sur toute la page ; couper net un visuel. ⚠ Débat: une alternance média+texte modérée reste valide pour rythmer — c'est l'excès sur toute la longueur qui pose problème. (src: Yt2ZV60tyGk, R1DNknJvp64, CwiRIETV2rM etc.)

## Anti-patterns

- ✗ Coller les blocs / rythme vertical serré qui « date » la page ; remplir chaque vide par aversion du vide.
- ✗ Étirer texte ou cartes bord à bord en grand format ; paragraphe pleine largeur au lieu de ~600–800px ; interligne serré (1–1.2).
- ✗ Centrer paragraphes/listes/grilles multi-lignes ; alterner gauche/centré entre pages.
- ✗ Paddings arbitraires hors échelle de 8 ; alignements « random », cotes bâtardes (31.3/63.88).
- ✗ Espacement uniforme : intra-groupe = inter-groupes → appartenance perdue.
- ✗ Tout au même poids visuel ; décoration qui domine la donnée ; image hero + dégradé noir opaque pour rattraper le contraste ; empiler menu + sous-menu + image + dégradé + texte + badges.
- ✗ Cadres dans cadres (poupée russe), image de fond derrière le contenu, overlay qui recouvre le visuel central.
- ✗ « Tout est trop gros » : cartes/footer/boutons surdimensionnés.
- ✗ Desktop compressé pour mobile en cachant des éléments ; contenu mobile confiné dans une zone défilante interne ; exports figés par format.
- ✗ Fausses cartes = rectangles de fond empilés ; positionnement libre sans auto-layout.
- ✗ Zoning incohérent d'une vue à l'autre ; CTA qui suivent le contenu ; nav qui crée des sauts de layout.
- ✗ Démarrer par le style/les couleurs sur un zoning non validé.
- ✗ Actions principales noyées dans les réglages ; deux infos extensibles sur une même ligne ; « label : value » à deux-points et pointillés.
- ✗ Espaces vides irréguliers / orpheline en bas d'une grille impaire ; trou blanc après suppression (pas de reflow).
- ✗ Lecture en Z ou formulaire en colonnes ; alternance gauche-droite mécanique sur toute la page ; coupe nette du haut d'un visuel (effet bug).
- ✗ Plusieurs strates visibles d'emblée sans hiérarchie de découverte.

## Checklist build

- [ ] Conteneur `max-width` (~1200–1440px) + gouttières ; texte ≤ ~600–800px (60–75 car.) ; `line-height ≥ 1.5`.
- [ ] Paragraphes/listes/grilles fer à gauche, même axe partout ; centrage réservé aux titres héros courts.
- [ ] Échelle de 8 (paddings/hauteurs/arrondis) + grille explicite (12 col., gouttières ~24px), dimensions régulières.
- [ ] Loi de proximité : `padding interne < gap entre composants` ; titre près de son contenu.
- [ ] Air vertical généreux entre sections (+20% au moindre doute) ; plus d'air sur grand écran.
- [ ] Une idée par strate (~80–90% de hauteur) ; pas deux strates visibles d'emblée ; CTA de scroll.
- [ ] Info clé dominante, décoration/chrome subordonnés ; ≈ une image + un texte + un gradient par espace ; marque ≥1.5× la baseline.
- [ ] Contenu central entouré de vide, jamais en boîtes imbriquées ni recouvert d'UI.
- [ ] Échelle des composants calibrée sur un site de référence (« tout trop gros » = tell débutant).
- [ ] Responsive multi-zone validé en 375px d'abord, puis enrichi ; mobile = scroll page entière.
- [ ] Cartes/écrans en frames + auto-layout (fill, gap), pas de rectangles empilés.
- [ ] Zoning constant via tokens (menu / titre / actions / contenu) ; en-tête fixe + contenu scrollable ; actions à position stable.
- [ ] Zoning posé en wireframe basse fidélité avant le style ; espaces morts réaffectés.
- [ ] Actions principales isolées et agrandies, hors des réglages.
- [ ] Cartes/cellules : infos empilées, pictos discrets (~16px), pas de « label : value ».
- [ ] Liste tranchée (full-largeur OU gouttière régulière), grilles impaires gérées ; reflow, aucun trou blanc.
- [ ] Sens de lecture respecté, formulaires en une colonne, pas de lecture en Z.
- [ ] Strates à fonds alternés pleine largeur (texte borné centré), transitions adoucies, troncatures signalées.
