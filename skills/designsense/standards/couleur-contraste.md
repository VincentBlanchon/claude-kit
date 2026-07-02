---
theme: Couleur & contraste
type: ui-ux-standard
audience: agent-llm
sources: basti
rules_count: 17
videos_count: 88
---

# Couleur & contraste — standards UI/UX

> Règles pour un agent qui construit du front. Agnostique de charte. Appliquer par défaut sauf contrainte projet. Les hex ne servent que de contre-exemples (#000/#fff/#f5f5f5 purs à éviter), jamais d'imposition de palette.

## Règles

- **⭐ R1 — Répartir ~70/20/10 : ~70 % de neutre (fond), ~20 % de couleur de marque, ~10 % d'accent. Doser la charte, ne pas la déverser.** Pourquoi: couleur partout = contenu noyé, hiérarchie effondrée, look « crèche ». ✓ Fond neutre dominant, marque sur les éléments forts, accent rare sur CTA/highlights · ✗ Colorer fond + headers + bandeaux + textes + boutons. (src: le77ZiMUST8, PD0zE4-8kkI, -sbbhBf-GsI etc.)

- **⭐ R2 — Réserver l'accent aux actions et repères (CTA, liens, états, badges) ; le reste en neutre. Une seule couleur d'action, pilotée par un token unique.** Pourquoi: l'accent est une boussole « où est l'action ? » ; dilué sur titres/bordures/icônes déco/nav, il perd son rôle et un texte coloré se lit comme un lien. ✓ Accent cantonné aux interactifs, câblé sur une variable · ✗ Teinter titres, déco ou nav-bar ; hardcoder l'accent par élément. (src: W24Dq6WArL0, xl1QDX_u7W0, GH6EtS7-oN0 etc.)

- **⭐ R3 — Mesurer le contraste texte/fond à l'outil (Stark, contrast checker), viser WCAG AA ≥ 4,5:1, accepter le verdict — jamais juger à l'œil.** Pourquoi: l'œil juge mal ; clair sur clair échoue au soleil ou pour un malvoyant. Si le blanc échoue sur l'accent, écris en texte foncé. ✓ Tester chaque combo avant validation, agrandir le texte plutôt que sacrifier la lisibilité · ✗ Supposer qu'une teinte « semble lisible ». (src: zUj_SRriX2w, xiOwfBY1dIk, BfvBEI-FaIQ etc.)

- **⭐ R4 — Bannir les combos qui « vibrent » : blanc sur jaune/pastel, vert sur beige, clair sur clair, deux teintes proches. Sur fond coloré, garder fond OU texte proche du noir/blanc ; jamais vif sur vif.** Pourquoi: teintes voisines sans ancrage neutre = texte illisible, identité chaotique. ✓ Fond désaturé, accent ponctuel, texte noir sur teinte claire · ✗ Blanc sur pastille pâle, trois bleus empilés. (src: -sbbhBf-GsI, xiOwfBY1dIk, 80536Xm2qxU etc.)

- **⭐ R5 — Choisir un accent saturé et vibrant ; fuir les teintes fades, « web 1.0 », et les couleurs CSS brutes (`blue`, #00F). Quand le label est noir, pousser encore la saturation (jaune citron, orange vif).** Pourquoi: une couleur fade fait cheap et daté ; texte noir lève la contrainte de contraste, donc viser ce qui donne envie de cliquer. ✓ Tester l'accent sur fond clair ET sombre : il doit vibrer · ✗ Teinte délavée par inertie, ou brider l'action « par accessibilité » quand le texte noir tient déjà. (src: PENmi8HdY6Q, abrRIgqS7t0, 5Fj6DBpqK04 etc.)

- **⭐ R6 — Teinter tous les neutres, gris, ombres et fonds vers la primaire (1 % de saturation suffit) ; bannir les gris/noirs 100 % désaturés (#f5f5f5, #eee, #000).** Pourquoi: un gris parfaitement neutre sonne faux sur fond teinté (look backoffice) ; #000 pur est violent. Astuce : un secondaire = la couleur de texte à ~70 % d'opacité, pas un gris arbitraire. ✓ Neutres et ombres teintés, secondaires en opacités · ✗ Gris froids + accents chauds, #000/#fff purs. (src: NRvroyLcZ1M, 9OL4z1_XLQ8, Ff-hHf15kv4 etc.)

- **⭐ R7 — Limiter à 2-3 couleurs + neutres. Ne pas faire cohabiter deux teintes proches (bleu+violet, orange+rouge, deux bleus) sans désigner une dominante.** Pourquoi: une couleur par concept/état/catégorie sature l'identité, même hors écran ; deux voisines sans hiérarchie perdent l'œil. Mono-accent est légitime. ✓ 2-3 couleurs déclinées, une dominante désignée · ✗ Une couleur par item, rainbow de tags. (src: WZ5Axl2noSA, iWKr7V0yblI, GXlz4gUDcCA etc.)

- **⭐ R8 — Sur un produit visuel-centré (photos, screenshots), laisser les images porter la couleur : chrome neutre, accent rare. Retirer la couleur de marque si le contenu suffit.** Pourquoi: couleur partout + vignettes riches = over-saturation, look template. ✓ Structure neutre + accent sobre, photos qui injectent la couleur · ✗ Repeindre l'UI par-dessus un layout déjà riche en images. (src: H0aZGKzdQas, pfxqiqVyzt4, b4nk4Rw7YLQ etc.)

- **◐ R9 — Choisir dark vs light selon le contexte d'usage réel (lumière, durée), pas par cliché de domaine ; idéalement les deux + thème système.** Pourquoi: au soleil le fond clair est plus net ; le dark imposé « pour faire premium » sabote la lecture, mais streaming/lecture longue y gagne. ✓ Profiler quand/où l'app sert · ✗ Forcer le dark par esthétique en contexte lumineux. (src: W24Dq6WArL0, gDG_em0qtC0, -mnsobvWmKk etc.)

- **◐ R10 — En dark mode, ne pas inverser : palette sombre dédiée, contrastes revérifiés, accents/data-viz réajustés, teinte signature conservée.** Pourquoi: une valeur calibrée en light perd son contraste en dark (sous-titre plus lisible que le titre) ; garder la signature préserve l'identité. ✓ Valeurs distinctes light/dark, chaque contraste vérifié · ✗ Réutiliser le bleu du light, passer à un light gris triste. (src: gDG_em0qtC0, Dkc4j6jrzY4, iWKr7V0yblI etc.)

- **◐ R11 — En dark mode, respecter l'élévation : fond le plus sombre, surfaces/cellules plus claires au premier plan. Prévoir une échelle de gris (background-1/2/3), pas une seule valeur.** Pourquoi: l'élévation va du sombre vers le lumineux ; sans gris intermédiaires, pas de profondeur ni de hiérarchie de surfaces. ✓ Surfaces numérotées, du sombre vers le clair en montant · ✗ Un seul gris, ou cartes plus sombres que le fond. (src: vn8OrEst5PU, NEgct_mJIZE, 5v-nUs332rM)

- **◐ R12 — Nommer les couleurs par sémantique/rôle (positive, négative, warning, action, background-1/2/3, content-1/2/3), pas par valeur ; vérifier le contraste des états (le « positive » manque souvent de punch).** Pourquoi: des tokens sémantiques rendent la charte réutilisable, déclinable light/dark, retouchable sans casser le sens. ✓ Styles mappés aux composants, contrastes vérifiés · ✗ « #266 » en dur par écran, vert positif trop pâle. (src: -mnsobvWmKk, T4XL-VlD350, WchiZ2lPeoY etc.)

- **◐ R13 — Réserver une teinte distincte (gris/noir neutre) aux états négatifs/désactivés ; ne pas réutiliser la couleur de marque comme erreur. Re-vérifier le contraste après tout changement d'état (désaturation, disabled).** Pourquoi: si la primaire signale aussi l'erreur, l'alerte se confond avec l'identité ; passer en gris peut faire chuter le contraste sous le seuil. ✓ Palette d'état séparée de la marque, re-check après désaturation · ✗ Erreur codée avec l'accent omniprésent. (src: I5E4NmtTAT8, 5scZtI4rwBA)

- **◐ R14 — N'utiliser qu'un seul noir/sombre, teinté de la primaire (mode lighten/screen) ; ne pas faire cohabiter plusieurs noirs ni des sombres voisins (bleu foncé + vert foncé).** Pourquoi: deux sombres mal accordés créent un camaïeu « sale », surtout en dark mode. ✓ Un sombre unique décliné de la primaire · ✗ Empiler bleu foncé, vert, vert foncé comme bases. (src: 8WFeiimrqrI, mas_dOy194s, PD0zE4-8kkI)

- **◐ R15 — La lisibilité prime TOUJOURS : sur fond coloré/dégradé/animé, garder les éléments par-dessus neutres ; pour une surface translucide, dériver un overlay semi-transparent de la primaire (« gris dynamique »), pas un gris opaque hors-sol. Aucun glassmorphism ne doit dégrader le contraste.** Pourquoi: une couleur pleine entre en conflit avec un fond dynamique ; le Liquid Glass d'Apple a dû recevoir un kill-switch tant le texte devenait illisible. ✓ Overlay teinté, encart plein sous le texte, test dark + light · ✗ Couleur pleine ou gris opaque sur dégradé ; texte posé sur image sans fond contrasté. (src: 80536Xm2qxU, zUj_SRriX2w, njcLhEd3rd0 etc.)

- **◐ R16 — Viser un contraste juste : ni trop faible (illisible) ni trop fort. Éviter #fff pur sur #000 pur (halo/bavure, pénible aux astigmates) ; near-black/near-white, contours adoucis.** Pourquoi: « plus de contraste = mieux » est faux ; le blanc pur sur noir pur crée une traînée lumineuse autour des lettres. ✓ Écart de luminance équilibré · ✗ #000/#fff purs, contours full noir partout. (src: gDG_em0qtC0, abrRIgqS7t0, HJsKD_le65w etc.)

- **○ R17 — Choisir la couleur d'après le mood/secteur/émotion, pas par réflexe (rouge = alerte, vert = rassure, tons chauds = appétit) ; extraire la palette de l'identité existante du client (logo, bio, réseaux), distincte des concurrents, sans suivre la mode.** Pourquoi: l'utilisateur décode le sens avant de lire (bleu froid sur du food « coupe l'appétit ») ; une palette ancrée dans les assets reste cohérente, la différenciation est stratégique (Snapchat = jaune libre). ✓ Mapper sur l'intention, cartographier assets + concurrents, tendance optionnelle · ✗ Bleu « parce que ça fait pro » sur un marché saturé de bleu. (src: 5scZtI4rwBA, 34YQVsGQIb0, WZ5Axl2noSA etc.)

> ⚠ Débat « saturé vs désaturé pour le premium ». Résolution par surface, pas par fréquence : la **saturation** s'applique à l'**accent/marque** (qui doit vibrer, R5), la **désaturation** au **fond** (qui doit respirer, R6/R8). Compatibles : accent saturé sur fond neutre. Ne jamais saturer le fond.

> ⚠ Débat « désaturer vs assumer une palette pop ». Trancher au cas par cas : couleur = choix de marque assumé (→ garder, assainir ailleurs) ou débordement subi (→ désaturer le fond, concentrer sur l'accent) ? On désature un fond de teintes « soldes » subies, mais on protège une palette vive qui EST le positionnement.

## Anti-patterns

- ✗ Couvrir fond + headers + textes + boutons des couleurs de marque (overdose).
- ✗ Diluer l'accent sur titres, déco, fonds ou nav → patchwork, signal perdu ; colorer titres/corps de texte → se lit comme un lien.
- ✗ Combos qui vibrent (blanc sur jaune/pastel, vert sur beige, vif sur vif, teintes voisines sans ancrage).
- ✗ Valider à l'œil, sans contrast checker ni test mobile/compressé.
- ✗ Accent fade, « web 1.0 », couleur CSS brute, ou brider l'action quand le texte noir tient déjà.
- ✗ Gris/noir 100 % désaturés (#f5f5f5, #eee, #000), gris neutre sur fond teinté.
- ✗ Plus de 3 teintes, ou deux familles proches sans dominante.
- ✗ Repeindre une UI déjà riche en images avec la palette de marque.
- ✗ Inverser bêtement le light en dark ; light gris triste face à un dark teinté ; cartes plus sombres que le fond.
- ✗ Réutiliser la marque comme erreur ; recycler vert/rouge sémantiques en déco de catégorie.
- ✗ Plusieurs noirs ou sombres voisins comme bases d'un même thème.
- ✗ Couleur pleine ou gris opaque sur fond dynamique ; glassmorphism qui casse le contraste.
- ✗ #fff pur sur #000 pur (halo, fatigue).
- ✗ Encoder une info par la seule couleur (daltonisme) sans icône/label de secours.
- ✗ Multiplier les dégradés (fond + boutons + texte) ou bouton en dégradé brillant ; milieu de dégradé boueux non corrigé.
- ✗ Noir/jaune en base décorative ; couplage fort évoquant un cliché involontaire (orange+noir = Halloween).
- ✗ Tout colorer un dashboard (bouillie criarde) ; aplat coloré « pour remplir ».
- ✗ Imposer le dark mode par esthétique sur une app utilisée au soleil.
- ✗ Suivre la couleur tendance par mimétisme ; inventer des teintes hors-sol.

## Checklist build

- [ ] Répartition ~70/20/10 (neutre dominant, accent rare) ; charte dosée, pas déversée.
- [ ] Une seule couleur d'action, réservée aux interactifs, câblée sur un token unique.
- [ ] Tout texte mesuré au contrast checker (WCAG AA) ; verdict accepté ; aucun combo vibrant.
- [ ] Accent saturé/vibrant, testé fond clair ET sombre ; saturation poussée si label noir.
- [ ] Neutres, gris, noirs, ombres teintés vers la primaire ; pas de #000/#fff/#f5f5f5 purs ; secondaires en opacités.
- [ ] Palette ≤ 3 couleurs + neutres ; une dominante ; pas de teintes voisines en concurrence.
- [ ] Couleurs nommées par sémantique/rôle ; états contrastés ; marque non recyclée en erreur/déco.
- [ ] Dark mode = palette dédiée (pas une inversion), élévation respectée, signature conservée ; mode choisi selon l'usage réel.
- [ ] Sur fond dynamique : éléments neutres, overlay dérivé de la primaire ; transparences testées dark + light.
- [ ] Couleur choisie selon mood/secteur ; palette extraite de l'identité, distincte des concurrents.
