---
theme: Erreurs fréquentes / red flags
type: ui-ux-standard
audience: agent-llm
sources: basti
rules_count: 20
videos_count: 127
---

# Erreurs fréquentes / red flags — standards UI/UX

> Règles pour un agent qui construit du front. Agnostique de charte. Appliquer par défaut sauf contrainte projet.

## Règles

- **⭐ R1 — Bannir 3D / glossy / métallique / bevel / skeuomorphisme et l'empilement d'ombres.** Pourquoi: ça date et signale un manque de maîtrise. ✓ Pictos flat, aplats nets, une seule source de lumière implicite ; au plus une ombre douce teintée au survol. ✗ Glassmorphism non contrôlé, contour sur le texte, ombre grise lourde au repos, double-ombre, ombre sombre sur fond sombre. (src: 9OL4z1_XLQ8, AYFNcAfpyOA, EBPT9dxBh-Y, MU8GnuX6ItA, etc.)

- **⭐ R2 — Tout cliquable a un curseur pointer + un feedback hover/pressed (assombrissement ~10%, ombre, scale léger) + une cible élargie par padding (bouton principal full-width sur mobile).** Pourquoi: une UI se juge en mouvement ; sans affordance le visiteur ignore que c'est cliquable. ✓ Feedback cohérent sur chaque interactif, zones de touch rectangulaires. ✗ Cible limitée au libellé, liens soulignés au lieu de zones de touch. (src: 5Fj6DBpqK04, 80536Xm2qxU, E6lE8tOVQII, KuQVqSulCeM, etc.)

- **⭐ R3 — Ne rendre cliquable QUE ce qui mène à une vraie destination.** Pourquoi: faux bouton, carte/hover qui ne mène nulle part ou boîte autour d'un item inerte trahissent un design non pensé. ✓ Affordance hover réservée aux vrais cliquables ; tags moins affordants que les liens ; titre nettement distinct d'un bouton (forme, fond, arrondi). ✗ Même hover qui veut dire tantôt "cliquable" tantôt rien ; tag au poids/hover de CTA ; titre stylé en bouton. (src: E6lE8tOVQII, KuQVqSulCeM, yUcmtQpPo7A, etc.)

- **⭐ R4 — Limiter drastiquement couleurs et fontes : une valeur par rôle, 1-3 accents max, 1-2 familles de police. Réserver l'accent aux cliquables — jamais aux titres/paragraphes.** Pourquoi: la densité de teintes/effets/fontes tue la hiérarchie et fait effet arc-en-ciel/amateur. ✓ Palette restreinte synchronisée, couleur de texte cohérente par niveau. ✗ Deux primaires quasi-identiques ; une couleur par feature ; couleur de marque omniprésente ou sur les titres. (src: DrY4WPlIFnQ, K3Lp_8Jfwkk, MU8GnuX6ItA, Z9qEE0xIeDQ, etc.)

- **⭐ R5 — Bannir les dark patterns : refus / désabonnement / annulation à la MÊME visibilité, taille, contraste et coût (≤ 2 clics) que l'acceptation.** Pourquoi: cacher "Refuser", cases pré-cochées, faux compteurs, prix masqués jusqu'au checkout sont illégaux dans l'UE (DSA 2024) et détruisent la confiance. ✓ Cases décochées, prix tout-compris dès la page produit, un seul signal de rareté s'il est réel, friction volontaire rare et explicite. ✗ Refus grisé/sous le scroll, double négation, opt-in caché dans un CTA, timer/stock inventé, frais révélés au checkout. (src: 1qP1bg2ViWo, 3SDoL9iCaHk, CR65uXRVp80, MaIj0J-d9n4, etc.)

- **⭐ R6 — Tout texte porteur de sens est du vrai HTML/CSS, jamais brûlé dans un JPEG / mockup / vidéo en mouvement / overlay sur fond non maîtrisé.** Pourquoi: invisible au SEO, inaccessible, ne reflow pas, illisible sur fond variable ou vidéo compressée. ✓ Prix/titres/promos en HTML ; hero = clips nets sans texte intégré + titre HTML ; zone à fond garanti pour actions/textes superposés. ✗ Slider gravé dans le JPEG ; texte sur vidéo sans fond ; commentaire/like en overlay translucide sur contenu utilisateur. (src: 1REsiT0dH1E, 5SSwdpSg_v0, WZ5Axl2noSA, gDG_em0qtC0, etc.)

- **⭐ R7 — Système de CTA unifié : un seul style de bouton, une seule couleur d'action, un seul rollover, en conteneur paddé. UN seul primaire par zone (reste en ghost) ; un seul CTA par destination.** Pourquoi: formes/hovers disparates ou plusieurs "principaux" alignés brisent l'affordance ; un CTA dupliqué (nav + hero) dilue l'attention et ressemble à un bug. ✓ Forme/style unique partout, variantes homogénéisées (largeur, casse, fonte). ✗ Rectangle fixe au lieu d'un conteneur paddé ; même bouton répété pour une même cible ; onglet actif surligné d'un gros trait. (src: 5SSwdpSg_v0, Ff-hHf15kv4, JRA91H1XUiU, KuQVqSulCeM, etc.)

- **⭐ R8 — Limiter le motion : une animation signature courte par zone, courbes ease-in/out (jamais linéaire), scroll natif respecté.** Pourquoi: le linéaire fait cheap ; empiler les effets donne le mal de mer et casse des interactions système. ✓ Une signature réutilisée, transitions courtes. ✗ Parallaxe + 3D + scroll détourné + hover clignotants ; scroll hijack/smooth-scroll JS forcé ; curseur à inertie ; autoplay son ; animations/textures cassées laissées en place. (src: 1REsiT0dH1E, 9OL4z1_XLQ8, GLh_s13vA_o, OuqmTqPCwyI, etc.)

- **⭐ R9 — Pas de hover qui déplace/redimensionne le texte ou change graisse/arrondi : figer le texte, n'animer que formes/images avec des hovers fiables (couleur, ombre, scale léger).** Pourquoi: une flèche qui décale le texte ou une image qui bouge avec son label fait brouillon ; changer graisse/arrondi au rollover "ne marche jamais", surtout sur du non-cliquable. ✓ Bloc de texte stable, formes/boutons/images animés. ✗ Décaler/agrandir le texte au rollover ou au scroll. (src: MU8GnuX6ItA, yUcmtQpPo7A)

- **⭐ R10 — Système de marque cohérent : nom et icône distinctifs (pas de confusion entre produits), set d'icônes homogène (grille commune, trait uniforme, line OU fill).** Pourquoi: nom/logo partagés provoquent des erreurs de navigation ; mêler filled/outline ou dimensionner à l'œil casse l'unité ; un picto peut évoquer une marque tierce. ✓ Identité propre par produit, traitement uniforme, tester le standalone contre les look-alikes. ✗ Logo de chatbot sur un traitement de texte ; icône filled au milieu d'outline ; picto opaque à expliquer. (src: 44L6uJKFg_4, HJsKD_le65w, I5E4NmtTAT8, KBhcLank6RY, etc.)

- **⭐ R11 — Un logo doit rester lisible à petite taille (16/24/32px), à la résolution réelle, testé sur des neutres.** Pourquoi: aspérités/brush/textures deviennent baveux en miniature (favicon, avatar) ; si 20%+ de neutres lisent mal le lettering, c'est un défaut. ✓ Formes franches, texture seulement en finition assumée, reconnaître la limite de compétence (logotype = typographe). ✗ Détails de brush dans un logo numérique ; texture comme cache-misère ; "c'est stylisé" pour ignorer la lisibilité. (src: 5scZtI4rwBA, H0aZGKzdQas, I5E4NmtTAT8, cpC182Bzep4, etc.)

- **⭐ R12 — Au lancement : progressive disclosure, arriver vite sur l'écran utile, demander permissions/consentements seulement aux moments d'intention manifeste, auto-save.** Pourquoi: 3-6 écrans-barrière freinent ; réclamer tout au démarrage agresse ; un tuto bloquant ou un "Sauvegarder" manuel signale un défaut d'affordance. ✓ Contenu immédiat, mini-guidage contextuel, permissions au 1er usage à valeur. ✗ Slider d'onboarding multi-écrans ; popup notifs au chargement ; tutoriel bloquant ou légende pour un composant ambigu. (src: CHboIoYXU5A, E8MM2MdUrw4, NRvroyLcZ1M, TSjoCJ_bWBU, etc.)

- **⭐ R13 — Une seule direction artistique de bout en bout : un seul langage de design, une philosophie de forme (tout arrondi OU tout angulaire), des rayons cohérents (dessiné = codé).** Pourquoi: mélanger cartes arrondies ombrées et blocs anguleux, plusieurs rayons, ou un rayon raté (y compris croppé au zoom) saute aux yeux et signale l'amateurisme. ✓ DA tenue, rayons réguliers et concentriques partout, masque correct au hover d'image (seul le contenu zoome). ✗ Mixer border-radius sans intention ; arrondis inégaux ; cadre arrondi croppé au zoom ; échelle de composants incohérente. (src: H0aZGKzdQas, Jnx-LT0FKAg, K3Lp_8Jfwkk, mM7HmbLxTC4, etc.)

- **⭐ R14 — Dark/light = vrai système complet, pas une inversion naïve : base la plus sombre, surfaces élevées plus claires (ordre d'élévation préservé), valeurs propres à chaque thème.** Pourquoi: cartes plus sombres que la page, ou une popup/page light dans une UI dark, cassent l'harmonie. ✓ Jeu de valeurs par thème, élévation respectée. ✗ Inversion naïve ; modale blanche éclatante dans une app sombre ; mêmes couleurs dark/light. (src: K3Lp_8Jfwkk, MU8GnuX6ItA, R1DNknJvp64, WchiZ2lPeoY, etc.)

- **⭐ R15 — Alignement directeur cohérent (header full-width OU container, pas les deux), hiérarchie de lecture claire (nav niveau 1, une action dominante), marges égales en multiples de 8.** Pourquoi: un alignement random ou tout au même niveau "ne met rien en valeur" ; des marges/arrondis inégaux trahissent un manque de rigueur. ✓ Grille stricte, dégraisser pour l'essentiel. ✗ Mélanger centre et gauche sans logique ; avatar/tags plus en avant que le titre ; copywriting empilé (icône + sur-phrase + sous-titre + titre + CTA). (src: 6pl5CecjP48, Ff-hHf15kv4, GH6EtS7-oN0, H0aZGKzdQas, etc.)

- **⭐ R16 — Pas de carousel hero auto-play ni de carousel de news ; nav principale au clic (jamais hover seul), épurée et unique.** Pourquoi: l'auto-play fragmente l'attention ; les slides 2+ sont quasi jamais vues ; un méga-menu au rollover se ferme au moindre écart ; recopier le menu dans le corps fait daté. ✓ Hero statique fort (ou slider manuel), arriver direct sur le contenu, menus persistants au clic. ✗ Carousel auto-play en première zone ; carousel poussant vers des pages déjà accessibles ; nav dupliquée dans le corps. (src: CwiRIETV2rM, GnwDz25CHnU, JRA91H1XUiU, PENmi8HdY6Q, etc.)

- **⭐ R17 — Typo lisible : corps aligné à gauche (jamais justifié en UI web), ~16px, interligne ~150%, 1-2 fontes.** Pourquoi: la justification crée des rivières d'espaces ; un corps trop gros, l'italique long et le caps-bold cassent la légèreté et la lisibilité. ✓ text-align left partout, aérer par l'interligne plutôt que la taille. ✗ Justifier "pour faire propre" ; gonfler la taille pour remplir ; longs blocs en italique ou en capitales grasses. (src: 2Vfo-76-34w, 9KbYE1uAgtA, MU8GnuX6ItA, NDWOBuI_M04, etc.)

- **⭐ R18 — Aérer : padding interne généreux, espacement vertical large entre strates, loi de proximité — sans tomber dans le vide intersidéral.** Pourquoi: la densité excessive (texte collé aux bords) est le marqueur n°1 d'une app cheap ; à l'inverse, d'énormes vides rapetissent le contenu. ✓ Regrouper par l'espace les éléments liés, séparer nettement les groupes. ✗ Tasser / coller le texte aux bords ; OU laisser un grand vide gratuit. (src: AYFNcAfpyOA, MU8GnuX6ItA, NDWOBuI_M04, wFhs3s7M1YE, etc.)

- **⭐ R19 — Contraste vérifié à l'outil (≥ WCAG AA 4.5:1), jamais à l'œil ; valeurs adaptées light/dark ; mêmes taille (16px min) et contraste pour les textes légaux/consentement.** Pourquoi: un œil entraîné valide des couleurs qui échouent ; un accent lisible en dark devient illisible en light ; les réglages d'accessibilité ne sont PAS une excuse pour livrer un défaut illisible. ✓ Outil objectif, un jeu de valeurs par thème, lisibilité vérifiée en état livré y compris sur fonds chargés. ✗ Juger à l'intuition ; mêmes couleurs dark/light ; gris clair pour le refus ; "l'utilisateur peut activer le mode contraste". (src: 5SSwdpSg_v0, K3Lp_8Jfwkk, SD4slXmeeC4, njcLhEd3rd0, etc.)

- **⭐ R20 — Scroll sain : tester que la page défile avant tout ; un seul scroll global (colonnes secondaires en fixed) ; pas de scroll infini quand l'objectif est une tâche/info.** Pourquoi: un blocage de scroll casse l'expérience ; le scroll infini supprime les signaux d'arrêt ; enfermer le contenu dans une boîte scrollable "fait ancien site Flash". ✓ Pagination ou contenu fini (scroll infini réservé aux feeds de découverte passive), contenu débordant librement dans la page. ✗ Scroll cassé ; scroll infini sur résultats/catalogue ; scroll-dans-le-scroll ; barres de scroll concurrentes. (src: PD0zE4-8kkI, m6knjruMsfc, njXLcyrMMKc, svfMieAj8hg, etc.)

> ⚠ Note contradiction (R8/R16) — slider horizontal : pour du contenu homogène qui déborde (variantes, galeries), un slider/carousel **manuel** scrollable est un parti pris assumé (Apple) plutôt que de recalculer tous les retours à la ligne (src: CHboIoYXU5A). Pas auto-play, borné, sans casser le responsive.

> Note connexe — Mobile : ne jamais masquer la tab bar par un de ses onglets, ne pas déguiser une WebView en native, aucune décision reposant sur un hover (cassé au toucher). Couvert par R2/R16 ; rappel transverse. (src: IzxTi7Fs50Q, JYEhyqjt2Ag, le77ZiMUST8, etc.)

> Note connexe — Sortie : enrichit R12/R15. Voir le standard formulaires (champs optionnels marqués, une colonne, stepper de progression), redesign (auditer les irritants avant de refaire), décor (supprimer ornements sans fonction), max-width (~1200-1440px, paragraphes bornés, valider à la vraie résolution), simplicité vs minimalisme (garder labels et guidage), feedback système (état après chaque action, contraintes destructrices annoncées avant la perte), emojis système (proscrits dans une DA maison), contenu sponsorisé (visuellement distinct), animation organique (décaler phases, masquer les coupes nettes). Détails dans leurs thèmes dédiés.

## Anti-patterns

- ✗ 3D glossy/métallique/bevel/skeuomorphisme ; glassmorphism non contrôlé ; ombres grises lourdes, double-ombre, ombre sombre sur fond sombre ; deux sources de lumière sur un logo.
- ✗ Cliquable sans pointer/hover ; cible minuscule ; faux bouton ou carte qui ne mène nulle part ; boîte décorative autour d'un item inerte ; tag plus affordant qu'un lien ; titre stylé en bouton.
- ✗ "1000 fontes, 1000 couleurs" ; deux primaires quasi-identiques ; une couleur par feature ; couleur de marque omniprésente ou sur les titres/paragraphes.
- ✗ Refus/désabonnement grisé/caché/plus coûteux que l'acceptation ; double négation ; opt-in caché dans un CTA ; cases pré-cochées ; faux compteur de stock ; prix masqué jusqu'au checkout ; pub camouflée dans l'organique.
- ✗ Texte gravé dans un JPEG/mockup ; texte sur vidéo en mouvement sans fond ; overlay translucide sur contenu utilisateur ; image de texte là où du HTML conviendrait.
- ✗ Boutons/CTA aux formes, couleurs et hovers disparates ; rectangle fixe au lieu d'un conteneur paddé ; plusieurs "principaux" alignés ; même CTA répété (nav + hero) ; onglet actif surligné d'un gros trait.
- ✗ Motion linéaire ; surcharge parallaxe/3D/scroll-détourné ; scroll hijack ou smooth-scroll JS forcé ; curseur à inertie ; autoplay audio ; animations/textures cassées laissées en place.
- ✗ Hover qui décale/agrandit le texte ou change graisse/arrondi.
- ✗ Confusion produit (nom/logo partagés) ; set d'icônes mêlant filled/outline, grilles/épaisseurs incohérentes ; picto opaque à expliquer.
- ✗ Logo illisible en miniature ou au lettering ambigu ; texture cache-misère ; "c'est stylisé" pour ignorer la lisibilité.
- ✗ Slider d'onboarding multi-écrans ou popup intrusif au lancement ; consentements réclamés au démarrage ; tutoriel bloquant ou légende ; "Sauvegarder" manuel.
- ✗ Deux langages de design / rayons mélangés (dessiné vs codé) / arrondis inégaux / cadre arrondi croppé au zoom ; échelle de composants incohérente.
- ✗ Dark mode en inversion naïve (cartes plus sombres que la page) ; UI dark + popup light ; mêmes couleurs dark/light.
- ✗ Alignement random, header mi-absolu mi-container ; tout au même niveau ; avatar/tags devant le titre ; marges inégales ; copywriting empilé.
- ✗ Carousel hero auto-play ou carousel de news ; nav au hover seul ; méga-menu surchargé ; nav dupliquée dans le corps.
- ✗ Texte justifié ; corps trop gros pour "remplir" ; longs blocs en italique ou tout-caps gras ; multiplication de polices.
- ✗ Contenu tassé / texte collé aux bords — OU vide intersidéral.
- ✗ Contraste jugé à l'œil ; mêmes couleurs dark/light ; mentions légales en taille/contraste réduits ; "le mode contraste" comme excuse.
- ✗ Scroll bloqué ; scroll infini sur recherche/catalogue ; scroll interne en frame façon Flash ; barres de scroll concurrentes.

## Checklist build

- [ ] Aucun effet 3D/glossy/métallique/skeuo ; un seul niveau de relief ; ombre seulement au hover (douce, teintée).
- [ ] Tout cliquable a pointer + feedback hover/pressed + cible élargie (full-width mobile) ; rien de cliquable qui ne mène nulle part ; tags moins affordants que les liens ; titres distincts des boutons.
- [ ] Palette restreinte : une valeur par rôle, ≤ 3 accents, 1-2 fontes ; accent sur les cliquables seulement.
- [ ] "Refuser"/"Se désabonner" aussi visible et accessible (≤ 2 clics) que "Accepter" ; cases décochées ; prix tout-compris dès la page produit ; aucun faux signal de rareté.
- [ ] Tout texte porteur de sens est du HTML (pas gravé dans image/mockup/vidéo, pas en overlay sur fond non maîtrisé).
- [ ] Un seul style de bouton, une couleur d'action, un rollover, conteneur paddé ; un primaire par zone ; un CTA par destination.
- [ ] Animations en ease-in/out, une signature courte par zone ; pas de scroll hijack ni curseur à inertie ; pas d'autoplay son ; aucune anim/texture cassée.
- [ ] Hover qui ne déplace/agrandit pas le texte, ne change ni graisse ni arrondi.
- [ ] Pas de confusion produit/marque ; logo lisible à 16px et testé sur des neutres ; set d'icônes homogène (grille, trait, line/fill).
- [ ] Contenu accessible immédiatement, pas de slider d'onboarding ni popup intrusif ; consentements contextuels ; auto-save.
- [ ] Un seul langage de design, une philosophie de forme, rayons cohérents (dessiné = codé) ; dark/light complet (élévation préservée).
- [ ] Alignement directeur cohérent (header full-width OU container) ; nav niveau 1 ; une action dominante ; marges en multiples de 8 ; pas de copywriting empilé.
- [ ] Pas de carousel hero auto-play ni de news ; nav épurée au clic, non dupliquée.
- [ ] Corps aligné à gauche, jamais justifié ; ~16px, interligne ~150% ; 1-2 fontes.
- [ ] Padding interne généreux, espacement vertical calibré — ni tassé, ni vide intersidéral.
- [ ] Contraste vérifié à l'outil ≥ 4.5:1, valeurs adaptées light/dark ; mentions légales 16px min même contraste que le corps.
- [ ] Page qui scrolle (testé) ; pas de scroll infini sur recherche/catalogue ; un seul scroll global.
