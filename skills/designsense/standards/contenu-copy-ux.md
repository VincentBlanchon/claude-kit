---
theme: Contenu & copy UX
type: ui-ux-standard
audience: agent-llm
sources: basti
rules_count: 15
videos_count: 47
---

# Contenu & copy UX — standards UI/UX

> Règles pour un agent qui construit du front. Agnostique de charte. Appliquer par défaut sauf contrainte projet.

## Règles
- **⭐ R1 — Réduis le texte à l'essentiel : accroche courte, libellés directs, jamais deux paragraphes là où une ligne suffit ; détail renvoyé en secondaire.** Pourquoi: l'utilisateur scanne, le surplus noie l'action. ✓ Libellés courts, cartes ≤ 3-4 lignes, écran compris d'un coup d'œil. ✗ Paragraphes denses, slides d'onboarding empilées, phrases de remplissage. (src: Awoo_YRhaS8, -V2LUoHsZn0, u5npy8xAIlY etc.)
- **⭐ R2 — Le libellé d'un CTA porte un verbe d'action décrivant le résultat concret, du point de vue de l'utilisateur, pas un mot générique ni du jargon système.** Pourquoi: un bouton est une promesse d'action ; un verbe explicite lève l'ambiguïté et augmente la pertinence du clic. ✓ « Démarrer le round », « Découvrir nos offres », « Prendre rendez-vous ». ✗ « Suivant », « OK », « C'est parti », « Go », « créer un round ». (src: 6BFEdA2-Ko8, Yt2ZV60tyGk, xl1QDX_u7W0 etc.)
- **⭐ R3 — Le hero s'auto-vend dès l'arrivée : une accroche courte (ce qu'on fait, pour qui) lisible en un éclair, pas un slogan cryptique ni un pavé.** Pourquoi: le visiteur doit comprendre l'offre en un instant, sinon il ne lit pas. ✓ Promesse claire de 1 à 3 lignes ; pour un site de news, afficher d'emblée le contenu. ✗ Titre énigmatique, terme répété 3×, paragraphe verbeux au-dessus de la ligne de flottaison. (src: HJsKD_le65w, CwiRIETV2rM, GyT7sM3SvFk etc.)
- **⭐ R4 — Coupe le copywriting décoratif : ne garde que les phrases porteuses d'info, supprime redites et doublons (pas deux titres synonymes, pas la home recopiée dans les pages internes).** Pourquoi: sans contenu de valeur une page sonne creux ; « solutions sur mesure » informe là où « solutions » remplit. ✓ Contenu concret et différenciant, un seul intitulé clair par section. ✗ Habiller du vide, répéter « project / my latest project », recopier la home dans « Prestations ». (src: xiOwfBY1dIk, y1FaqXCaWGc, 3CJSHeO84Dc etc.)
- **◐ R5 — Hiérarchise le contenu avant le branding : produit, prix et proposition de valeur en lecture primaire ; accentue l'actionnable, garde le reste neutre.** Pourquoi: l'utilisateur vient acheter ou comprendre, pas admirer une marque ; un branding dominant rend l'offre illisible et fait chuter la conversion. ✓ Titre produit, prix et bénéfice clé dans les premiers éléments lus. ✗ Noyer l'offre sous aplats décoratifs ou logo surdimensionné ; donner le même poids visuel à tout. (src: le77ZiMUST8, -mnsobvWmKk)
- **◐ R6 — Sers l'argument de réassurance au point de décision (sur la fiche, près du CTA), formulé comme une comparaison chiffrée, pas un superlatif vague.** Pourquoi: un chiffre face à un référent (« 2,7× moins de sucre que les standards ») est vérifiable et mémorisable, là où « premium » sonne cheap. ✓ Preuve chiffrée directement sur la carte produit ou à côté du bouton. ✗ Enfouir l'argument en « À propos » ou footer ; empiler des superlatifs creux. (src: vvk_VVp4FII, mas_dOy194s, Jnx-LT0FKAg)
- **◐ R7 — Promets le résultat et l'usage, jamais la technique sous-jacente : l'utilisateur achète une transformation, pas une stack.** Pourquoi: une promesse technique ne déclenche pas le désir ; l'utilisateur veut un résultat ou du temps gagné. ✓ « Fini les shootings de 3h, vos portraits en quelques secondes ». ✗ « Créez des images grâce à notre IA en quelques clics » comme proposition de valeur. (src: CHboIoYXU5A, xiOwfBY1dIk, Yt2ZV60tyGk)
- **◐ R8 — Soigne la lisibilité du texte long : une seule colonne mesurée (jamais full-width), texte natif (pas baké dans image/PDF), titres nettement plus lourds que le corps et gris assez foncé.** Pourquoi: une colonne trop large fatigue l'œil ; titres et corps trop proches ou gris délavé cassent le repérage et la lecture. ✓ Colonne de lecture confortable, texte natif (SEO/mobile), poids de titre exagéré, gris foncé. ✗ Paragraphe full-width, copy en image/PDF, titres à peine marqués, gris pâle. (src: gDG_em0qtC0, R1DNknJvp64, 44L6uJKFg_4 etc.)
- **◐ R9 — Explique toute interaction non évidente : onboarding court qui pose la règle essentielle avant de plonger l'utilisateur, et tooltip de déblocage sur un contrôle verrouillé/conditionné.** Pourquoi: raccourcis, toggles, icônes custom ou éléments grisés restent indécouvrables sans cadrage. ✓ Concept résumé en un écran concis, hint dismissible, tooltip au survol d'un élément verrouillé. ✗ Lancer dans l'interface sans cadrage, griser un contrôle sans indice. (src: 5v-nUs332rM, _qJsGxE_Azg, HJsKD_le65w etc.)
- **◐ R10 — Aligne tous les blocs de la même façon (gauche de préférence) et applique la casse de phrase en français — pas d'alignements alternés « pour faire original », pas de Title Case ni de tout-capitales.** Pourquoi: zigzaguer fatigue l'œil ; la majuscule à chaque mot est une convention anglaise inadaptée et le tout-capitales paraît agressif. ⚠ Contextuel : un contenu court/ludique peut gagner au centre si le test sur le cas réel le montre. ✓ Alignement unique, sentence case, originalité via typo/motion. ✗ Ferrer un bloc à droite pour varier, « Me Contacter », titres en CAPITALES. (src: GwaW_kUsDWs, 8WFeiimrqrI, mUeYHTectNM etc.)
- **○ R11 — Présente les données de façon scannable : ordre de lecture naturel et grammatical (valeur prioritaire en tête), attributs convertis en data-viz (picto + chiffre) plutôt qu'en texte brut.** Pourquoi: l'ordre des mots change la lisibilité d'un chiffre (« 47 points par joueur en moyenne » > « moyenne de points par joueur : 47 »), et une liste d'attributs en texte est lourde face à des indicateurs scannables. ✓ Valeur puis qualification, pictos/indicateurs groupés, icône fidèle au sens. ✗ Ordonner par contrainte de gabarit, empiler les caractéristiques en texte, réutiliser un même picto pour deux actions. (src: 2c9eKGLniCI, FPtXFeQUns0, 4aZA8E9tldA etc.)
- **○ R12 — Réponds tôt et en clair à l'objection bloquante (vie privée, données) plutôt que de l'enterrer en bas de page ou en FAQ.** Pourquoi: la 1re question d'un utilisateur qui uploade des données de soi est « où sont stockées mes données ? » ; y répondre dès la landing lève le frein. ✓ « Une fois le modèle entraîné, nous supprimons vos photos », formulé fort dans les promesses. ✗ Cacher la réponse en footer ou FAQ secondaire. (src: CHboIoYXU5A)
- **○ R13 — Fixe une règle d'adresse cohérente (tutoiement vs vouvoiement) et une seule langue par interface, et tiens-t'y.** Pourquoi: le « tu » crée de la proximité, le « vous » est plus distant ; alterner sans logique ou mélanger FR/EN paraît incohérent et nuit à la compréhension. ✓ Ton défini par surface puis homogénéisé, langue uniforme (ou vrai i18n). ✗ Panacher tu/vous ou français/anglais dans les mêmes écrans. (src: zPiSIoKyPs4, 3CJSHeO84Dc)
- **○ R14 — Skinne tout contenu tiers importé (article, tweet, image) à ta charte et étiquette le type de chaque contenu par un tag visible ; prévois mentions légales et crédits, attribue le contenu communautaire.** Pourquoi: un asset collé brut casse la cohérence, et sans étiquette on ne distingue pas un tutoriel d'une fiche produit ; mentions et crédits font partie d'un produit fini. ✓ Embed re-stylisé, tag « Tutoriel », espace réservé aux mentions/crédits, « artwork by [auteur] ». ✗ Screenshot brut, éditorial et commercial mélangés sans signal, livraison sans mentions ni attribution. (src: KOS6cHL8E44, CR65uXRVp80, I5E4NmtTAT8 etc.)
- **○ R15 — Réduis la friction d'entrée : login différé (poussé seulement au moment d'une action qui le requiert) et un seul CTA secondaire par zone, en plus du primaire.** Pourquoi: imposer la connexion dès l'accueil ajoute de la complexité ; empiler 2-3 CTA concurrents brouille la hiérarchie. ✓ Bouton « explorer » à l'entrée, popup login au point d'action, un CTA primaire + au plus un secondaire discret. ✗ Bloquer derrière login dès la home, multiplier liens et boutons dans le même bloc. (src: O6a4x1ignHE, JRA91H1XUiU, 6TDpE2yIXmA etc.)

## Anti-patterns
- ✗ Mur de texte : paragraphes denses, slides d'onboarding redondantes, cartes en pavé.
- ✗ CTA générique sans verbe (« Suivant », « OK ») ou issu du jargon technique interne.
- ✗ Hero cryptique ou verbeux ; copywriting décoratif et doublons (home recopiée, titres répétés).
- ✗ Brander avant d'informer ; donner le même poids visuel à tout au lieu d'accentuer l'actionnable.
- ✗ Superlatifs creux sans chiffre ni référent ; promesse technique au lieu du bénéfice.
- ✗ Texte étalé full-width ; copy baked dans images/PDF ; titres à peine marqués, gris délavé.
- ✗ Interaction custom sans cadrage ni tooltip de déblocage.
- ✗ Alignements alternés ; Title Case à l'américaine ou tout-capitales en français.
- ✗ Objection bloquante (vie privée) enterrée ; login forcé dès l'accueil ; CTA concurrents empilés.
- ✗ Mélange tu/vous ou FR/EN dans la même interface ; contenu tiers collé brut sans skin.

## Checklist build
- [ ] Texte réduit à l'essentiel ; CTA avec verbe d'action concret ; détail renvoyé en secondaire.
- [ ] Hero lisible en un éclair, sans redite, copywriting décoratif ni doublon (pas de home recopiée).
- [ ] Produit / prix / bénéfice en lecture primaire avant le branding ; l'actionnable ressort.
- [ ] Arguments chiffrés servis au point de décision ; promesse en bénéfice, pas en technique.
- [ ] Texte long : colonne mesurée, texte natif, contraste titre/corps fort, gris foncé.
- [ ] Onboarding / hint / tooltip pour toute interaction non évidente ou contrôle verrouillé.
- [ ] Alignement unique ; casse de phrase en français (pas de Title Case ni tout-capitales).
- [ ] Données scannables (ordre naturel, picto + chiffre) ; objection vie privée traitée tôt.
- [ ] Ton d'adresse et langue homogènes ; contenu tiers re-stylisé et tagué ; mentions/crédits prévus.
- [ ] Friction d'entrée minimale : login différé, un seul CTA secondaire par zone.
