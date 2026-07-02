---
theme: Apps & mobile / responsive
type: ui-ux-standard
audience: agent-llm
sources: basti
rules_count: 18
videos_count: 56
---

# Apps & mobile / responsive — standards UI/UX

> Règles pour un agent qui construit une app/un écran mobile ou responsive. Agnostique de charte. Appliquer par défaut sauf contrainte projet.

## Règles

- **⭐ R1 — Dimensionner les cibles tactiles pour le pouce, pas pour la souris : grosses cellules, gros boutons, hit-areas généreuses et espacées.** Pourquoi: le doigt est bien moins précis que le curseur, et la bonne taille dépend du device/contexte, pas d'une valeur px arbitraire. ✓ Contrôles dimensionnés pouce, croix de fermeture agrandies · ✗ Densité desktop, micro-boutons +/- collés. (src: yV4PUOHzuJk, Y7q6MJDj7T8, oummVionT88 etc.)

- **⭐ R2 — Ancrer l'action principale (CTA, valider, play, acheter) en bas, pleine largeur et grosse, dans la zone atteignable au pouce.** Pourquoi: le téléphone se tient d'une main et le pouce atteint naturellement le bas. ✓ CTA primaire en bas, pleine largeur, ~56dp · ✗ Bouton clé au centre/haut, étriqué, marges desktop. (src: oummVionT88, fB9pJG5YVY8, CR65uXRVp80 etc.)

- **⭐ R3 — Juger toute maquette sur l'appareil cible réel (mirror/preview), jamais sur le canvas desktop, et caler la largeur de frame exacte (390 vs 393) sur le device de l'audience.** Pourquoi: un canvas zoomé fausse tailles/densité/contraste, et quelques px d'écart créent un scroll horizontal parasite. ✓ Mirror sur device, frame = résolution réelle, comparer à de vraies apps · ✗ Valider sur desktop, largeur arbitraire laissant un scroll fantôme. (src: cpC182Bzep4, _qJsGxE_Azg, fB9pJG5YVY8, 8WFeiimrqrI etc.)

- **⭐ R4 — Concevoir explicitement la version mobile de chaque écran, mobile-first pour un produit neuf ; maquetter avant de coder.** Pourquoi: l'essentiel du trafic grand public est mobile et partir du desktop empile des éléments qui ne tiendront pas. ✓ Écrans mobiles produits pendant la conception · ✗ Designer le desktop et supposer que le mobile suivra. (src: I5E4NmtTAT8, _qJsGxE_Azg, 16UmfJrP9Lc etc.)

- **⭐ R5 — Une info / une action principale par écran ; découper un flux en « une étape à la fois » plein écran, avec un paradigme cohérent (pas plein écran → pop-up → plein écran).** Pourquoi: une seule décision plein écran s'adapte nativement au mobile et réduit la charge cognitive ; alterner les paradigmes en plein flux désoriente. ✓ Étapes séquentielles plein écran uniformes, gros bouton final · ✗ Formulaire dense d'un coup, ou mélange pages pleines/pop-ups. (src: CHboIoYXU5A, mas_dOy194s, EEnmrw-xutg, 1REsiT0dH1E etc.)

- **⭐ R6 — Ré-agencer pour le format étroit (réordonner, empiler, prioriser, colonne unique) plutôt que tasser le desktop ; replier la nav secondaire dans un menu.** Pourquoi: deux colonnes serrées rendent chaque cellule illisible et compresser mécaniquement une vue desktop casse la lisibilité. ✓ Reflow une colonne, hiérarchie repensée · ✗ Deux colonnes gardées, artboard desktop réduit pour entrer. (src: gDG_em0qtC0, 2c9eKGLniCI, wFhs3s7M1YE etc.)

- **◐ R7 — Préférer une liste verticale à une grille 2x2 pour des options/réponses.** Pourquoi: la liste est nativement mobile-friendly, encaisse les libellés longs et se redimensionne en largeur avec un seul composant. ✓ Options empilées, cas « libellé long » testé · ✗ Grille en quarts qui déborde sur petit écran. (src: eVgHdS4Turk, gDG_em0qtC0)

- **⭐ R8 — Augmenter le corps de texte sur mobile (~16-17px) : ne pas se contenter d'un reflux de colonnes en gardant les fontes desktop.** Pourquoi: un site « responsive » qui passe en une colonne mais garde les tailles desktop devient minuscule et illisible. ✓ Corps ~16-17px, espacement, lisibilité vérifiée · ✗ Tailles de police desktop reprises telles quelles. (src: gDG_em0qtC0, Iwt1XP4c2DM, qikafis2mEk)

- **⭐ R9 — Cellule de liste : toute la surface cliquable, hauteur tactile confortable (~88-96px, multiple de 8), de l'air, composant homogène pour toute l'app ; photo/avatar à gauche, texte ensuite, action à droite, baseline alignée.** Pourquoi: viser un picto interne est imprécis, des cellules tassées manquent d'air, et la photo à gauche suit le sens de lecture. ✓ Ligne entière tappable, cellule réutilisable, avatar rond initiales en placeholder · ✗ Tap sur picto minuscule, lignes tassées, variante de liste par écran. (src: Y7q6MJDj7T8, Iwt1XP4c2DM, -mnsobvWmKk, IzxTi7Fs50Q etc.)

- **⭐ R10 — Tab bar fixe en bas, pleine largeur, 4-5 entrées, icône + label sous l'icône ; jamais de « + »/action dedans.** Pourquoi: la zone basse est la plus accessible au pouce, les icônes seules sont ambiguës, et un « + » qui pousse une page cache la nav principale. ✓ 4-5 onglets pleine largeur, label court · ✗ Tab bar en haut, sans label, ou « + » glissé parmi les onglets. (src: z4MaPOCNaXU, GyT7sM3SvFk, TvQVANr4eIo, EEnmrw-xutg etc.)

- **◐ R11 — Distinguer push (nav hiérarchique, back flèche en haut-à-gauche selon l'OS) et modale (création/action ponctuelle, croix) ; ancrer le chrome de header en haut quel que soit le réagencement du contenu.** Pourquoi: l'utilisateur scanne le coin haut-gauche pour « back » par habitude plateforme, et pousser une vue pour une création ponctuelle pollue l'historique. ✓ Back + actions réservés au haut, création en modale + croix · ✗ Back enterré en réorganisant le corps, vue poussée pour une création. (src: GyT7sM3SvFk, TvQVANr4eIo, E1McbVSPhUI, TSjoCJ_bWBU etc.)

- **⭐ R12 — Gérer le clavier : ne jamais masquer le champ actif, ancrer le CTA juste au-dessus, valider en un seul tap, prévoir une hauteur de clavier variable testée sur device.** Pourquoi: un champ caché fait paraître l'app buguée, un double tap (fermer puis enregistrer) frustre, et la hauteur de clavier iOS/Android est imprévisible. ✓ Champ remonté, CTA au-dessus, bouton qui ferme ET exécute · ✗ Champ recouvert, action critique en bas non vérifiée, hauteur hard-codée. (src: Y7q6MJDj7T8, Dkc4j6jrzY4, TSjoCJ_bWBU, qikafis2mEk etc.)

- **◐ R13 — En saisie répétitive (quiz, drill) : auto-focuser le champ, sortir le clavier automatiquement, valider à entrée.** Pourquoi: aller cliquer ailleurs entre chaque saisie casse le rythme du cycle tape-valide-tape. ✓ Auto-focus, clavier ouvert, validation entrée, gros bouton next · ✗ Champ sans focus et clavier fermé à viser puis taper. (src: Y7q6MJDj7T8, EBPT9dxBh-Y)

- **○ R14 — Afficher les erreurs de formulaire inline sous le champ ; traduire toute info révélée au hover en action au tap (le rollover n'existe pas sur tactile).** Pourquoi: l'infobulle au survol et le popup n'existent pas/encombrent sur mobile, alors que l'erreur sous le champ s'adapte et marche aussi sur desktop. ✓ Label/champ/erreur dessous, états hover → expand au tap · ✗ Erreur en infobulle/popup, info dépendant du survol. (src: Y7q6MJDj7T8, 2c9eKGLniCI)

- **⭐ R15 — Sur natif/PWA, suivre les patterns plateforme (tab bar, gestures, back) et respecter les safe areas (notch/status bar, home indicator) ; ne pas transposer un layout web (footer fixe, burger).** Pourquoi: un footer fixe ou un burger fait « très web » et gâche l'espace, et un contenu collé au bord tombe dans le notch ou la zone système. ✓ Tab bar, contenu sous le notch et au-dessus de la barre système, kit device · ✗ Footer fixe/burger réutilisés, dessin jusqu'au bord brut. (src: tS-SnvxC4oo, KuQVqSulCeM, vn8OrEst5PU, JYEhyqjt2Ag etc.)

- **⭐ R16 — Modale = bottom-sheet : ouverture depuis le bas, handle visible, fermeture par swipe down en plus du clic extérieur, actions clés dans la zone basse.** Pourquoi: sur iOS/Android l'utilisateur s'attend à « jeter » la modale vers le bas et une action trop haute est inconfortable. ✓ Bottom-sheet handle + swipe down + clic extérieur · ✗ Fermable seulement au clic extérieur, sans geste ni poignée. (src: Jy-fkFLw3oA, TvQVANr4eIo, X4X-M3E_Re4)

- **⭐ R17 — Remplir l'écran : pas de grandes zones vides/sombres sur un feed ou un écran de flux ; étirer les listes sur toute la hauteur et combler le vide par du contenu de réassurance.** Pourquoi: une liste confinée ou un tiers d'écran blanc gâche la place, alors qu'un récap (nom/adresse) oriente et rassure. ✓ Contenu utile pleine hauteur, bloc de réassurance dans le vide · ✗ Larges bandes vides, liste minuscule, gros void avec une seule image. (src: 1REsiT0dH1E, zPiSIoKyPs4, 1JPnZuqLqqk)

- **⭐ R18 — Animer les transitions (push/back, swipe) en gardant la tab bar stable ; rendre l'état sélectionné nettement distinct (accent + label, inactifs atténués) et signaler une phase forte par une teinte plein écran. ⚠ Une commande qui conditionne tout l'écran (sélecteur de contexte) va en haut malgré l'ergonomie du pouce.** Pourquoi: sans transition les écrans « popent », un actif à peine visible laisse dans le doute, et un aplat plein écran se lit du coin de l'œil mieux qu'un petit indicateur. ✓ Push animé, tab bar ancrée, actif = accent, teinte plein écran selon la phase · ✗ Changements secs, tab bar embarquée dans l'animation, actif quasi invisible. (src: z4MaPOCNaXU, TvQVANr4eIo, EEnmrw-xutg, tkYPf2ZPhrY etc.)

## Anti-patterns

- ✗ Cibles tactiles minuscules reprises d'une densité desktop ; CTA principal en haut/au centre hors de portée du pouce.
- ✗ Valider tailles/contrastes sur le canvas desktop ; frame de largeur ≠ device (scroll horizontal fantôme).
- ✗ Mobile en afterthought ; desktop compressé au lieu d'être ré-agencé ; deux colonnes ou grille 2x2 là où une liste suffit ; fontes desktop gardées.
- ✗ Tab bar en haut/sans label, avec un « + » qui cache la nav ; back ailleurs qu'en haut-à-gauche ; chrome de nav déplacé en réagençant le contenu.
- ✗ Champ actif masqué sous le clavier, double tap, CTA collé en bas qui disparaît clavier ouvert ; erreur en infobulle/popup ; info révélée au hover sur tactile.
- ✗ Footer fixe / burger / layout web transposé en natif ; safe areas ignorées (contenu dans le notch / la barre système).
- ✗ Modale fermable seulement au clic extérieur, sans handle ni swipe ; transitions sèches ; tab bar embarquée dans l'animation.
- ✗ Grandes zones vides/sombres sur un feed ; liste confinée ; un seul format figé non responsive ; images déformées ; actif à peine visible.

## Checklist build

- [ ] Cibles tactiles dimensionnées pouce, espacées ; CTA principal en bas, pleine largeur, accessible (au-dessus du clavier si saisie).
- [ ] Maquette jugée en mirror sur le device cible ; largeur de frame = device réel (zéro scroll horizontal).
- [ ] Version mobile conçue explicitement (mobile-first sur produit neuf) ; maquette avant code.
- [ ] Une info / une action par écran ; flux en étapes plein écran, paradigme cohérent ; reflow une colonne plutôt que tasser.
- [ ] Liste verticale plutôt que grille ; corps ~16-17px ; cellules surface entière cliquable (~88-96px), composant homogène, avatar à gauche, baseline alignée.
- [ ] Tab bar bas, fixe, 4-5 entrées, icône + label, pas de « + » ; push vs modale distingués, back en haut-à-gauche.
- [ ] Clavier : champ visible, CTA au-dessus, un seul tap, hauteur testée ; auto-focus en saisie répétitive ; erreurs inline, hover traduit en tap.
- [ ] Patterns natifs (pas de footer fixe/burger), safe areas notch/home ; modale bottom-sheet avec handle + swipe.
- [ ] Aucun grand vide injustifié ; listes pleine hauteur ; réassurance dans les zones creuses.
- [ ] Transitions animées, tab bar stable ; état sélectionné nettement distinct (teinte plein écran si pertinent) ; responsive testé sur plusieurs largeurs.
