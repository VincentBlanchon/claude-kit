#!/usr/bin/env bash
# PreCompact — au moment ou le contexte va etre compresse, injecte la
# directive de compaction pour que l'etat de travail survive TOUJOURS.
# (Un compact sans direction perd systematiquement quelque chose d'important :
# c'etait la cause des reprises de session laborieuses.)

cat >/dev/null

cat <<'MSG'
DIRECTIVE DE COMPACTION (hook precompact-directive) — le resume DOIT preserver, en tete :
1. La tache EN COURS (quoi exactement, ou on en est, prochaine action immediate).
2. Le plan valide et l'etape courante (les etapes finies en une ligne chacune).
3. Les decisions prises par l utilisateur (verbatim court) et les interdits poses.
4. L'etat verifie : ce qui est PROUVE fait (tests/écran) vs ce qui est juste ecrit.
5. Les chemins de fichiers exacts en cours de modification.
Ne pas resumer ces 5 points en une phrase vague : ils sont la colonne vertebrale de la suite.
MSG
exit 0
