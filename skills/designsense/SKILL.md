---
name: designsense
description: >-
  À utiliser DÈS qu'on conçoit, génère, code ou relit une interface web/app —
  page, landing, dashboard/SaaS, portfolio, écran, composant. Fournit un WORKFLOW
  pas-à-pas + des standards UI/UX (pondérés par fréquence, tracés aux sources)
  pour produire des interfaces soignées et NON génériques, sans jamais présumer
  la direction artistique du projet.
---

# designsense — workflow + standards UI/UX

> Le sens du design qui manque à ton agent. **Suis le WORKFLOW ci-dessous à chaque tâche UI** ;
> les fichiers `standards/` sont ta base de règles. But : qu'un utilisateur — expert Claude ou non —
> obtienne des pages propres et quali sans avoir à tout cadrer lui-même.

> **Si un autre skill orchestre déjà ton pipeline front** (ex : un flux Figma → code dédié) : ce skill-ci fournit alors **les standards à charger**, pas une recette concurrente. Le workflow ci-dessous reste la référence pour toute UI hors pipeline dédié.

## Workflow (obligatoire à chaque UI)

### 1. Cadrer
Déterminer : **type** (landing · site vitrine · dashboard/SaaS · portfolio · app mobile · écran · composant),
**objectif**, **audience**, **ton**. Si l'utilisateur n'a pas précisé, poser 1-2 questions courtes.

### 2. Verrouiller la DA — NE JAMAIS la présumer
- Le projet fournit déjà une charte / des tokens / un `DESIGN.md` / des réfs → **l'utiliser tel quel**.
- **Si AUCUNE DA n'est définie : NE PAS inventer un défaut générique.** Au choix :
  - (a) **demander** à l'utilisateur : palette, typo, ambiance, 1-2 sites de référence ;
  - (b) **proposer 2-3 directions distinctes** (mood + palette + typo) à valider, éventuellement
    dérivées d'un `DESIGN.md` de [getdesign.md](https://getdesign.md) proche de la cible.
- **Faire valider la DA AVANT de coder**, puis la geler. Tout ce qui touche couleur/typo/mood en découle.

### 3. Charger les standards pertinents
Toujours charger `personnalite-anti-generique` + `erreurs-frequentes-red-flags`. Puis selon la tâche :

| Tâche | `standards/` à charger en plus |
|---|---|
| Landing / site vitrine | landing-sites-vitrine · layout · hierarchie-visuelle-typographie · motion · couleur |
| Dashboard / SaaS / outil | layout · navigation · composants · formulaires · couleur · hierarchie-visuelle-typographie |
| Portfolio | portfolios · layout · motion · imagerie |
| App mobile / responsive | apps-mobile-responsive · navigation · composants · motion |
| Logo / branding | logo-branding-identite |
| Composant isolé | composants · motion · (+ le thème concerné) |

### 4. Construire — selon la cible
designsense est tool-agnostic : il fournit les règles, l'agent construit avec ses outils (outil de maquette OU code).
- **Vers un outil de maquette (Figma, Pencil, etc.)** : appliquer les règles **visuelles** (layout, typo, couleur, composants, hiérarchie, imagerie). ⚠️ **Une maquette est statique → elle ne porte PAS le motion** (hover, scroll, transitions, entrées). **Annoter les intentions de motion** en notes/specs pour ne pas les perdre.
- **Vers du code directement** (pas d'outil de maquette) : appliquer **tout, motion compris**.
- Couleur/typo/mood = **la DA du projet** (étape 2), jamais un défaut. Respecter les **✗**. En conflit règle ↔ brief, **le brief gagne**.

### 5. Maquette validée → code : RÉ-INJECTER le motion
Si on est passé par une maquette : une fois validée et convertie en vraie page, **implémenter les animations annotées à l'étape 4** — elles n'existaient pas dans le statique. Appliquer `motion-micro-interactions` (valeurs jakub + recettes transitions.dev). Une page pixel-perfect mais **figée perd le premium** : le motion est une part majeure de la qualité perçue.

### 6. Auto-review AVANT de livrer
Repasser les **« Checklist build »** + **« Anti-patterns »** des fichiers chargés ; lister les écarts et corriger.
Test final : *« ça pourrait être primé, ou ça sent l'IA / le template ? »* — corriger, PUIS présenter.

## Règles de lecture
- **Pondération** : ⭐ = 3+ sources (applique sans hésiter) · ◐ = 2 · ○ = 1 (à pondérer) · ⚠ = débat (la note tranche).
- **Agnostique de charte** : aucune palette/typo imposée par les standards — voir étape 2.
- **Principes opinionnés, pas une loi** : distillés de créateurs nommés (surtout Basti). ⭐ = « souvent
  affirmé par les sources », **pas** « consensus du marché ». Bon défaut à confronter au contexte ; le brief prime.

## Les 15 thèmes (`standards/`)
| Fichier | Thème |
|---|---|
| `personnalite-anti-generique` | **Le cœur** : sortir du générique, premium vs cheap |
| `erreurs-frequentes-red-flags` | Anti-patterns transverses |
| `layout-grille-espacement` | Layout, grille, espacement |
| `hierarchie-visuelle-typographie` | Hiérarchie & typographie |
| `couleur-contraste` | Couleur & contraste |
| `composants-boutons-cta` | Composants, boutons, CTA |
| `navigation-menus` | Navigation & menus |
| `formulaires-inputs` | Formulaires & inputs |
| `motion-micro-interactions` | Motion & micro-interactions |
| `images-icones-illustration` | Images, icônes, illustration |
| `landing-sites-vitrine` | Landing & sites vitrine |
| `portfolios` | Portfolios |
| `apps-mobile-responsive` | Apps & mobile / responsive |
| `logo-branding-identite` | Logo, branding, identité |
| `contenu-copy-ux` | Contenu & copy UX |

## Sources
Distillé et pondéré par fréquence depuis : **Basti** (@BastiUi), **jakub.kr** (make-interfaces-feel-better),
**transitions.dev**, **getdesign.md**, et des praticiens de Design Engineering. Chaque règle est tracée (`src: …`).
