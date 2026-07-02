---
theme: Personnalité & anti-générique
type: ui-ux-standard
audience: agent-llm
sources: basti, getdesign.md
rules_count: 18
videos_count: 62
---

# Personnalité & anti-générique — standards UI/UX

> Règles pour un agent qui construit du front. Agnostique de charte. Appliquer par défaut sauf contrainte projet.

## Règles

- **⭐ R1 — Ajouter au moins UN élément signature non-substituable et le décliner partout, jamais orphelin.** Un build techniquement propre (kit générique, premier rendu IA) reste "triste", interchangeable, "sent le template". Choisir un marqueur impossible à retrouver ailleurs (illustration/mascotte custom, motif, picto dessiné main, texture, motion spécifique) sur une base propre, et le propager (décors, transitions, mises en avant). Une signature utilisée une seule fois ne porte pas la DA ; ne pas sur-ajouter non plus. Pourquoi: la différenciation premium vient d'un choix humain répété, pas d'un assemblage de defaults. ✓ Base propre + 1 signature forte propagée · ✗ Skin par défaut livré tel quel, signature orpheline, OU surcharge. (src: abrRIgqS7t0, dPi-o1rsHpI, Jb8zWUDd16Q, X3__7JkTEYE, etc.)

- **⭐ R2 — Adapter le registre esthétique à la personnalité RÉELLE du sujet, du secteur et de l'audience — jamais à la tendance ni aux clichés du medium.** Identifier le métier, l'univers, l'émotion (luxe → fines + air ; friendly → arrondis + couleur) puis en dériver la DA. Ne pas plaquer les codes génériques du medium (gaming = néons/3D, fintech = bleu/blanc, santé = stéthoscope) ni un style "agressif" sur un univers doux (santé, mariage = crème, pas vert-bancaire). Pourquoi: un style plaqué par défaut sonne faux ; l'adéquation style/sujet/audience n'est pas négociable. ✓ Confronter chaque choix à l'énergie réelle de la marque · ✗ Style du moment ou codes standards de la plateforme posés sans tester la résonance. (src: H0aZGKzdQas, QqvW6jlH8KA, abrRIgqS7t0, EBPT9dxBh-Y, etc.)

- **⭐ R3 — Rejeter les clichés visuels du secteur, mais twister un cliché assumé plutôt que partir dans l'abstraction illisible.** Reproduire les codes évidents (néons gaming, stéthoscope santé, engrenages tech) produit un design oubliable ; l'abstraction que personne ne relie au métier échoue aussi. Partir d'un symbole attendu et lui appliquer une rotation créative. Pour une marque locale à l'étranger, miser à fond sur les codes du pays d'origine plutôt qu'un métissage tiède. Pourquoi: se démarquer = transcender les attentes en gardant le sens. ✓ Lister les codes attendus, en prendre un et le faire pivoter · ✗ Cliché brut, OU abstraction sans accroche. (src: 5SSwdpSg_v0, 5scZtI4rwBA, cyy_yJdK1Zw)

- **⭐ R4 — Utiliser l'IA générative pour l'exécution répétitive, jamais pour les orientations créatives : sa V0 est générique par nature.** L'IA produit des templates statistiquement corrects donc interchangeables. Lui déléguer harmonisation de palette, alignements, variantes, dégrossissage de V0 ; lui interdire DA, personnalité, architecture d'info. Ne jamais accepter le premier rendu IA sans y injecter un élément de marque propre. Pourquoi: la valeur reste l'itération humaine. ✓ IA = main-d'œuvre, puis itération humaine · ✗ IA = directeur artistique, ou rendu auto livré tel quel. (src: tpDKx8Mwse0, 6BFEdA2-Ko8, dPi-o1rsHpI)

- **⭐ R5 — Préférer le minimalisme / l'épure : il se démode lentement et signale la maîtrise ; base sobre + accents flashy localisés.** Un projet épuré reste moderne longtemps, quand glassmorphisme/neumorphisme/grain datent vite. "Le pro écrit son nom en noir sur fond blanc ; tout plein de trucs fait débutant." Socle neutre puis injecter la personnalité par touches. Viser un univers identifiable sans tomber dans le saturé ni dans le "Google Form" si plat que c'en est mort. Pourquoi: surcharger pour "paraître" expérimenté produit l'effet inverse. ✓ Aller à l'essentiel, base sobre + accents · ✗ Tendance du moment sur projet >18 mois, surcharge, ou plat total. (src: WZ5Axl2noSA, m4mbViTKKrg, NDWOBuI_M04)

- **⭐ R6 — Donner une personnalité via un thème/concept incarné et des détails caractériels, plutôt que le look par défaut d'un framework.** Ancrer le look dans un concept qui colle à l'univers (esthétique console pour un jeu, présentateur animé qui réagit). Une mascotte avec attitude crée de l'attachement mieux qu'un pictogramme froid ; donner une personnalité DISTINCTE à chaque élément d'un set (expressions, regards variés) — des visages au regard identique paraissent creepy. Pourquoi: un concept incarné rend l'interface mémorable. ✓ Concept fort + touches caractérielles contextuelles, expressions variées · ✗ Look par défaut d'un kit quand le produit a une identité. (src: _qJsGxE_Azg, 5scZtI4rwBA, 03odlgh212A, KOS6cHL8E44, etc.)

- **⭐ R7 — "Beau" ≠ "utilisable" : valider chaque choix en conditions réelles et avec des données edge-case, pas en maquette calibrée.** Un rendu impressionnant en Figma/3D échoue souvent sur le contraste, l'accessibilité, la cohérence à l'échelle ou l'impact en petit. Stress-tester avec du contenu pire-cas (pseudos longs, PNG transparents, photos manquantes) et dans le vrai contexte (mobile, soleil, daltonisme, feed entouré d'autres) avant de figer. Pourquoi: un screenshot calibré ment ; les problèmes surgissent au contact du réel. ✓ Lisibilité + accessibilité + cohérence + edge-case en contexte réel · ✗ Valider un style fort sur screenshots full-screen et données idéales. (src: zUj_SRriX2w, HZ2zUgE4W-0, D0wU2bpHzmw, DISt9XWYZ5I)

- **◐ R8 — Reconverger après exploration : limiter polices, styles d'icônes, formes directrices et accents pour une DA homogène.** L'exploration diverge, une DA livrée converge. Unifier le style d'icônes/illustrations, fixer 2-3 formes directrices et s'y tenir (une forme isolée sur un seul composant lit "maquette inachevée"). Accorder le rayon des coins au caractère du sujet (carrés pour Minecraft, pas d'arrondis "childy" sur du premium). Pourquoi: l'hétérogénéité non maîtrisée lit comme amateur. ✓ Une famille d'icônes, formes directrices fixées, cohérence forme↔sujet · ✗ 3 styles d'icônes + une diagonale surgie de nulle part. Détail couleur → voir couleur-contraste. (src: nH7g3cHqiOw, hUTjEe3F9IA, woo1_GaHeg4, oummVionT88, etc.)

- **◐ R9 — Maintenir la cohérence d'un parti pris fort de bout en bout : si on choisit un univers, en respecter tous les codes.** Empiler des styles disparates sans fil conducteur produit du générique. Un univers "terminal/prompt" impose le ferré-gauche en chasse fixe partout — y mêler des anims marketing centrées crée une dissonance qui agace. Calibrer la densité à la cible : un produit nerd/dev assume le dense et technique, le grand public exige l'épure. Pourquoi: un concept tenu jusqu'au bout signe la maîtrise. ✓ Codes du concept respectés partout, densité calibrée · ✗ Deux registres contradictoires dans le même écran. (src: 8WFeiimrqrI, 5v-nUs332rM)

- **◐ R10 — Réchauffer un design trop froid/institutionnel par formes organiques, couleurs chaudes et touches humaines.** Une interface correcte mais froide (gris désaturés, CTA en simple contour, "fait carte de parking / PayPal") manque d'humanité pour un produit censé être chaleureux. Introduire formes douces signature, fond chaud texturé, signature/visage des fondateurs, message signé ; adoucir une géométrie trop dure quand la marque doit être humaine. Pourquoi: une exécution parfaite mais froide est un défaut quand le registre appelle la chaleur. ✓ Formes organiques + ton chaleureux adapté à l'usage · ✗ Neutre, contouré, désaturé pour un produit chaleureux. (src: 8WFeiimrqrI, iWKr7V0yblI, H0aZGKzdQas, HJsKD_le65w, etc.)

- **◐ R11 — Construire la personnalisation utilisateur en briques composables et la propager dans toute l'UI.** Une personnalisation sur un seul axe est pauvre ; combiner 2-4 axes indépendants (forme + fond + badge + couleur) donne une forte customisation sans illustrer chaque variante à la main. Propager les choix (couleur de marque, avatar) à tous les éléments pertinents pour renforcer l'appropriation, au lieu de les confiner à un écran isolé. Pourquoi: l'identité teinte l'ensemble et crée l'attachement. ✓ 2-4 axes composables, propagés partout, set de base libre · ✗ Sélecteur unique confiné au profil, ou avatars dessinés un par un. (src: _qJsGxE_Azg, Vg_Ew1PHTOI, Yt2ZV60tyGk, I5E4NmtTAT8)

- **◐ R12 — Forcer l'exploration des directions qu'on évite, séparer "idées" de "validation", valider une direction via mood board.** On reproduit inconsciemment sa zone de confort (pop/clean/moderne) en cinquante variantes du même réflexe. Cartographier ses pistes et creuser celle qu'on n'explore jamais ; multiplier les benchmarks sans valider trop tôt. Faire approuver un mood board en amont : un résultat "tendance" validé devient un choix délibéré, pas un accident. Pourquoi: le style de confort uniformise la production. ✓ Cartographier la piste évitée, diverger avant de figer, mood board validé · ✗ Direction figée dès la première idée. (src: yV4PUOHzuJk, m4mbViTKKrg, z4MaPOCNaXU, A3u3y-ki16o)

- **◐ R13 — Réserver la gamification aux registres où elle est crédible ; en contexte sérieux (santé, finance) elle active des associations dark-pattern.** Une roue de fortune dans une appli d'assurance santé est lue TMU/AliExpress. Aligner les mécaniques au registre émotionnel : progrès mesurable et récompenses fonctionnelles pour les apps sérieuses. Cas inverse : une app de jeu doit assumer l'univers (textures, couleurs pleines, immersion), surtout pas s'habiller en dashboard B2B. Pourquoi: la mécanique d'engagement doit s'aligner sur la confiance que le service doit inspirer. ✓ Mécaniques alignées ; immersion assumée pour le jeu · ✗ Roues/badges/streaks dans un service de confiance, jeu habillé en outil corporate. (src: DrY4WPlIFnQ, yV4PUOHzuJk)

- **◐ R14 — Quand un élément fort et décoratif (3D, illustratif, bold) est utilisé, garder son environnement sobre et net pour le valoriser.** Isoler la signature sur fond neutre/minimal — le contraste complexe/épuré crée la tension premium (modèle Airbnb). Accumuler dégradé + 3D + texte stylisé + fond coloré : tout se combat, rien ne ressort. Donner au focal une forme nette plutôt qu'un flou diffus ; garder le blur en arrière-plan seulement. Pourquoi: le focal n'existe que par le vide et la netteté autour de lui. ✓ Élément complexe isolé sur fond neutre, contours nets · ✗ Empiler plusieurs éléments forts, ou flouter le composant lui-même. (src: d6MM1Bjkerk, TU5sjJUjMy4)

- **◐ R15 — Garder les signatures graphiques (police dessinée main, zigzags, motifs de marque) hors des zones fonctionnelles, et les doser.** Un ornement collé au texte ou dans un bouton nuit à la lisibilité et brouille l'affordance (on dirait deux boutons). Les réserver aux zones d'expression (titres, accroches), espacés, exclus des libellés et de la lecture dense ; un motif de marque s'utilise avec parcimonie et règles cohérentes. Trop d'éléments littéraux deviennent cringe. Pourquoi: la signature perd sa force diluée et dégrade l'usage en zone fonctionnelle. ✓ Signature rare, régulière, hors des contrôles · ✗ Ornement dans un bouton/collé au texte, motif multiplié. (src: wFhs3s7M1YE, ca44Xf3rRAM, xl1QDX_u7W0)

- **◐ R16 — Concevoir une identité comme système dynamique adaptable, pas comme logo figé, en dérivant les formes d'éléments réels du contexte.** Identifier le "héros" de l'identité, garder sa forme fixe mais rendre variable sa couleur/contenu pour absorber contextes, pays, thèmes. Faire dériver les formes signature d'éléments signifiants de l'univers (la courbe d'une lampe du décor) plutôt que de formes arbitraires. Oser découpes et overlaps légers plutôt que des boîtes carrées clonées. Pourquoi: un système vivant et sourcé reste mémorable. ✓ Forme fixe + couleur/contenu variable, formes sourcées de l'univers · ✗ Déclinaison improvisée par contexte, arrondis au hasard. (src: tRq1v6etUE8, KOS6cHL8E44)

- **○ R17 — Construire la reconnaissabilité d'un logo/personnage sur sa silhouette, pas sur ses détails internes.** L'œil mémorise la forme globale : tester en silhouette noire sur fond blanc. Ne pas remplacer une lettre du wordmark par un objet/picto (force un switch lecture→reconnaissance) — placer l'objet symbolique hors du mot. Décaler les palettes trop génériques (pas exactement les couleurs Microsoft) : copier une marque archi-référencée fait perdre toute singularité. Pourquoi: l'originalité ne doit jamais coûter la lisibilité. ✓ Silhouette forte, objet symbolique hors du mot, teintes décalées · ✗ Reconnaissance basée sur détails invisibles en petit, lettre remplacée par un picto. (src: wbThBLdjZh0, 03odlgh212A, D0wU2bpHzmw)

- **○ R18 — Calibrer le niveau d'exigence sur les enjeux : V0 brute mais lisible, croquis avant polish, finition là où elle différencie.** Un proto en cours n'a pas les enjeux d'une marque finie. Accepter une V0 brute mais lisible (sans pictos finis ni alignements parfaits), idéation low-fidelity avant raffinement, sans jamais livrer d'illisible "parce que temporaire". Ne pas s'acharner sur un micro-détail décoratif au détriment des écrans structurants. Sur un marché disputé, le "correct" ne suffit pas : investir le budget finition là où il crée de la différenciation perçue. Pourquoi: l'effort doit aller là où il change l'expérience. ✓ Rigueur pondérée, V0 lisible, finition là où elle différencie · ✗ Standards premium plaqués sur un proto, perfectionnisme sur un ornement, ou "ça marche" sur un marché disputé. (src: F2TFh0oUH3c, CHboIoYXU5A, KOS6cHL8E44, Yt2ZV60tyGk, etc.)

> Digressions hors-thème déplacées : typographie de personnalité (titres expressifs, lisibilité corps) → **voir hierarchie-visuelle-typographie** ; motion / micro-interactions signature, mouvements organiques de mascotte → **voir motion-micro-interactions** ; langage de couleur d'interface (accent = cliquable, interface neutre), thème dark data-heavy, emojis vs pictos → **voir couleur-contraste**.

## Anti-patterns

- ✗ UI 100% composants génériques / V0 IA livrée telle quelle / signature forte employée une seule fois → "sent le template" (R1, R4).
- ✗ Style tendance ou codes génériques du medium (gaming = néons, fintech = bleu, santé = stéthoscope) plaqués sans lien avec le sujet réel (R2, R3).
- ✗ Charte agressive/criarde sur un univers doux (santé, mariage, bien-être) (R2, R10).
- ✗ IA qui définit DA/personnalité/architecture d'info, ou V0 générée livrée sans itération (R4).
- ✗ Tendance éphémère sur projet longue durée, surcharge pour "paraître" expert, ou plat total type Google Form (R5).
- ✗ Look par défaut d'un framework quand le produit a une identité ; visages au regard identique (creepy) (R6).
- ✗ Cliché iconographique du secteur brut, abstraction que personne ne relie au métier, ou métissage tiède de deux cultures (R3).
- ✗ Validation sur screenshot Figma full-screen et données placeholder idéales, jamais en mobile/contraste/edge-case (R7).
- ✗ 3 polices + plusieurs styles d'icônes, forme isolée sur un seul composant, arrondis "childy" sur du premium (R8).
- ✗ Mixer deux registres contradictoires (terminal + marketing animé centré) dans le même écran (R9).
- ✗ Design neutre, contouré, désaturé "corpo" pour un produit censé être humain/chaleureux (R10).
- ✗ Personnalisation réduite à un sélecteur de couleur confiné au profil, ou avatars dessinés un par un (R11).
- ✗ Cinquante variantes du style de confort, direction figée dès la première idée, sans mood board validé (R12).
- ✗ Roues/badges/spinners dans un service de confiance, ou jeu habillé en dashboard corporate (R13).
- ✗ Élément 3D/bold noyé dans un fond chargé, ou composant focal entièrement flouté (R14).
- ✗ Ornement déco dans un bouton/collé au texte, motif de marque multiplié, page saturée de visuels littéraux (R15).
- ✗ Identité figée en variantes ad hoc par contexte, formes choisies au hasard sans lien avec l'univers (R16).
- ✗ Reconnaissance d'un logo basée sur des détails invisibles en petit, lettre du wordmark remplacée par un objet, palette copiée pixel pour pixel (R17).
- ✗ Standards premium plaqués sur un proto, perfectionnisme sur un ornement, ou "ça marche/correct" sur un marché disputé (R18).

## Checklist build

- [ ] Base propre + au moins 1 élément signature non-substituable, décliné plusieurs fois, jamais orphelin (R1).
- [ ] Registre esthétique validé contre la personnalité réelle du sujet/secteur/audience, pas contre la tendance ni les codes du medium (R2, R3).
- [ ] IA cantonnée à l'exécution répétitive ; aucune décision créative déléguée ; V0 enrichie + itération humaine (R4).
- [ ] Minimalisme privilégié sur les projets durables ; base sobre + accents localisés ; ni surcharge ni plat total (R5).
- [ ] Concept/thème incarné + détails caractériels ; expressions variées sur un set de mascottes (R6).
- [ ] Chaque choix testé en conditions réelles (mobile, contraste, contexte) ET avec données edge-case (R7).
- [ ] DA reconvergée : famille d'icônes unique, 2-3 formes directrices fixées, cohérence forme↔sujet ; parti pris tenu de bout en bout (R8, R9).
- [ ] Design froid réchauffé par formes organiques + touches humaines quand le registre l'appelle (R10).
- [ ] Personnalisation en 2-4 axes composables, propagée dans toute l'UI ; au moins une direction hors zone de confort explorée, mood board validé (R11, R12).
- [ ] Gamification alignée sur le registre (interdite si elle évoque les dark patterns) ; immersion assumée pour un jeu (R13).
- [ ] Élément décoratif fort isolé sur fond neutre/net ; signatures graphiques hors des zones fonctionnelles et dosées (R14, R15).
- [ ] Identité pensée en système (forme fixe, couleur/contenu variable), formes sourcées de l'univers ; logo reconnaissable en silhouette (R16, R17).
- [ ] Niveau d'exigence calibré sur les enjeux ; V0 lisible ; finition investie là où elle différencie (R18).

## Compléments — méthode anti-générique (src: getdesign.md)

> Source : [getdesign.md](https://getdesign.md) — collection de 75+ fichiers `DESIGN.md` de marques réelles (Claude, Stripe, Linear, Figma, Tesla, Apple…).

- **Partir d'un DESIGN.md de référence plutôt que des défauts génériques.** Pour éviter l'UI « générée par IA », ne pas laisser l'agent partir de ses defaults statistiques : lui fournir un `DESIGN.md` structuré (tokens, typo, espacement, motifs de marque) d'un site dont l'esthétique correspond à la cible du projet, et lui demander de construire « dans cet esprit ». Encoder explicitement la DA en amont = première parade contre le rendu interchangeable. (Ressource : getdesign.md — à choisir selon la DA du projet, jamais par défaut.)
