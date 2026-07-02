---
theme: Portfolios (page-type)
type: ui-ux-standard
audience: agent-llm
sources: basti
rules_count: 17
videos_count: 40
---

# Portfolios — standards UI/UX

> Règles pour un agent qui construit un portfolio. Agnostique de charte. Appliquer par défaut sauf contrainte projet.
> Pondération : ⭐ très récurrent (3+) · ◐ confirmé (2) · ○ ponctuel (1) · ⚠ contradiction à arbitrer.

## Règles

### Structure & parcours
- **⭐ R1 — Montrer le travail tout de suite : projets visibles dès l'accueil, hero court avec rôle/métier + CTA vers les projets.** Pourquoi: recruteur/client juge les réalisations en quelques secondes ; bio, grille d'outils ou nom répété ne convertissent pas. ✓ Accroche rôle/promesse + bouton "voir les projets", skills/bio relégués plus bas · ✗ "Bonjour je suis designer" + pavé de texte, ou nom affiché deux fois sans le métier ni CTA. (src: IVFuk2eP77I, ox3Gxba8MEk, JYEhyqjt2Ag, gsSXn8EQmgk etc.)
- **⭐ R2 — Home = carte de visite one-page scrollable et narrative : qui je suis → ce que je fais → 2-4 projets phares → contact ; profil compris en ~20 s.** Pourquoi: un récit vertical convainc vite ; multiplier les onglets perd le visiteur, une home qui ne scrolle pas semble vide. ✓ Essentiel sur une page + au plus une archive et une page détail · ✗ Arborescence d'onglets, ou landing qui ne révèle rien au scroll. (src: NDWOBuI_M04, Fj_-0i_YCu8, gsSXn8EQmgk etc.)
- **⭐ R3 — Un portfolio est un vrai site : nav conventionnelle (Home/Projets/About/Contact), ancres vers les sections, responsive, perf entre pages ; fonctions hors-sujet externalisées.** Pourquoi: de belles compositions sans menu, responsive ni ancres ne sont pas un produit utilisable ; nav opaque ou mêlée à un e-commerce perd le visiteur. ✓ Libellés prévisibles, ancres, layout mobile, boutique en lien externe · ✗ Visuels figés sans menu, nav à décoder, arbre mêlant portfolio et e-commerce. (src: ZVXDvy0Ztqw, HxwcIhPePHk, EEnmrw-xutg, NEgct_mJIZE etc.)
- **⭐ R4 — Conclure par un footer qui ré-engage : ligne de clôture + contact/CV/réseaux (icônes monochromes cohérentes), sans widgets parasites.** Pourquoi: une page longue qui s'arrête net rate le point de contact ; widgets non expliqués (étoiles, embeds) brouillent. ✓ "Ça t'a plu ? contacte-moi / mon CV" + réseaux + logo · ✗ Finir sans footer, ou modules disconnectés. (src: L5wcOmyZNpA, fTpBn0tcvnM, ae9sQ91_Sxg etc.)
- **◐ R5 — Sélectionner 3-4 projets forts, récents et alignés sur la cible ; commencer simple et fini plutôt qu'ambitieux et cassé.** Pourquoi: quelques "banger" représentatifs valent mieux qu'un historique exhaustif, et une surface contenue mais polie prouve mieux la compétence. ✓ 3-4 réalisations + lien "voir tous les projets" vers une archive · ✗ Tout lister du plus ancien, ou sur-scoper en pages aux liens morts. (src: NDWOBuI_M04, E1McbVSPhUI etc.)

### Présentation des projets
- **⭐ R6 — Présenter chaque projet dans un mockup soigné (device, fond uni cohérent), pas une capture brute ; ouvrir sur son meilleur visuel ; chaque carte légendée (titre court) et débruitée.** Pourquoi: le mockup valorise et donne envie de cliquer ; sans texte on ne comprend pas ce qu'on regarde, et "Projet 1" ou des boutons répétés surchargent. ✓ Mockup (laptop/iPhone récent) sur fond uni, titre court, carte cliquable · ✗ Screenshots bruts, grille de logos sans description, labels vides. (src: 5Fj6DBpqK04, JRA91H1XUiU, JYEhyqjt2Ag, ox3Gxba8MEk etc.)
- **◐ R7 — Montrer le cheminement et l'interface en mouvement : explorations/étapes, états de survol, fragments d'UI plutôt que des captures pleine page figées.** Pourquoi: exposer les itérations raconte une histoire ; une UI ciblée avec rollovers prouve le savoir-faire mieux qu'une photo inerte. ✓ Pistes/brouillons dans la planche, hover states, fragments d'UI · ✗ Seulement le rendu final, ou captures plates sans interaction. (src: yV4PUOHzuJk, dzW12tU39ts etc.)
- **◐ R8 — Page projet propre : header sobre (pas d'effet de la home), vraie nav de retour/sommaire, ferrage gauche mono-colonne, contenu détaché du fond.** Pourquoi: un header flottant ombré sur une césure paraît cassé ; reproduire les effets de la home oublie l'essentiel — circuler et revenir. ✓ Fond continu sous le header, nav retour, alignement gauche homogène · ✗ Header ombré sur une coupure de couleur, ou page sans retour. (src: EEnmrw-xutg, NEgct_mJIZE etc.)
- **◐ R9 — Homogénéiser les médias : un seul profil de couleur, fond défini au niveau page (pas cuit dans chaque image) ; pour une démo, screen recording sur plan fixe en boucle crossfade.** Pourquoi: des exports aux profils différents créent des ruptures de teinte ; le fond dans chaque média crée des lignes de séparation ; une vidéo douce bouclée valorise mieux qu'un carrousel rapide qui fatigue. ✓ Profil unique, couleur de fond au niveau page, boucle fin↔début sans auto-zoom · ✗ Blocs aux fonds censés identiques qui ne matchent pas, coupure nette de boucle, défilé trop rapide. (src: a1g2Pb5JoEo, ox3Gxba8MEk etc.)
- **○ R10 — Unifier une grille de visuels hétérogènes : vignettes désaturées (N&B), couleur révélée au survol.** Pourquoi: la désaturation par défaut fait cohabiter des visuels disparates qui sinon se télescopent. ✓ Vignettes N&B, couleur au hover · ✗ Vignettes multicolores qui se percutent. (src: 6pl5CecjP48)

### Direction artistique & finition
- **⭐ R11 — Décliner une DA forte de façon cohérente sur tout le portfolio, CV et sections texte inclus : même police, mêmes couleurs, même hiérarchie partout.** Pourquoi: une pièce maîtresse à belle typo trahie par une police neutre ailleurs (ou un CV au style étranger) casse la crédibilité. ✓ Étendre la typo/couleurs de l'asset le plus fort à tout le site · ✗ Vidéo magnifique + reste en police générique, ou CV plaqué avec sa propre mise en forme. (src: HxwcIhPePHk, 1JPnZuqLqqk, IVFuk2eP77I etc.)
- **⭐ R12 — Faire respirer et caler sur une grille régulière (souvent 4 col.) : interligne ample, padding latéral, espace entre blocs ; cards/CTA tapent sur les lignes ; calibrer sur des références award-quality posées à côté.** Pourquoi: texte tassé contre les bords, cards flottantes et grille bancale lisent comme inachevés ; calibrer contre un site admiré évite d'inventer les tailles dans le vide. ✓ Line-height généreux, vide intentionnel, tout aligné sur la grille, conteneur calme · ✗ Lignes tassées, éléments collés, grille déséquilibrée, frame surchargé. (src: E1McbVSPhUI, 44L6uJKFg_4, m6knjruMsfc etc.)
- **⭐ R13 — Oser une signature typo/composition forte (gros titres, pleine largeur, layout déconstruit assumé), inspirée de portfolios graphiques, pas d'un template dev en cartes encapsulées.** Pourquoi: des cartes identiques font "outil corporate" ; les portfolios mémorables jouent la typo et la composition. ✓ Belle grille nette OU overscale assumé avec generous spacing · ✗ Template dev en blocs identiques, ou alternance gauche/droite trop serrée. (src: Jnx-LT0FKAg, ox3Gxba8MEk etc.)
- **○ R14 — Personnaliser : pas de thème plateforme par défaut, rafraîchir tous les ~2 ans ; quelques touches de DA (formes/aplats de marque, header habillé, anim CSS discrète si dev) valent mieux qu'un site 100% générique pour une cible créative.** Pourquoi: un thème générique signale un manque de soin ; un en-tête nu paraît inachevé ; un site trop sage manque de séduction pour une audience design. ✓ Angle éditorial, formes/couleur signature, effet animé maîtrisé · ✗ Thème par défaut figé, header morne, ou en faire trop au détriment de la lisibilité. (src: PIvLkkdBelM, JYEhyqjt2Ag, zfHnNqAvwJc etc.)

### Interaction & contenu
- **◐ R15 — Casser les codes est permis si les repères ergonomiques restent : scroll smooth, rollovers, hiérarchie, indice "scroll" sous le hero, nav annexe soignée (langue masque l'option active, barre centrée) ; pas de pop-up tutoriel ni pre-loader masquant l'intro.** Pourquoi: sans animation de scroll ni hover on "regarde juste un JPEG" ; un pop-up tutoriel avoue une UI non intuitive et un pre-loader cache l'identité à qui revient. ✓ Originalité + scroll smooth, hover, indice de scroll, micro-affordances · ✗ Page atypique figée, pop-up tutoriel, ou identité réservée à une intro animée. (src: GLh_s13vA_o, L5wcOmyZNpA, hUTjEe3F9IA etc.)
- **○ R16 — Le survol révèle le contenu, ne le masque pas : pas de blur sur l'élément consulté ; un overlay sombre ~50% sécurise un texte/logo blanc.** Pourquoi: poser le curseur signale l'intérêt ; flouter à ce moment va à l'inverse de l'intention. ✓ Clarifier l'élément et révéler l'info au hover · ✗ Flou sur la cible ou deux blurs concurrents. (src: JYEhyqjt2Ag)
- **○ R17 — Copywriting spécifique et incarné, pas de placeholder ; ne pas afficher "en recherche de stage/CDI" ni badge "indisponible".** Pourquoi: un hero creux laisse la page fade malgré une belle mise en page ; mentionner sa recherche donne une impression de galère et un badge d'indispo casse l'esthétique. ✓ Positionnement spécifique (quoi, pour qui, quel angle), site neutre/intemporel, dispo signalée dans le mail · ✗ Lorem ipsum, bandeau "recherche de stage", badge "non disponible". (src: TU5sjJUjMy4, EBPT9dxBh-Y etc.)

## Contradictions à arbitrer (⚠)
- **⚠ Centrage vs ferrage gauche du hero** : centrer une intro courte lit plus propre, mais basculer en gauche dès que le contenu dépasse ~1.5 ligne. Ne pas centrer de longs paragraphes ni forcer le gauche sur un hero quasi vide. (src: dzW12tU39ts)
- **⚠ Site codé vs hub léger** : un site from-scratch fait passer ~75% du temps à coder/debugger ; un hub éditable (Bento, Notion-as-CMS) peut suffire. Coder custom pour le contrôle/démontrer ses skills, hub si l'objectif est juste de montrer le travail vite. (src: ox3Gxba8MEk, ri9djKNknmo etc.)
- **⚠ Vidéo en hero** : une démo douce en fond (texte par-dessus) est bonne ; ne jamais remplacer la page par une vidéo porteuse de toute l'info (texte non sélectionnable, mauvais SEO). Vidéo = ambiance, jamais le contenu principal. (src: ox3Gxba8MEk, NDWOBuI_M04 etc.)

## Méta / process (hors page mais utile)
- **○** Nommer fichiers/frames dans une seule langue (anglais), IDs numériques par typologie avec marge (100 accueil, 200 liste…) pour insérer sans renommer (src: Yt2ZV60tyGk). Alimenter le portfolio avec des projets auto-initiés (redesign, concours, exercices) qui prouvent le savoir-faire (src: _WqNosaKmos). Choix d'outil = signal : no-code propre orienté design pour un premier portfolio, code custom pour les confirmés (src: C-xtKQONQZA). Auditer avant de refaire : un zoning correct se redessine (typo/couleur/rayons/espacement), il ne se refait pas (src: 5Fj6DBpqK04).

## Checklist build
- [ ] Travail visible dès l'accueil, hero = rôle/métier + CTA (R1)
- [ ] Home one-page narrative, profil compris en ~20 s (R2)
- [ ] Vrai site : nav conventionnelle, ancres, responsive, perf (R3, R4)
- [ ] 3-4 projets forts/récents/alignés, finis et cliquables (R5)
- [ ] Projets en mockups légendés sur fonds unis, meilleur en tête (R6)
- [ ] Cheminement + interface en mouvement ; pages projet à nav de retour (R7, R8)
- [ ] Médias homogènes (profil, fond page, démo plan fixe), grille unifiée si hétérogène (R9, R10)
- [ ] DA forte déclinée partout (CV inclus), respiration + grille régulière (R11, R12)
- [ ] Signature typo, perso/à jour, repères ergonomiques + survol qui révèle (R13, R14, R15, R16)
- [ ] Copywriting incarné, pas de "recherche de stage" ni badge "indispo" (R17)
