---
theme: Composants, boutons & CTA
type: ui-ux-standard
audience: agent-llm
sources: basti, jakub
rules_count: 21
videos_count: 138
---

# Composants, boutons & CTA — standards UI/UX

> Règles pour un agent qui construit du front. Agnostique de charte. Appliquer par défaut sauf contrainte projet.
> Pondération par fréquence (source_id distincts) : ⭐ 3+ · ◐ 2 · ○ 1. ⚠ = contradiction tranchée par fréquence.

## Règles

- **⭐ R1 — Une seule forme de bouton/carte sur toute l'interface : un rayon d'arrondi, une épaisseur de contour, une casse, accordés au logo et à la DA ; la nav suit le langage des CTA.** Pourquoi: panacher arrondis/contours/casses trahit l'absence de design system et fait cheap. ✓ primaire + secondaire en composants uniques, rayon unique sur cards/boutons/images · ✗ arrondis 4/8/16/20px mêlés, MAJ et minuscule, coins pointus quand le brand est arrondi. (src: xuBGcm3SLWM, wdwxRCUJKk4, cY4w3Um2RJI etc.)

- **⭐ R2 — Trancher l'arrondi : faible/carré (≈4px) OU pill/full-round ; jamais l'entre-deux « presque-rond ». Réserver la pill aux actions isolées (deux pills accolées creusent des vides).** Pourquoi: le rayon intermédiaire se lit comme une erreur, pas un choix. ✓ radius 0/léger OU 9999px · ✗ rayon qui approche le cercle sans l'atteindre. (src: uXiT_wTtMF8, oummVionT88, TU5sjJUjMy4 etc.)

- **⭐ R3 — UN seul CTA primaire saillant par écran/carte ; hiérarchiser primaire/secondaire par DÉCLINAISON d'une couleur (plein vs contour/ghost ; secondaire = fond ~10%), pas par une teinte nouvelle.** Pourquoi: deux boutons de poids égal se neutralisent ; une couleur par action crée le « bordel ». ✓ un accent sur le CTA de conversion, secondaire en variante de la même couleur · ✗ boutons saturés alignés, teinte distincte par bouton, gros contour qui rivalise. (src: Jb8zWUDd16Q, NRvroyLcZ1M, 7LG3jL_7NZY etc.)

- **⭐ R4 — Tout élément interactif a des états distincts (idle, hover, pressed, focus, loading, disabled) ; l'affordance AUGMENTE à l'activation. Tout cliquable a un hover + curseur pointer, même sans forme de bouton.** Pourquoi: sans hover un bouton paraît inerte ; s'assombrir/désaturer/se vider au survol communique une perte d'importance ; un saut de fonte décale la mise en page. ✓ hover = contraste/élévation renforcés (teinte plus foncée), pressed = enfoncement, loading = label→indicateur · ✗ désaturer/inverser au hover, hover sur décoratif ou absent sur un vrai bouton. (src: iWUOlfq51qk, NRvroyLcZ1M, nbioxMzxHB4 etc.)

- **⭐ R5 — Réduire les actions visibles simultanément ; hiérarchiser par taille/graisse/espace, regrouper au même endroit stable, reléguer les rares dans un menu « … »/burger, révéler les actions de carte au hover.** Pourquoi: trop d'options surcharge et brouille la lisibilité. ✓ 2-4 options principales + overflow, actions de carte au hover · ✗ 3-4 boutons concurrents, modifier/supprimer sur chaque ligne. (src: njXLcyrMMKc, iXpoUKPJ19I, iIX8QZO074o, Z5TjBuYUmNI etc.)

- **⭐ R6 — Accent STRICTEMENT sur les zones cliquables (CTA, liens, icônes actives, ~20% max) ; textes/titres en encre neutre. Couleurs en tokens sémantiques, jamais de hex en dur.** Pourquoi: l'accent partout perd son emphase ; un texte teinté se lit comme faussement cliquable ; sans tokens, dark mode/rebranding ingérables. ✓ variables sémantiques, accent = signal de cliquabilité · ✗ #FFF/#000 dans chaque composant, accent sur du texte de contenu. (src: SD4slXmeeC4, eHK2z8E54Js, raTOEwuU71g, 8b1I7Gk-fss etc.)

- **⭐ R7 — Tout élément répété (carte, cellule, item de nav, badge, tooltip, overlay) = un VRAI composant réutilisable paramétrable (variantes d'état, slots, instances liées), jamais du copier-coller de calques.** Pourquoi: sans master unique, chaque ajustement se refait à la main et dérive en incohérences. ✓ composant maître + variantes instancié · ✗ dupliquer puis éditer bloc par bloc. (src: raTOEwuU71g, eHK2z8E54Js, 5v-nUs332rM etc.)

- **⭐ R8 — Icônes : un seul stroke, géométrie/densité/taille homogènes, même grille ; tout en trait OU tout en plein ; padding interne constant ; taille canonique réutilisée d'un écran à l'autre.** Pourquoi: stroke/style/tailles disparates trahissent l'absence de système et font cheap ; une icône collée au bord paraît mal posée. ✓ stroke unique, set cohérent, marge interne régulière · ✗ illustrées + outline mêlées, intrus plein dans un set trait, tailles 36/44 selon l'écran. (src: nbioxMzxHB4, RH3lSB5xtCM, Z5TjBuYUmNI etc.)

- **⭐ R9 — Profondeur par l'ombre douce, avec PARCIMONIE et un seul système : drop-shadow réservé aux vraies élévations (overlay, modale, carte de même couleur que son fond). Si un contraste de fond crée déjà la hiérarchie, retirer l'ombre ; préférer un stroke intérieur fin (1-10%) ; ombres OU glassmorphisme, jamais les deux.** Pourquoi: une ombre sur un bloc inerte le fait passer pour un bouton ; les ombres dures (noir 25%) font « Android à l'ancienne ». ✓ shadow douce/teintée sur les vrais overlays, sinon contraste/stroke fin · ✗ ombre sur chaque carte déjà détachée, ombre dure, mix ombre + verre. (src: jakub, fB9pJG5YVY8, WchiZ2lPeoY etc.)

- **⭐ R10 — Rendre TOUTE la carte/cellule cliquable (pas seulement le titre), avec un hover clair ; supprimer le CTA verbeux redondant (« Lire l'article », « En savoir plus ») répété sur chaque carte.** Pourquoi: si seul le titre est cliquable mais que la carte paraît interactive, l'utilisateur clique à vide et croit le site cassé. ✓ toute la carte = une cible avec hover · ✗ clic limité au texte, « Lire l'article » sur chaque vignette. (src: Jb8zWUDd16Q, E1McbVSPhUI, Awoo_YRhaS8 etc.)

- **⭐ R11 — Tout CTA porte un VERBE d'action concis (« Réserver », « Créer une session ») ; jamais un nom nu, un adjectif, un état, un prix, ni un picto seul ; libellé court.** Pourquoi: un nom seul, un prix ou un picto ne dit ni qu'il est cliquable ni ce qui va se passer ; un libellé surchargé dilue l'action. ✓ action en toutes lettres · ✗ nom/adjectif/prix seul, picto seul, libellé alourdi. (src: Jb8zWUDd16Q, NRvroyLcZ1M, AYFNcAfpyOA etc.)

- **⭐ R12 — Padding horizontal généreux et constant (4 côtés), hauteur de touch réelle, largeur hug (ajustée au texte) ; CTA principal mobile en pleine largeur.** Pourquoi: un texte collé aux bords paraît à l'étroit ; un CTA ~37-40px ou étriqué paraît rachitique. ✓ padding généreux, largeur hug desktop, full-width mobile · ✗ texte aux bords, bouton ~40px, largeur fixe arbitraire. (src: xuBGcm3SLWM, 8b1I7Gk-fss, yV4PUOHzuJk etc.)

- **⭐ R13 — Bouton-icône (sans libellé) : toujours un tooltip ou label ; picto à métaphore univoque et distinct par fonction. Le texte prime quand le sens n'est pas évident.** Pourquoi: une icône seule est ambiguë (croix = fermer/effacer ≠ corbeille ; triangle = play ≠ développer) ; réutiliser un picto pour deux actions trompe. ✓ tooltip sur chaque picto isolé, un symbole par action · ✗ rangée de pictos nus, même picto pour deux actions, icône décorative devant les titres. (src: nbioxMzxHB4, RH3lSB5xtCM, YEbP-aFbbmg etc.)

- **⭐ R14 — Navigation principale toujours visible : tab bar basse mobile (3-5 destinations, icône + label, tailles natives), nav horizontale haute desktop. Action prioritaire permanente (ex. « Faire un don ») en CTA sticky flottant, pas entassée dans la tab bar.** Pourquoi: cacher la nav sous un burger ou en icon-only effondre la découvrabilité ; surdimensionner la tab bar l'alourdit. ✓ tab bar fixe icône+label, indicateur actif englobant, CTA sticky hors-nav · ✗ burger sur app utilitaire, tab bar icon-only ou surdimensionnée. (src: Jb8zWUDd16Q, sg-GUYLlQ4E, cyy_yJdK1Zw, cY4w3Um2RJI etc.)

- **◐ R15 — Rayons concentriques accordés : R_intérieur = R_extérieur − padding/épaisseur. Éviter l'effet « boomerang » d'un même rayon dedans/dehors.** Pourquoi: un rayon identique int/ext écrase la forme et crée un liseré inégal qui « sonne faux ». ✓ R_int = R_ext − E (cards imbriquées, icônes-dans-boutons) · ✗ même rayon partout, coin carré dans un cadre arrondi. (src: 5IIIiIeTKSE, fB9pJG5YVY8, Awoo_YRhaS8 etc.)

- **◐ R16 — Détacher cartes/cellules sur fond clair par un soupçon de contraste : fond légèrement teinté OU stroke fin 1-2% OU ombre très douce. Sur fond gris, contenu en cartes blanches (jamais l'inverse) ; whitespace/séparateur 1px discret plutôt qu'un trait foncé.** Pourquoi: blanc-sur-blanc est plat ; une carte sans écart au fond ne crée aucune hiérarchie. ✓ fond teinté/stroke/ombre légère, blanc sur gris · ✗ cartes blanches sur #FFF sans séparation, trait foncé entre cellules. (src: jakub, fB9pJG5YVY8, 03odlgh212A etc.)

- **◐ R17 — Hiérarchiser une carte sans tout grossir : proximité (figure ancrée à son label), donnée la plus UTILE en plus gros, secondaire (tags) en dessous, ferré à gauche, dégradé de gris/poids. Ne jamais centrer le texte dans une carte/bloc.** Pourquoi: faire ressortir la plus jolie info plutôt que la plus utile inverse la priorité ; le centrage casse l'alignement de lecture. ✓ infos mappées par importance, ferré à gauche · ✗ taille pilotée par l'esthétique, prix > nom (hors low-cost assumé), texte centré. (src: Jb8zWUDd16Q, 03odlgh212A, EEnmrw-xutg etc.)

- **◐ R18 — Carrousel/slider : jamais la seule nav ni en auto-défilement ; ajouter des flèches/affordances visibles (le drag ne se devine pas). Sur mobile préférer la verticalité ; un hover-révèle vaut mieux qu'un slider quand c'est possible.** Pourquoi: un slider sans flèche n'est pas découvrable ; un carrousel auto agace et masque du contenu. ✓ slider à flèches, débordement scrollable · ✗ carrousel comme seule nav, auto-défilement, slider là où un hover suffirait. (src: CHboIoYXU5A, FPtXFeQUns0, gsSXn8EQmgk, ui-kk5LIMss)

- **◐ R19 — Overlay/popup/modale : scrim semi-transparent + clic-extérieur + sortie explicite (croix/CTA), animé en entrée depuis un bord. Pour une action protégée, modale contextuelle « connectez-vous pour [action] » plutôt qu'un changement de contexte.** Pourquoi: le scrim focalise, le clic-extérieur est l'attendu ; un bloc sans sortie laisse l'utilisateur coincé. ✓ scrim + click-outside + croix, slide-in, login en modale · ✗ popup sans scrim ni échappatoire, bascule brutale d'écran. (src: WZ5Axl2noSA, YEbP-aFbbmg, -mnsobvWmKk etc.)

- **◐ R20 — Action destructive : ⚠ suppression réversible via toast « Annuler » temporisé (~5-10s), PAS une confirmation modale systématique ; réserver la confirmation aux pertes lourdes/irréversibles.** Pourquoi: l'undo optimiste (façon Gmail) garde le flux fluide ; un « êtes-vous sûr ? » à chaque suppression interrompt inutilement. ⚠ 1 src préfère le popup systématique — écarté (2 vs 1). ✓ supprimer + toast undo · ✗ croix de suppression nue trop accessible, modale sur chaque suppression de routine. (src: YEbP-aFbbmg, tXVaiSLSbho — ⚠ contre Yt2ZV60tyGk)

- **◐ R21 — Distinguer cliquable vs non-cliquable : un badge/tag d'info ne ressemble pas à un bouton, et inversement. Un ghost reste un vrai bouton (zone cliquable, padding, hover) ; un disabled n'a pas de hover ; une chip sélectionnée = capsule pleine, non-sélectionnée = contour.** Pourquoi: un badge cadré comme un bouton trompe ; un état sélectionné doit être sans ambiguïté. ✓ forme distincte boutons vs décoratif, chip active pleine · ✗ badge non-cliquable encadré, deux gris bâtards pour primaire/secondaire. (src: GH6EtS7-oN0, jEVX1lOFCIU, BfvBEI-FaIQ etc.)

## Checklist build

- [ ] Un seul rayon/contour/casse pour tous les boutons, accordé au logo/DA ; nav alignée sur les CTA ; arrondi tranché (carré OU pill, pas d'entre-deux).
- [ ] Un seul CTA primaire saillant par écran ; secondaire = déclinaison de la même couleur (plein/contour), pas une teinte nouvelle.
- [ ] États idle/hover/pressed/focus/loading/disabled définis ; affordance croissante à l'activation ; curseur pointer ; pas de hover sur décoratif/disabled.
- [ ] Accent réservé aux cliquables (~20% max), textes neutres ; couleurs en tokens, aucun hex en dur ; tout élément répété = composant paramétrable.
- [ ] Icônes : stroke unique, set cohérent (tout trait OU tout plein), même grille/taille/padding ; ombre douce avec parcimonie, un seul système (ombre OU verre) ; rayons concentriques accordés (R_int = R_ext − padding).
- [ ] Toute la carte cliquable avec hover, sans CTA verbeux redondant ; carte hiérarchisée par utilité, ferrée à gauche, jamais centrée ; détachée du fond (teinte/stroke 1-2%/ombre légère).
- [ ] Chaque CTA = un verbe court ; padding généreux constant, hauteur de touch réelle, largeur hug ; CTA principal mobile full-width.
- [ ] Bouton-icône avec tooltip/label, picto univoque ; tab bar visible (3-5, icône+label) ; action prioritaire hors-nav en CTA sticky.
- [ ] Carrousel non auto, à flèches, pas seule nav ; overlay = scrim + clic-extérieur + sortie, animé ; suppression réversible via toast undo.
- [ ] Cliquable vs non-cliquable distinct (badge ≠ bouton, ghost = vrai bouton, chip sélectionnée en capsule pleine).

## Compléments concrets — src: jakub

> Source : [jakub.kr / make-interfaces-feel-better](https://jakub.kr/writing/details-that-make-interfaces-feel-better).

- **Profondeur par l'ombre plutôt que la bordure.** Une `box-shadow` subtile multi-couches donne plus de profondeur qu'un `border` et s'adapte à tout fond (transparence). Réf : `0 0 0 1px rgba(0,0,0,.06), 0 1px 2px -1px rgba(0,0,0,.06), 0 2px 4px 0 rgba(0,0,0,.04)` ; au hover, assombrir légèrement (mettre `box-shadow` en transition).
- **Rayon concentrique.** Pour des éléments imbriqués : rayon extérieur = rayon intérieur + padding (ex. 20px = 12px + 8px). Des rayons mal accordés font « sonner faux ».
- **Alignement optique > géométrique.** Quand le centrage mathématique « paraît off » : bouton texte+icône → padding plus petit côté icône ; corriger idéalement dans le SVG. Liseré d'image : `outline:1px solid rgba(0,0,0,.1); outline-offset:-1px;` (blanc à 10% en dark) pour un contour de profondeur cohérent.
