---
theme: Hiérarchie visuelle & typographie
type: ui-ux-standard
audience: agent-llm
sources: basti, jakub
rules_count: 17
videos_count: 78
---

# Hiérarchie visuelle & typographie — standards UI/UX

> Règles pour un agent qui construit du front. Agnostique de charte (les noms de polices = exemples, jamais une imposition). Appliquer par défaut sauf contrainte projet.
> Pondération = nombre de sources distinctes : ⭐ 3+ · ◐ 2 · ○ 1. ⚠ = contradiction/nuance à arbitrer.

## Règles

### Hiérarchie & échelle

- **⭐ R1 — Établir ≥3 niveaux typo nettement distincts (titre / label-sous-titre / corps), hiérarchisés par taille ET graisse ; la plus grande taille au concept clé.** Pourquoi: des tailles voisines (24/20/14.5) semblent « la même chose » et la page paraît plate. ✓ Écart franc à chaque cran ; H1 > H2 > corps. ✗ Empiler des tailles proches ; H2 > H1. (src: QxXxi-rWF9k, 8WFeiimrqrI, wFhs3s7M1YE, etc.)

- **⭐ R2 — Caler le corps aux tailles réelles du web : ~15-16px (max ~20), jamais 24-32px ; titres seuls en grande taille.** Pourquoi: dézoomé dans Figma on gonfle le texte sans le voir ; à 1:1 ça paraît « dodu » et amateur. ✓ Benchmark sur un vrai site (Stripe, Discord) à 100 %. ✗ Corps à 24-32px partout ; corps à 11px (illisible). (src: dzW12tU39ts, GH6EtS7-oN0, M7iGo-Lu4MY, etc.)

- **⭐ R3 — Texte dur à lire → augmenter interligne/espacement AVANT la taille ; viser ~150-175 % de line-height sur les paragraphes.** Pourquoi: la gêne vient du tassement, pas d'une fonte trop petite ; gonfler la taille casse l'échelle. ✗ Interligne serré (100-110 %) sur de longs blocs. (src: wFhs3s7M1YE, M7iGo-Lu4MY, 4aZA8E9tldA, etc.)

- **◐ R4 — Adapter la taille au volume de contenu variable par paliers (seuils de caractères), pas une taille fixe.** Pourquoi: une taille fixe rend les contenus courts minuscules et fait déborder les longs. ✓ Ex. 24 court / 20 standard / plus petit cas extrêmes, calés sur le cas majoritaire. (src: VjQDkMRmnxA, 5v-nUs332rM)

- **○ R5 — Indexer la taille du texte sur son rôle sémantique (lien, label, titre), jamais sur la taille de son conteneur.** ✗ Agrandir le label parce que le bouton est grand. (src: 8WFeiimrqrI)

### Alignement

- **⭐ R6 — Ferrer titres ET paragraphes à gauche (ragged-right) ; ne JAMAIS justifier sur le web.** Pourquoi: l'arête verticale gauche structure la lecture (raison n°1 d'un rendu pro) ; le centré force l'œil à rechercher chaque début de ligne ; le justifié crée des « rivières blanches ». ✓ Fer à gauche, intermot constant. ✗ Centrer/justifier du multi-lignes ; ferrer à droite. (src: CHboIoYXU5A, 5Fj6DBpqK04, H0aZGKzdQas, wFhs3s7M1YE, etc.)

- **◐ R7 — Centrage réservé aux headlines courts (1-2 mots / hero isolé), « à la Apple » : coupures contrôlées en triangle inversé, zéro mot orphelin.** ✗ Centrer un titre long en zigzag aléatoire. (src: Dkc4j6jrzY4, CHboIoYXU5A)

### Choix & nombre de fontes

- **⭐ R8 — Limiter à 1-2 familles (option 3ᵉ d'accent si rôle clair) ; décliner par graisse/taille plutôt qu'empiler des familles.** Pourquoi: multiplier les fontes fragmente l'identité ; les sites réussis n'en ont que deux. ✓ Même genre de police entre titre et sous-titre d'un même bloc. ✗ Changer de fonte à chaque section/niveau. (src: gDG_em0qtC0, Ff-hHf15kv4, 44L6uJKFg_4, etc.)

- **⭐ R9 — Séparer les rôles : display à caractère pour les titres courts ; sans-sérif neutre et lisible (Inter, DM Sans, Space Grotesk…) pour corps et UI.** Pourquoi: une display à 80px+ devient illisible en label 12-14px ; deux neutres de taille proche donnent l'effet « même fonte ». ✓ Assigner chaque fonte à un rôle et le tenir. ✗ Composer paragraphes/labels avec la fonte de titre. (src: wdwxRCUJKk4, BfvBEI-FaIQ, 44L6uJKFg_4, etc.)

- **⭐ R10 — Changer la typeface est le levier n°1 pour quitter le look générique : remplacer la fonte système par une display distinctive en titre/marque.** Pourquoi: une fonte système à plat (Roboto/Arial à défaut, centrée, espacement par défaut) est le « tell » d'une page faite par un dev. ⚠ Nuance vs R9 : Inter/SF Pro restent recommandées pour le CORPS/UI ; cette règle vise leur usage comme fonte de TITRE par défaut. (src: b4nk4Rw7YLQ, njcLhEd3rd0, _WqNosaKmos, etc.)

- **◐ R11 — Accorder la fonte au produit, au secteur ET à sa durée de vie : neutre/grotesque pour un outil ou un système durable, à caractère pour une marque forte ; fuir la fonte « tendance » qui datera.** Pourquoi: la fonte porte le positionnement ; une décorative à la mode paraîtra datée dans deux ans, et une serif vintage sur une app pro tue la crédibilité. ✓ Marque à héritage → garder 1-2 traits singuliers et moderniser avec retenue. ✗ Police générique sans rapport avec la DA du logo. (src: 5scZtI4rwBA, 2S9ScSXzBNM, GwaW_kUsDWs, 40Tzo3D5UX0, etc.)

- **◐ R12 — Valider une fonte sur toutes ses déclinaisons (pangramme complet, regular/condensed/variable) ET sur le support cible réel — écran à la taille de corps, pas un poster/mockup HD.** Pourquoi: les démos n'exposent que les 3-4 plus beaux glyphes ; une display superbe en poster perd sa lisibilité en petit corps. ✓ Tester sur fond clair/sombre, vérifier le hinting écran. ✗ Se fier à la page de démo. (src: d2r7Jkxv0Vg, gDG_em0qtC0, CwiRIETV2rM)

### Casse, graisse, couleur

- **⭐ R13 — Casse mixte (sentence/title case) par défaut ; capitales réservées aux courts labels (avec un léger letter-spacing). Ne pas colorer/souligner les titres ni mettre un mot en bicolore.** Pourquoi: le tout-majuscules « crie » ; le titre bicolore/souligné fait « cheap » et nuit à l'accessibilité. ✓ Emphase par le poids (bold) ou la taille ; titres en neutre foncé. ✗ H1 ou paragraphe en MAJUSCULES ; mot coloré « parce qu'il faut du rouge ». (src: xuBGcm3SLWM, wFhs3s7M1YE, H0aZGKzdQas, JYEhyqjt2Ag, etc.)

### Espacement fin (titres)

- **⭐ R14 — Sur les grands titres, resserrer interlettrage (tracking ~-2 à -6 %) et interligne (leading négatif) ; laisser le corps en tracking neutre.** Pourquoi: un grand titre par défaut paraît mou et éparpillé ; le serrer le densifie. ✗ Étaler les lettres du corps/menu (effort inutile qui dégrade la lecture). (src: 8WFeiimrqrI, GH6EtS7-oN0, GyT7sM3SvFk, etc.)

### Lisibilité & rendu

- **⭐ R15 — Garantir le contraste texte/fond : assombrir le gris secondaire, monter le poids sur photo/fond coloré, bannir l'ultra-light en corps et le clair sur clair.** Pourquoi: un gris délavé ou un poids trop fin ruine la lecture, surtout sur média. ✓ Tester noir ET blanc sur le fond cible ; extrêmes réservés aux titres. ✗ Labels en ultra-light « parce que c'est joli ». (src: gDG_em0qtC0, GwaW_kUsDWs, -mnsobvWmKk, etc.)

- **◐ R16 — Vérifier les métriques de la fonte en composant réel (tab bar, tag) et caler le vertical trim (cap-to-baseline) ; pas de monospace en paragraphe ni de texte figé dans un bitmap.** Pourquoi: line-height anormal et désalignement icône/label cassent une nav ; le mono casse le rythme de lecture ; le bitmap tue SEO/sélection/accessibilité. ✓ Mono réservé aux micro-contenus techniques/démo ; vrai texte stylable (CSS/SVG). (src: -V2LUoHsZn0, 8WFeiimrqrI, k2I3Q-svoHM, 5v-nUs332rM, etc.)

### Largeur, retours à la ligne, responsive

- **◐ R17 — Borner la largeur du corps (~60-80 car./ligne, 1 colonne) et gérer les retours en largeur contrainte (line-clamp sur titres de card) ; prévoir une échelle typo dédiée au mobile.** Pourquoi: un paragraphe full-width est pénible à lire ; un titre libre casse l'alignement d'une grille ; rapetisser le desktop ne suffit pas sur mobile. ✗ Texte full-width ; titre de card non clampé ; échelle desktop laissée au navigateur. (src: nbioxMzxHB4, gDG_em0qtC0, 5v-nUs332rM, GLh_s13vA_o, etc.)

### Logotype & lettering

- **⭐ R18 — Un logotype exige un vrai lettering (custom, condensé, étiré, sens caché), pas une police d'étagère brute ; soigner la correction optique et garder une famille homogène sur les sous-logos.** Pourquoi: une fonte standard produit un wordmark plat ; l'œil perçoit les rondes (O,C,S) plus petites → overshoot ; un kerning algorithmique rend le titre froid ; un trait trop fin « tombe » en miniature. ✓ Kerning manuel (VA, AV, WA, LT), test 16px + timbre-poste, axe d'inclinaison cohérent ; définir la typo de charte AVEC le logo. ✗ Google Font brute en 30 s ; ultra-light en logo ; sous-logo dans une autre fonte/casse. (src: 5scZtI4rwBA, njcLhEd3rd0, t4N0wf6pCf4, z4MaPOCNaXU, etc.)

## Anti-patterns

- ✗ Tailles voisines (24/20/14.5) → page plate ; H2 > H1.
- ✗ Corps à 24-32px (design dézoomé) → « dodu » ; ou 11px → illisible.
- ✗ Grossir la police au lieu d'aérer.
- ✗ Paragraphes centrés ou justifiés → zigzag, rivières blanches, mots orphelins ; ferrés à droite.
- ✗ 3-4 familles ou changement de fonte par section → patchwork ; display en paragraphes ; deux neutres proches → effet « même fonte ».
- ✗ Fonte système à plat en titre/marque → « fait par un dev » ; fonte tendance/enfantine sur produit pro ; police sans rapport avec le logo.
- ✗ Tout en MAJUSCULES par défaut ; titres colorés/soulignés/bicolores.
- ✗ Tracking par défaut (mou) sur grand titre ; tracking boosté sur le corps.
- ✗ Gris délavé, ultra-light en corps, clair sur clair.
- ✗ Monospace en paragraphes ; texte figé en bitmap.
- ✗ Corps full-width ; titre de card non clampé.
- ✗ Fonte validée sur sa page de démo / mockup HD, sans pangramme ni support cible ; choisie sans test en composant.
- ✗ Logotype = police brute ; ultra-light ou axe incohérent en miniature.

## Checklist build

- [ ] ≥3 niveaux typo (titre / label / corps), écart de taille ET graisse net ; H1 > H2 > corps.
- [ ] Corps 15-16px (max ~20), benchmarké sur un vrai site à 100 % ; rien à 24-32px ni 11px.
- [ ] Line-height 140-175 % sur les paragraphes ; gêne corrigée par l'espacement avant la taille.
- [ ] Paragraphes (>1-2 lignes) ferrés à gauche ; centrage limité aux headlines courts ; AUCUN justifié.
- [ ] ≤2 familles (option 3ᵉ d'accent) ; display en titres ≠ sans-sérif neutre en corps/UI, chaque fonte a un rôle.
- [ ] Fonte cohérente produit/secteur/durée de vie ; fonte de titre choisie consciemment (pas système par défaut).
- [ ] Casse mixte par défaut ; titres en neutre foncé, sans couleur/soulignage/bicolore ; léger spacing sur petits caps.
- [ ] Tracking négatif sur grands titres, neutre sur le corps.
- [ ] Contraste vérifié (noir ET blanc sur le fond) ; pas d'ultra-light en corps.
- [ ] Métriques testées en composant réel + vertical trim ; pas de monospace en paragraphe ni texte en image.
- [ ] max-width corps (~60-80 car., 1 col.) ; titres de card clampés ; échelle typo dédiée mobile.
- [ ] Logotype = vrai lettering, glyphes lisibles isolés, correction optique (overshoot, kerning VA/AV, test 16px + timbre-poste) ; typo de charte définie avec le logo.
- [ ] Fonte validée sur pangramme complet ET support cible (écran à la taille réelle, pas un poster).

## Compléments concrets — src: jakub

> Source : [jakub.kr / make-interfaces-feel-better](https://jakub.kr/writing/details-that-make-interfaces-feel-better).

- **Équilibrer les titres, soigner les paragraphes.** `text-wrap: balance` sur les titres (lignes de longueur homogène) ; `text-wrap: pretty` sur les paragraphes (évite le mot orphelin en fin de bloc).
- **Lissage du texte.** `-webkit-font-smoothing: antialiased` en global → rendu légèrement plus fin et net.
- **Chiffres qui changent → largeur fixe.** `font-variant-numeric: tabular-nums` sur compteurs, prix, timers, tableaux (les chiffres ne « sautent » plus). Note : certaines polices (Inter) modifient le dessin des chiffres avec cette option.
