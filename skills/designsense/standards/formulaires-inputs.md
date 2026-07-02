---
theme: Formulaires & inputs
type: ui-ux-standard
audience: agent-llm
sources: basti
rules_count: 14
videos_count: 27
---

# Formulaires & inputs — standards UI/UX

> Règles pour un agent qui construit du front. Agnostique de charte. Appliquer par défaut sauf contrainte projet.

## Règles

- **⭐ R1 — Concevoir tout écran de saisie mobile clavier ouvert.** Le clavier recouvre la moitié basse de l'écran (plus sur iPad) ; formulaire et CTA scrollent/remontent au-dessus, jamais masqués derrière. Pourquoi: un CTA figé sous le clavier rend l'action inaccessible. ✓ Layout scrollable, CTA réancré au focus, testé device clavier sorti · ✗ Bouton « Valider » figé sous le clavier, écran maquetté sans clavier. (src: E1McbVSPhUI, u5npy8xAIlY, onnSWR-7wBM, etc.)

- **⭐ R2 — Montrer la valeur AVANT d'exiger un compte ; jamais ouvrir sur un mur de connexion.** Laisser explorer/configurer sans compte (prefs en local), déclencher l'inscription seulement à l'étape qui l'exige (paiement, sauvegarde). Pourquoi: un mur d'auth inutile fait désinstaller et concentre des données sensibles (honeypot). ✓ Entrée directe, login différé · ✗ Premier écran = création de compte, login obligatoire pour un usage qui n'en a pas besoin. (src: QGTJGt2PPK8, 1JPnZuqLqqk, d3iBwFGNFMw)

- **⭐ R3 — États focus / valide / erreur distinguables d'un coup d'œil ; un état actif ne repose jamais sur la seule couleur.** Renforcer par bordure, fond, icône ou case ; réserver la couleur à un signal secondaire (daltonisme) ; feedback temps réel à l'instant du changement. ✓ Focus/succès/erreur signalés par un changement net ; état actif = couleur + fond + encadré · ✗ Champ identique vide/focus/valide/erreur ; statut par rouge contre vert seul. (src: E1McbVSPhUI, z4MaPOCNaXU, maehHcHeVVw)

- **◐ R4 — Bouton de soumission = verbe d'action explicite et contextuel, jamais générique ni « Suivant ».** Le libellé décrit ce que l'utilisateur accomplit ; ne pas mélanger connexion et création dans un écran ambigu. Pourquoi: « Envoyer »/« Valider »/« OK » ne disent pas ce qui va se passer. ✓ « Se connecter », « Réserver », « Supprimer la vidéo » · ✗ « Submit », « Envoyer », « Valider », « Suivant ». (src: iIX8QZO074o, xl1QDX_u7W0)

- **◐ R5 — Adapter le type de contrôle et le clavier à la donnée.** Clavier numérique pour code/PIN, date-picker pour une date, slider pour une plage, liste recherchable quand les choix sont nombreux/ouverts ; bonne locale de clavier. Pourquoi: le bon input réduit effort et erreurs. ✓ Numérique pour les chiffres, date-picker, liste+recherche · ✗ Clavier texte pour un code, 4 ronds là où il faut une infinité d'options. (src: hUTjEe3F9IA, KuQVqSulCeM)

- **◐ R6 — Une seule convention d'input sur tout le produit : souligné OU contour, jamais les deux.** Label respectant le pattern (espacé ou coupant la bordure), jamais collé au bord ; champ de l'action principale en contraste fort et pré-sélectionné ; placeholder gris réservé aux champs secondaires. Pourquoi: cumuler trait + contour, ou griser le champ principal, le fait passer inaperçu. ✓ Convention unique, champ principal contrasté · ✗ Trait + contour sur le même champ, champ d'action principale grisé. (src: maehHcHeVVw, 03odlgh212A)

- **◐ R7 — Découper l'onboarding/formulaire long étape par étape (une info à la fois) avec « passer » sur l'optionnel, et suggérer des valeurs plutôt que d'imposer.** Pré-remplir/inférer le récurrent (défauts intelligents), rendre optionnel ce qui peut l'être. Pourquoi: une étape forcée sans échappatoire fait perdre des utilisateurs ; un champ libre là où des classiques existent ralentit. ✓ Séquence courte, bouton passer, suggestions pré-remplies · ✗ Tout demander d'un coup, étape sans « passer », forcer un champ inférable. (src: 1JPnZuqLqqk, KuQVqSulCeM, onnSWR-7wBM)

- **◐ R8 — Confirmer toute action irréversible par un récap modal, pas par une mention « non modifiable ».** Le popup récapitule les valeurs et demande une confirmation explicite ; feedback de sauvegarde tout aussi clair sur les éditeurs longs. Pourquoi: un petit texte d'avertissement est faible ; une croix qui quitte sans confirmer laisse dans le doute. ✓ « Validez-vous ? » + récap, message « Modifications enregistrées » · ✗ Mention « non modifiable » sous le champ ; sortie par croix ambiguë. (src: onnSWR-7wBM, tXVaiSLSbho)

- **◐ R9 — Modale : deux actions côte à côte en bas, placement constant ; scrim de fond sombre (noir, pas gris) ; popup ancrée avec intention.** Pourquoi: des boutons empilés à des emplacements changeants cassent l'attente ; un overlay gris ne dissocie pas les plans ; un panneau centré par défaut devrait souvent s'ancrer à son déclencheur. ✓ Boutons alignés en bas partout pareil, scrim noir opaque, popup ancrée · ✗ Boutons empilés variant d'un écran à l'autre, overlay gris, centrage par défaut. (src: y1FaqXCaWGc, Ff-hHf15kv4)

- **○ R10 — Libellés toujours en positif, jamais en double négation ; cases optionnelles décochées par défaut.** Un label exprime ce que l'utilisateur OBTIENT, pas ce qu'il refuse. Pourquoi: « si vous ne souhaitez pas… cochez » force une résolution inversée (dark pattern) ; une case opt-out pré-cochée est perçue comme manipulatrice. ✓ « Je souhaite recevoir les offres », décochée par défaut · ✗ « Ne pas recevoir », case optionnelle pré-cochée. (src: mriVisAMSXQ)

- **○ R11 — Marquer uniquement les champs minoritaires, jamais la règle.** Majorité obligatoire ⇒ n'annoter QUE les optionnels (« optionnel ») ; majorité optionnelle ⇒ n'annoter QUE les obligatoires (`*`). Pourquoi: répéter un astérisque sur 8 champs sur 10 crée du bruit et un look cheap. ✓ Tout obligatoire ⇒ pas d'astérisques + sous-titre global · ✗ Un `*` sur chaque champ d'un formulaire quasi tout obligatoire. (src: iIX8QZO074o)

- **○ R12 — Saisir une liste via UI à tags (chip + croix) ; traiter l'autocomplétion comme une recherche.** Taper + Entrée ⇒ chip supprimable ; champ aligné à gauche, vidé après chaque validation, pas de chevron de select. Pourquoi: un textarea où l'on sépare par virgules est austère ; un champ centré à chevron perturbe pour des entrées successives. ✓ Champ à tags, autocomplétion alignée gauche reset après ajout · ✗ Textarea brut à formater à la main, texte centré + chevron conservé. (src: uGWbZ2FJQ5A, y1FaqXCaWGc)

- **○ R13 — Désambiguïser la touche Entrée : jamais d'action destructrice ni de soumission globale sans signal.** Dans un champ d'ajout, Entrée ajoute l'élément ; séparer clairement « Ajouter » de « Générer/Soumettre ». Pourquoi: si Entrée soumet tout au lieu d'ajouter l'item, l'utilisateur perd son travail (et ses crédits) par surprise. ✓ Entrée = ajout, actions distinctes · ✗ Entrée d'un sous-champ liée silencieusement à la soumission principale. (src: CHboIoYXU5A)

- **○ R14 — Séparer consultation (read-only) et édition ; offrir un mode rapide pour les tâches fréquentes.** Fiche en lecture par défaut, bouton « Modifier » bascule en formulaire (Enregistrer/Annuler) ; pour une action répétée, un flux express en plus du flux complet. Pourquoi: éditer en permanence depuis la consultation est risqué ; imposer le tunnel complet à chaque opération courante lasse. ✓ Lecture par défaut + Modifier, flux express en complément · ✗ Champs éditables en permanence, tunnel complet obligatoire. (src: FoYc4XB110o)

## Anti-patterns

- ✗ Écran de saisie mobile maquetté sans clavier → CTA caché derrière le clavier.
- ✗ Mur de connexion en premier écran ou login obligatoire pour un usage qui n'en a pas besoin.
- ✗ État (focus, validation, statut) signalé par la seule couleur ou une nuance plein/vide subtile.
- ✗ Bouton générique « Valider »/« Envoyer »/« OK »/« Suivant » qui masque l'action réelle.
- ✗ Cumuler trait + contour sur un champ, ou mélanger les conventions d'input.
- ✗ Étape d'onboarding forcée sans « passer », ou champ libre là où l'app pourrait inférer un défaut.
- ✗ Action irréversible confirmée par une mention « non modifiable » au lieu d'un récap modal.
- ✗ Boutons de modale empilés à des emplacements changeants ; overlay gris peu contrasté.
- ✗ Libellés/cases en double négation ; case optionnelle pré-cochée (opt-out déguisé).
- ✗ Astérisques systématiques sur un formulaire majoritairement obligatoire.
- ✗ Touche Entrée liée silencieusement à la soumission globale ou à une action destructrice.
- ✗ Champs éditables en permanence sur une fiche de consultation ; textarea brut pour saisir une liste.

## Checklist build

- [ ] Saisie mobile pensée clavier ouvert : formulaire scrollable, CTA au-dessus du clavier, testé device (iPad inclus).
- [ ] Pas de mur de login : valeur visible avant le compte, inscription différée.
- [ ] États focus / valide / erreur distincts ; état actif renforcé au-delà de la couleur.
- [ ] Bouton de soumission = verbe d'action explicite, jamais « Suivant »/« Valider »/« OK ».
- [ ] Type de contrôle et clavier adaptés à la donnée ; une seule convention d'input (souligné OU contour).
- [ ] Onboarding long découpé en étapes avec « passer » sur l'optionnel ; défauts intelligents suggérés.
- [ ] Action irréversible confirmée par récap modal ; modale = deux boutons côte à côte en bas, scrim sombre.
- [ ] Aucune double négation ; cases optionnelles décochées ; seuls les champs minoritaires annotés.
- [ ] Touche Entrée non destructrice et non liée silencieusement à la soumission ; liste en tags.
- [ ] Fiche en lecture par défaut + bouton Modifier ; champs groupés à portée du pouce.
