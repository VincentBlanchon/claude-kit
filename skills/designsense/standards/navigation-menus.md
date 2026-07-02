---
theme: Navigation & menus
type: ui-ux-standard
audience: agent-llm
sources: basti
rules_count: 16
videos_count: 82
---

# Navigation & menus — standards UI/UX

> Règles pour un agent qui construit du front. Agnostique de charte. Appliquer par défaut sauf contrainte projet.

## Règles

- **⭐ R1 — Nav mobile principale = tab bar persistante en bas (3-5 tâches), pas un burger.** Pourquoi: la zone basse est celle du pouce et tout exposer évite le clic qui cache la nav. ✓ Tab bar fixe avec les jobs clés, surplus dans un onglet compte/menu. ✗ Burger ou nav haute hors zone pouce comme nav principale. (src: -mnsobvWmKk, KuQVqSulCeM, 16UmfJrP9Lc, iTd5DYJsrFY etc.)

- **⭐ R2 — La tab bar ne contient QUE des sections permanentes de même niveau ; jamais recherche, champ de saisie, action ponctuelle, pop-up ou flux à back.** Pourquoi: y loger autre chose casse le modèle mental (clavier/modale recouvre la barre, deux modèles de nav mélangés). ✓ Action spéciale = rond central qui déborde ; sortir le reste en FAB/header/page. Onglet recherche : page d'abord, focus/clavier au second tap. ✗ Onglet ouvrant modale ou clavier qui masque la barre ; loupe en 5e onglet plat. (src: sg-GUYLlQ4E, uXiT_wTtMF8, -mnsobvWmKk, njcLhEd3rd0 etc.)

- **⭐ R3 — Indiquer clairement l'item actif : état sélectionné obligatoire et visuellement distinct.** Pourquoi: sans état actif l'utilisateur ne sait pas où il est. ✓ Couleur d'accent, icône filled, soulignement, fond ou contour sur l'item courant. ✗ Items identiques quel que soit l'écran ; item qui grossit (jitter) au lieu de changer de fond. (src: oummVionT88, ZKU6vLJN18U, TU5sjJUjMy4, Fj_-0i_YCu8 etc.)

- **⭐ R4 — Nav cohérente : comportement, position, style et destinations uniformes d'un écran à l'autre, via un composant partagé.** Pourquoi: mélanger pop-up/page/onglet externe sans logique et laisser dériver styles et positions fait bricolé. ✓ Une règle par catégorie de lien ; mêmes police/graisse/padding ; positions stables ; nav éditée en un seul endroit. ✗ Comportements hétérogènes ; menu qui disparaît en sous-section ; nav dupliquée qui dérive. (src: njcLhEd3rd0, _qJsGxE_Azg, E8MM2MdUrw4, zfHnNqAvwJc etc.)

- **⭐ R5 — Toujours offrir une issue de retour explicite : back sur les détails, sortie vers menu/accueil, retour arrière dans tout flux multi-étapes.** Pourquoi: un écran sans porte de sortie piège l'utilisateur. ✓ Bouton retour visible sur sous-vues/wizards ; lien Accueil explicite même en structure dynamique. ✗ Vue de détail ou flux sans chemin de retour ; sortie possible seulement en cliquant le logo. (src: 5v-nUs332rM, wFhs3s7M1YE, onnSWR-7wBM, h_wZ5EoLqho etc.)

- **⭐ R6 — Bouton retour en haut à gauche ; il restaure la position d'origine (scroll, item), pas le haut de page. Sur web, le back navigateur suffit souvent.** Pourquoi: on cherche le retour où commence la lecture ; renvoyer au sommet fait perdre sa place. ✓ Retour ancré haut-gauche sur app/mobile ; restaurer scroll et contexte. ✗ Retour à droite ; back custom redondant sur web ; retour qui renvoie au top d'une grille parcourue. (src: gDG_em0qtC0, KuQVqSulCeM, E1McbVSPhUI, ZVXDvy0Ztqw etc.)

- **⭐ R7 — Arborescence construite sur les 3-5 actions utilisateur (verbes), dans l'ordre du parcours, pas sur la structure interne du produit.** Pourquoi: calquer la nav sur l'organisation interne crée un zigzag où l'utilisateur se perd. ✓ Verbes clés sur home/tab bar dans le sens du workflow ; modes par intentions explicites (je vends/j'achète) ; une seule action principale en évidence, secondaire derrière filtres. ✗ Toutes les entrées au même niveau ; menu déroulant ambigu pour des modes distincts. (src: CHboIoYXU5A, _WqNosaKmos, 03odlgh212A, 3SDoL9iCaHk etc.)

- **⭐ R8 — Pas de mur de connexion à l'ouverture : demander le compte au moment de l'action qui exige la persistance, avec un interstitiel contextuel.** Pourquoi: une modale login au premier écran tue le funnel avant que la valeur soit ressentie. ✓ Explorer librement, puis demander au point précis (« Pour lire cet article, créez un compte ») ; login discret en coin. ✗ Inscription dès le premier écran ; gros CTA d'auth central qui domine le hero. (src: JYSZ62Hvg64, CR65uXRVp80, CHboIoYXU5A)

- **⭐ R9 — Sélecteur de langue en texte ou code ISO (FR/EN), jamais en drapeaux.** Pourquoi: un drapeau désigne un pays, pas une langue, et exclut des utilisateurs. ✓ « Français » / « English », ou FR/EN avec chevron. ✗ Drapeau pour désigner une langue. (src: oummVionT88, gDG_em0qtC0, TvQVANr4eIo, gsSXn8EQmgk)

- **⭐ R10 — Pas de menus rollover / sous-menus au survol sur arborescence plate ou peu profonde : ouvrir au clic et aplatir.** Pourquoi: le hover scintille, bugge, ne marche pas au touch et n'apporte rien si la structure ne le justifie pas. ✓ Liens directs, ou clic vers une page d'arborescence si beaucoup de liens. ✗ Nav cachée derrière un survol instable ; méga-menu rollover surchargé. (src: A3u3y-ki16o, b4nk4Rw7YLQ, 8WFeiimrqrI, CrGD5-TrqFU etc.)

- **⭐ R11 — Page longue/one-page : nav d'ancres + repère de position et de remontée ; ne pas mélanger liens d'ancre et liens de page dans le même menu.** Pourquoi: sans ancres on ne découvre pas les sections ; un menu hybride casse la prévisibilité. ✓ Ancres cliquables + retour haut ; choisir one-page OU multi-pages et s'y tenir. ✗ Page longue sans ancres ; menu mixant ancres, pages et pop-up. (src: 1JPnZuqLqqk, QKx4x61BVJE, woo1_GaHeg4, E6lE8tOVQII etc.)

- **◐ R12 — Desktop : nav horizontale en haut, liens visibles en clair ; pas de burger si la place existe, pas de nav en bas. Aucune destination dupliquée entre barres.** Pourquoi: sur desktop le burger ajoute un clic inutile ; répliquer une destination en tab bar ET burger gaspille l'espace et signale une arbo sur-dimensionnée. ✓ Liens directs dans le header desktop ; un seul libellé clair par destination. ✗ 3-4 liens enfermés dans un burger sur grand écran ; barre principale en bas ; mêmes liens dupliqués entre tab bar/burger/header/hero/footer. (src: HxwcIhPePHk, Fj_-0i_YCu8, 1qP1bg2ViWo, PD0zE4-8kkI etc.)

- **◐ R13 — Tab bar : icône + label texte court sous chaque onglet ; si icon-only assumé, espacement régulier et aligné. Search/action centrale visible et en zone basse si c'est le cœur du produit.** Pourquoi: une icône seule est ambiguë et ralentit ; le champ central noyé retarde l'action critique. ✓ Icône + label ; search bar basse près de la tab bar sur mobile. ✗ Labels supprimés alors que la place existe ; icônes tassées ; search bar perdue dans le header ou révélée après scroll. (src: 1qP1bg2ViWo, wdwxRCUJKk4, ZaIwyQpM_TU, uXiT_wTtMF8 etc.)

- **◐ R14 — Sidebar verticale pour les outils à formulaires / vraie arborescence ; dimensionner au volume d'entrées, pas au style (peu → en haut, beaucoup → côté).** Pourquoi: un contenu vertical (réf. YouTube Studio, Discord) souffre en top-nav, mais une sidebar pour 2 liens est overkill. ✓ Sidebar pour filtres/vues multiples, status/crédits en bas, collapse ; auditer le nombre d'entrées avant de choisir. ✗ Top-nav sur contenu vertical ; sidebar « dashboard pro » par style sur un produit plat. (src: CHboIoYXU5A, II7hlUpojc8, PD0zE4-8kkI, WchiZ2lPeoY etc.)

- **◐ R15 — Header sur média immersif : transparent/contextuel (liens clairs, actif discret), solide au scroll ; pas de bandeau blanc opaque. Nav stable et prévisible : pas de tab bar morphing, header sticky seulement si justifié.** Pourquoi: un header blanc tue l'immersion ; plus un composant de nav est dynamique, plus il est détourné et plus l'utilisateur se perd. ✓ Nav transparente sur le hero, opaque au scroll ; teinte qui suit l'arrière-plan ; tab bar fixe ; composants natifs réutilisés sur mobile natif. ✗ Header blanc opaque sur DA immersive ; tab bar morphing ; header fixe par réflexe ; chrome natif redessiné à la main. (src: 8b1I7Gk-fss, A3u3y-ki16o, uXiT_wTtMF8, E1McbVSPhUI etc.)

- **◐ R16 — Détail mobile = vue dédiée (bottom sheet à poignée pour une carte/liste, ou vue pleine avec back), jamais modale empilée ni page saturée ; contenu léger déplié inline. Différencier les types d'éléments d'une barre.** Pourquoi: empiler des modales perd l'utilisateur, et une rangée d'items identiques ne donne aucune hiérarchie. ✓ Bottom sheet à la Google Maps (aperçu compact + drag) ; vue centrée pour une action ; traitement distinct (encadrement, picto) selon le type, principal aux extrémités. ✗ Popup statique surchargée ; modale sur modale ; overlay pour trois infos maigres ; menus/toggles/dossiers à plat sans marqueur. (src: AYFNcAfpyOA, tXVaiSLSbho, ZKU6vLJN18U, I5E4NmtTAT8 etc.)

## Anti-patterns

- ✗ Burger (ou nav haute hors zone pouce) comme nav principale mobile quand une tab bar de 3-5 jobs suffirait.
- ✗ Recherche, champ de saisie, action ponctuelle, pop-up ou flux à back dans la tab bar ; clavier qui surgit au premier tap.
- ✗ Item de nav sans état sélectionné distinct ; item sélectionné qui grossit (jitter).
- ✗ Comportements de nav hétérogènes ; styles/positions qui dérivent ; menu qui disparaît en sous-section.
- ✗ Vue de détail, écran ou flux sans issue de retour ; sortie possible seulement via le logo.
- ✗ Bouton retour à droite ; back custom redondant sur web ; retour qui renvoie en haut de page.
- ✗ Nav calquée sur la structure interne / zigzag ; toutes les entrées au même niveau ; mode ambigu en déroulant.
- ✗ Mur de connexion à l'ouverture ; gros CTA d'auth central qui domine le hero.
- ✗ Drapeaux pour le sélecteur de langue.
- ✗ Menus rollover / méga-menus au survol sur arborescence plate ; dropdowns hover inaccessibles au touch.
- ✗ Page longue sans ancres ni repère ; menu mixant ancres et liens de page ; hybride one-page/multi-pages.
- ✗ Burger sur desktop quand la place existe ; nav principale en bas sur desktop ; destinations dupliquées entre barres.
- ✗ Icônes de tab bar sans label alors que la place existe ; barre icon-only tassée ; search bar noyée ou révélée après scroll.
- ✗ Sidebar « dashboard pro » sur un produit plat ; top-nav sur un outil à formulaires verticaux.
- ✗ Header blanc opaque sur DA immersive ; tab bar morphing/rétractable ; chrome natif redessiné à la main.
- ✗ Popup statique surchargée au lieu d'un bottom sheet ; modale sur modale ; items de barre indifférenciés.

## Checklist build

- [ ] Nav principale mobile = tab bar de 3-5 tâches en bas, pas un burger.
- [ ] Tab bar = sections permanentes uniquement ; action spéciale = rond central ; recherche = page d'abord, focus au 2e tap.
- [ ] Item actif clairement distingué partout (pas de jitter).
- [ ] Nav homogène (comportement, position, style, destinations) via un composant partagé.
- [ ] Issue de retour partout : back sur détail, sortie menu/accueil, retour dans les wizards ; lien Accueil présent.
- [ ] Bouton retour haut-gauche ; restaure la position d'origine ; sur web s'appuyer sur le back navigateur.
- [ ] Arbo sur les 3-5 actions utilisateur dans l'ordre du parcours ; une seule action principale exposée.
- [ ] Pas de mur de login ; compte demandé au moment de la persistance, avec interstitiel contextuel.
- [ ] Sélecteur de langue en texte/code ISO, jamais en drapeaux ; pas de menus rollover sur arbo plate.
- [ ] Page longue : ancres + repère ; one-page OU multi-pages sans hybride.
- [ ] Desktop : liens visibles en haut, pas de burger si place ; aucune destination dupliquée entre barres.
- [ ] Tab bar : icône + label, bien espacée ; search/action centrale visible et basse si cœur du produit.
- [ ] Sidebar réservée aux outils à formulaires / vraie arbo, dimensionnée au volume d'entrées.
- [ ] Header transparent/contextuel sur DA immersive, solide au scroll ; nav stable (pas de morphing) ; natif réutilisé.
- [ ] Détail mobile = bottom sheet ou vue pleine avec back, pas de modale empilée ; types d'éléments de barre différenciés.
