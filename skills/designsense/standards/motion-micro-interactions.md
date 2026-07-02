---
theme: Motion & micro-interactions
type: ui-ux-standard
audience: agent-llm
sources: basti, jakub, transitions.dev, gabriell_lab
rules_count: 18
videos_count: 70
---

# Motion & micro-interactions — standards UI/UX

> Règles pour un agent qui construit du front. Agnostique de charte. Appliquer par défaut sauf contrainte projet.
> Pondération par fréquence : ⭐ = 3+ sources distinctes · ◐ = 2 · ○ = 1. ⚠ = contradiction/débat à arbitrer.

## Règles

- **⭐ R1 — Animer 1 à 3 éléments porteurs de sens par vue/section, le reste statique.** Pourquoi: tout animer dilue l'attention et fait basculer le rendu de premium vers cheap. ✓ Concentrer le soin sur 2-3 points à haute valeur · ✗ Apparition sur chaque bloc au scroll. (src: D0wU2bpHzmw, FVEqE47pOLw, 8b1I7Gk-fss, etc.)

- **⭐ R2 — Toute animation doit communiquer une info, incarner une action ou créer une émotion — jamais animer pour bouger.** Pourquoi: le motion gratuit ressent comme du lag et du bruit, un bon micro-effet clarifie. ✓ Réserver les effets pour révéler/clarifier (libellé, état) · ✗ Fondus/zooms génériques ou gestes décoratifs sans rapport avec l'action. (src: PENmi8HdY6Q, kah5ywUuYAQ, XyYYLiOv4Yc, etc.)

- **⭐ R3 — Travailler l'easing (custom bézier / spring doux, léger overshoot) plutôt que linéaire/instantané.** Pourquoi: une apparition instant ou linéaire paraît raide et amateur ; un easing amorti rend l'interface vivante. ⚠ Exception cyclique (R4). ✓ Ease-out / spring doux sur entrées et transitions · ✗ Linéaire sec sur un élément censé sembler vivant. (src: iWUOlfq51qk, ZaIwyQpM_TU, nLtB3pgo0g8, etc.)

- **⭐ R4 — `linear` pour le cyclique/loop, `ease`/overshoot pour le ponctuel ; caler le rythme sur le ton du contenu.** Pourquoi: un ease ralentit visiblement à chaque cycle ; une boucle trop nerveuse manque de chill sur un mood calme. ✓ `linear` sur loaders/spinners/défilements infinis, adoucir si l'ambiance est posée · ✗ Ease par défaut sur tout, boucles nerveuses sur contenu serein. (src: iWUOlfq51qk, HxwcIhPePHk, 6TDpE2yIXmA)

- **⭐ R5 — Câbler les micro-interactions sur hover/scroll, pas en auto-play permanent ; un seul effet par hover.** Pourquoi: l'animation déclenchée par l'utilisateur reste premium et signifiante ; en boucle elle devient du bruit. ✓ États hover légers (élévation, glow, apparition de texte au scroll) · ✗ Éléments qui tournent/clignotent en continu, plusieurs anims sur un même hover. (src: FVEqE47pOLw, dPi-o1rsHpI, A3u3y-ki16o, etc.)

- **⭐ R6 — Le hover ne modifie JAMAIS le layout (taille, padding, position) ; changer couleur/opacité/glow/élévation en place.** Pourquoi: un rollover qui agrandit fait sauter la mise en page, paraît buggé et casse sur tactile. ✓ Géométrie fixe, encadrer l'item entier (icône + texte) ; si l'effet change le layout, en faire un clic · ✗ Grossir/reflow le bloc, n'encadrer qu'une moitié. (src: fTpBn0tcvnM, Fj_-0i_YCu8, xl1QDX_u7W0, etc.)

- **⭐ R7 — Rollover net et visible sur tout élément cliquable, et seulement sur eux.** Pourquoi: sans rollover l'utilisateur ignore qu'un bouton est cliquable ; un hover sur du texte inerte ment sur l'interactivité. ✓ Survol contrasté (couleur, remplissage de contour, lift + ombre) · ✗ Boutons sans hover, rollovers trop subtils, hover sur texte décoratif. (src: ri9djKNknmo, 1REsiT0dH1E, koVpOamlryM, etc.)

- **⭐ R8 — Tout action → feedback visuel immédiat et localisé au point d'interaction.** Pourquoi: sans retour visible, ou si le résultat s'affiche loin du clic, l'action semble cassée. ✓ Micro-feedback sur place (compteur, contour + check, color flip marqué) · ✗ Action sans retour, résultat loin du clic, changement d'état silencieux. (src: 5Fj6DBpqK04, pNC_oKWlgy8, CHboIoYXU5A, etc.)

- **⭐ R9 — Apparitions : déplacement court (~10–100 px) + fondu d'opacité, direction unique ; jamais d'élément venu de hors-écran.** Pourquoi: un élément venu de loin ou multipliant les directions rend zinzin et stresse. ✓ Translation ~80–120 px + opacité 0→1, direction cohérente · ✗ Surgir depuis l'extérieur du cadre, directions contradictoires. (src: 8b1I7Gk-fss, mas_dOy194s, nLtB3pgo0g8, etc.)

- **⭐ R10 — Décaler (stagger) l'apparition des éléments d'un même groupe en cascade, avec easing soigné et léger rebond.** Pourquoi: tout faire apparaître d'un bloc paraît mécanique ; un délai croissant crée profondeur et signe le haut de gamme. ✓ Délai progressif ~+50–100 ms/élément sur listes, menus, groupes · ✗ Tous les enfants en même temps, sans timing ni courbe. (src: iWUOlfq51qk, CHboIoYXU5A, b4nk4Rw7YLQ)

- **⭐ R11 — Synchroniser les couches d'un même effet (zoom + overlay + texte, durées couplées).** Pourquoi: laisser une couche pop pendant que les autres sont en transition rend l'effet inachevé. ✓ Animer ensemble toutes les couches, réutiliser la durée d'une anim dérivée · ✗ Animer un seul calque, durées différentes entre anims liées. (src: TU5sjJUjMy4, 5v-nUs332rM, 80536Xm2qxU)

- **◐ R12 — Concentrer le budget animation sur le pic émotionnel du parcours (révélation, succès, déblocage), pas les écrans périphériques.** Pourquoi: soigner le wow maximise la satisfaction ; soigner les transitions secondaires gaspille et ressent comme du lag. ✓ Investir les effets les plus soignés sur le moment fort · ✗ Animer uniformément toutes les transitions. (src: 1qP1bg2ViWo, dPi-o1rsHpI)

- **◐ R13 — Donner du poids aux impacts : anticipation + hold à l'instant du choc + overshoot/rebond, puis repartir vite.** Pourquoi: un déplacement à vitesse constante paraît mou ; figer/ralentir l'impact puis rebondir rend le choc lisible. ✓ Anticipation, hold, overshoot au retour, accélération finale nette · ✗ Phases lissées uniformément, queue traînante molle. (src: 5v-nUs332rM, t4N0wf6pCf4, iWUOlfq51qk)

- **◐ R14 — Animation persistante (barre, fond ambiant) = subtile : mouvement lent, faible amplitude, cycle long (~8–10 s).** Pourquoi: un élément toujours à l'écran fatigue s'il a la vitesse d'une notification ; un fond animé en continu nuit à la lecture. ✓ Cycle ~8–10 s, amplitude faible, fond stable · ✗ Vitesse de notification sur un permanent, fond qui fait osciller le contenu. (src: wbThBLdjZh0, 9KbYE1uAgtA)

- **◐ R15 — Introduire un léger aléatoire (taille ±10–20 %, opacité, position, timing) dans les répétitions et particules.** Pourquoi: la régularité parfaite trahit l'artifice ; varier échelle et opacité rend une pluie de particules organique. ✓ Varier taille/position/timing dans des bornes min/max · ✗ Dupliquer mécaniquement la même courbe/objet. (src: wbThBLdjZh0, _qJsGxE_Azg, 5v-nUs332rM)

- **◐ R16 — Boucle persistante = seamless (raccord fin→début invisible) et thématisée ; soigner la contre-animation.** Pourquoi: un reset qui accroche trahit la mécanique ; un loader thématisé renforce l'identité vs un spinner générique. ✓ Concevoir l'anim pour boucler dès le brief, frames tampon en AE, tester la jointure · ✗ Couper la compo pile à la durée, spinner générique sans soin. (src: wbThBLdjZh0, t4N0wf6pCf4, zQaL2VeDPQo, etc.)

- **◐ R17 — Caler les anims au scroll : plage de défilement suffisante, état neutre stable au centre, déclencher assez tôt pour finir avant la sortie du viewport.** Pourquoi: une anim jouée sur quelques pixels est saccadée ; une révélation coupée avant la fin arrive trop tard et frustre. ✓ Lier à une longue plage de scroll, zone stable au centre · ✗ Toute la transition sur quelques pixels, révélation coupée avant la fin. (src: ca44Xf3rRAM, ri9djKNknmo, 8b1I7Gk-fss)

- **◐ R18 — Un seul sens de scroll (vertical mobile-first), sensibilité proportionnelle ; pas de scroll-jacking ni zoom-au-scroll libre.** Pourquoi: basculer de sens désoriente ; un scroll hyper-sensible qui saute une section paraît cassé. ✓ Feed vertical, paliers cliquables pour le zoom · ✗ Scroll horizontal dans une page verticale, hair-trigger, zoom continu au scroll. (src: E1McbVSPhUI, wFhs3s7M1YE, wOgFJ_td-dI)

## Recettes concrètes — valeurs de référence (src: jakub)

> Source : [jakub.kr / make-interfaces-feel-better](https://jakub.kr/writing/details-that-make-interfaces-feel-better). Les règles ci-dessus disent QUOI animer et POURQUOI ; voici les valeurs par défaut du COMMENT. Reste agnostique de charte.

- **Interruptibilité → transitions CSS pour l'interactif.** Une transition CSS « retargette » vers le dernier état en cours de route ; les `@keyframes` suivent un timeline figé qu'on ne peut pas interrompre proprement. ✓ transitions CSS sur tout ce qui réagit (hover, toggle, drag) · ✗ keyframes pour de l'interactif (réservées aux séquences one-shot). Une anim non interruptible fait paraître l'UI cassée.
- **Entrée → stagger + split.** Animer chaque élément, pas un gros bloc d'un coup. Délais : ~100 ms entre groupes/sections, ~80 ms entre mots. État initial `opacity:0; translateY:12px; filter:blur(4px)` → visible. Durée ~800 ms, easing `cubic-bezier(0.25,0.46,0.45,0.94)`. `animation-delay: calc(var(--delay,0ms) * var(--stagger,0))`.
- **Sortie → plus discrète que l'entrée.** L'attention part ailleurs : `translateY:-12px` + `opacity` + `blur(4px)`, durée plus courte (~150 ms vs ~300 ms en entrée).
- **Icône (changement d'état) → valeurs de référence.** `scale 0.25→1`, `opacity 0→1`, `filter blur(4px)→0`. CSS-only : superposer 2 icônes et cross-fade. Framer Motion : `AnimatePresence initial={false}`.
- **Press bouton → feedback tactile.** `transform: scale(0.96)` au clic ; JAMAIS < 0.95 (en dessous = exagéré).
- **Spring par défaut.** `{ type:"spring", duration:0.45, bounce:0 }` — naturel, sans rebond parasite.
- **Ne pas animer au chargement ce qui est déjà dans son état par défaut** (`initial={false}`) : animer les changements d'état, pas l'arrivée d'éléments déjà en place.

## Anti-patterns

- ✗ Tout animer au scroll / cumuler des anims sur chaque élément — surenchère qui tue l'impact et fait cheap.
- ✗ Auto-play en boucle permanent sans interaction ; fond animé en continu qui fait osciller le contenu.
- ✗ Easing par défaut uniforme, y compris sur loaders/spinners en boucle (ralenti à chaque cycle).
- ✗ Hover qui change le layout (taille, padding, position) ou reflow le texte → page qui saute, cassé sur tactile.
- ✗ Rollover sur texte non cliquable (ment sur l'interactivité), ou hover trop subtil sur un vrai lien.
- ✗ Toutes les anims d'une card jouées au chargement plutôt qu'au hover.
- ✗ Couches d'un même effet désynchronisées (zoom animé, overlay/texte qui pop) ou durées incohérentes.
- ✗ Impacts lissés uniformément ; apparition simultanée sans stagger ; répétitions/particules sans aléatoire.
- ✗ Boucle livrée sans vérifier le raccord fin→début (flash frame à la jointure).
- ✗ Anim persistante calibrée comme une notification (trop vite, trop fort).
- ✗ Anim au scroll partant de hors-écran, multipliant les directions, jouée sur quelques pixels, ou coupée avant la fin.
- ✗ Animations lentes/twitchy sur les actions applicatives répétitives → app perçue comme cassée.
- ✗ Carrousel auto rapide avec hover et cibles cliquables (roulette russe) ; mélange scroll horizontal/vertical ; zoom-au-scroll libre.
- ✗ Curseur custom qui laisse voir le natif, peut devenir invisible, ou traîne avec lag.
- ✗ Animer le rayon de flou (lague/casse le rendu) ; empiler des flous lourds en proto.
- ✗ Son sur chaque interaction ; budget animation étalé uniformément au lieu d'être concentré sur le wow.
- ✗ Cloner les anims lourdes desktop sur mobile ; slide-in pour une modale d'info contextuelle courte.
- ✗ Proto Figma livré comme spécification d'animation finale (easing/durées non redéfinis).
- ✗ Micro-détails soignés sur une emote invisibles à ~100 px ; supprimer des frames pour ralentir (saccade).

## Checklist build

- [ ] Moins de 3 éléments animés par vue/section ; chaque anim porte une info/action/émotion (pas de motion gratuit).
- [ ] Easing travaillé (custom bézier / spring doux) sur le ponctuel ; `linear` sur loaders/spinners/boucles ; rythme calé sur le ton.
- [ ] Pic émotionnel du parcours soigné au max ; transitions secondaires sobres.
- [ ] Micro-interactions sur hover/scroll (un seul effet par hover) ; aucun hover ne change le layout ; encadrer l'item entier.
- [ ] Rollover net sur chaque élément cliquable et eux seuls ; chaque action a un feedback immédiat et localisé.
- [ ] Apparitions ~10–100 px + opacité, direction unique, jamais hors-écran ; groupes avec stagger ~50–100 ms et léger rebond.
- [ ] Couches d'un même effet synchronisées ; impacts dramatisés (anticipation + hold + overshoot) ; anims persistantes lentes/cycle ~8–10 s + aléatoire ±10–20 %.
- [ ] Boucles seamless (raccord fin→début, frames tampon AE) ; flou animé via opacité (rayon fixe), allégé en proto.
- [ ] Scroll étalé sur plage suffisante, état neutre au centre, fini avant la sortie du viewport ; un seul sens (vertical), pas de scroll-jacking.
- [ ] Valeurs jakub : entrées `opacity+translateY(12px)+blur(4px)`, stagger 80–100 ms, `cubic-bezier(0.25,.46,.45,.94)` ; sorties plus courtes ; boutons `scale(0.96)` ; icônes `scale 0.25→1 / blur 4→0` ; transitions CSS pour l'interactif, `@keyframes` pour le one-shot ; `prefers-reduced-motion` respecté.

## Compléments — transitions.dev & interaction patterns (sources externes)

> Sources : [transitions.dev](https://transitions.dev) (Jakub Antalík) · [@gabriell_lab](https://x.com/gabriell_lab/status/2060336070059864461).

- **Catalogue de transitions portables (transitions.dev).** 18 transitions essentielles prêtes à coller (card-resize, modales, dropdowns, panels, transitions de page, validation de formulaire, révélation de texte…). Format portable : variables CSS sur `:root` + classes namespacées `t-*` + garde `@media (prefers-reduced-motion: reduce)`, sans dépendance ni markup spécifique. Installable en skill : `npx skills add Jakubantalik/transitions.dev`. → réutiliser ce vocabulaire de transitions plutôt que réinventer des animations ad hoc.
- **Proximité, pas seulement le hover (gabriell_lab).** Quand le curseur s'approche, les éléments voisins peuvent subtilement scaler/s'assombrir selon la distance — interaction plus vivante et premium qu'un état hover binaire. (Le thread source contient d'autres patterns de Design Engineering.)
