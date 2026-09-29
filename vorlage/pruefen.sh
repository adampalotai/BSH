#!/bin/sh
# Regelprüfung eines Protokolls: sh ../../vorlage/pruefen.sh [Verzeichnis]
# Meldet Kandidaten, die Entscheidung bleibt beim Lesenden.
cd "${1:-.}" || exit 1
for f in kapitel/*.tex; do
  awk -v f="$f" '
    /\\begin\{aufgabe\}/ {skip=1}
    skip {if (/\\end\{aufgabe\}/) skip=0; next}
    # Rohdaten bleiben wörtlich
    /\\begin\{lstlisting\}/ {lst=1}
    lst {if (/\\end\{lstlisting\}/) lst=0; next}
    /^[ ]*%/ {next}
    /\\paragraph\{Quellen\}/ {q=1; delete u; ki=0; n=NR}
    q && /\\begin\{itemize\}\[nosep\]/ && !/^ / {print f":"NR": Quellenblock ohne [quellen]"}
    q && match($0, /\\url\{[^}]*\}/) {
      s=substr($0, RSTART, RLENGTH)
      if (s in u) print f":"NR": URL im Block doppelt: "s
      u[s]=1
    }
    q && /\\kiquelle/ {q=0}
    {t=$0; gsub(/\\enquote\{[^}]*\}/, "", t)}
    t ~ /(Host-System|Guest-System|Wirtsystem|Update|Speicherabbild|gemeinsamer Ordner)/ && t !~ /Angabe|genannt/ {print f":"NR": Festlegung: "t}
    t ~ /[0-9] ?(GB|MB|KB|GHz|MHz|Byte)/ && t !~ /\\,/ {print f":"NR": Einheit ohne Schmalraum: "t}
    t ~ /[0-9] %/ {print f":"NR": Prozentzeichen ohne Schmalraum: "t}
    END {if (q) print f": Quellenblock ab Zeile "n" ohne \\kiquelle"}
  ' "$f"
done
grep -n "% TODO\|% BELEG FEHLT" kapitel/*.tex | wc -l | sed 's/^/offene TODO und BELEG FEHLT: /'
