---
name: bsh-protokoll
description: Form- und Aufbauregeln der BSH-Protokolle, die LaTeX-Konventionen dieses Projekts und der Bau auf Heim- und Laborrechner - Deckblatt, Verzeichnisse, Aufgabenblöcke, Screenshots, Quellenblöcke, Abgabeformat. TRIGGER bei jeder Bearbeitung einer Datei unter protokolle/ oder vorlage/, bei jedem Bau, beim Einrichten eines Rechners, beim Anlegen eines neuen Protokolls, und vor jeder Abgabe. SKIP sonst.
user-invocable: true
---

# Protokollform

Die Form wird eigens beurteilt; Punkte für gebrochene Form sind nicht zurückzuholen.

## Vorgaben der Angabe

Abgabe als PDF. Alles aus der Angabe ist enthalten: Deckblatt, Inhaltsverzeichnis, Beschreibung, jede Aufgabe, auch triviale. Deckblatt: Klasse 3AHIT, Schuljahr 2026/2027, Adam Ferenc Palotai, HTBLA Traun, Prof. Gaisberger. Mindestens Quellen- und Abbildungsverzeichnis. Die Felder "GPT Weitere Fragen" entfallen ab diesem Schuljahr und werden nicht angelegt.

Keine Formelemente eines Fachartikels: kein Abstract, kein Related Work, keine gesammelte Bibliographie anstelle des Quellenblocks je Aufgabe. Das Niveau kommt aus belegten Messungen nach `bsh-messung`.

## KI-Kennzeichnung

Die Angabe verlangt sie bei jeder einzelnen Antwort, auch bei umgeschriebenem Text; keine Sammelangabe. Umsetzung: `\kiquelle[20.\,09.\,2026]{Opus 5.5}` nach dem `\end{itemize}` des Quellenblocks. Das Datum nennt den Stand der Textfassung, nicht den Bautag.

Claude ist keine Quelle. Die Zeile nennt die Herkunft der Textfassung, der Quellenblock die der Information; eine unbelegte Aussage wird nie der KI zugeschrieben.

## Formkriterien der Beurteilung

Einrückungen durchgängig. Höchstens drei Textgrößen im Fließtext, Überschriften ausgenommen; die Klasse hält das ein, also kein manuelles `\large`, `\small`, `\tiny`. Rahmungen und Ausrichtungen ungebrochen, Farben nur aus der Klasse: `akzent`, `htlgruen`, `rahmengrau`, `fuellgrau`.

Screenshots mit `\bild[Kurzfassung]{Dateiname}{Breite}{Beschriftung}`, Breite als Anteil der Textbreite, nie Höhe und Breite zugleich; das Label ist `abb:Dateiname`. Auf die belegende Stelle zugeschnitten, beim Text platziert, den sie belegen. Dateiname sprechend mit Kapitelbezug: `05-nat-ipconfig-guest.png`.

Befehle und Code in Monospace, ergänzend zum Screenshot, der sie belegt, nicht ersetzt. Inline `\cmd{ipconfig /all}`, mehrzeilig `lstlisting`, lange Dateinamen und Pfade, die umbrechen müssen, mit `\nolinkurl`.

Fachbegriffe bei Erstnennung mit Definition und Literaturverweis; die Beurteilung verlangt beides. Der Verweis steht im Quellenblock der Aufgabe, in der der Begriff zuerst fällt, und darf die Primärquelle der Sachaussage sein.

## Abbildungen

Zugelassen sind der Screenshot als Beleg einer eigenen Messung und das Schema, das eine räumliche oder zeitliche Beziehung zeigt, die Fließtext nur umständlich wiedergibt. Die Bildunterschrift begründet die Wahl, damit sie bei der mündlichen Besprechung ablesbar ist. Je Sachverhalt ein Screenshot. Schemata in TikZ mit den Formen der Klasse.

## LaTeX-Konventionen

Ein Protokoll ist ein Verzeichnis unter `protokolle/` mit `protokoll.tex`, `kapitel/` und `bilder/`. Kapitel 1 bis 10 folgen der Nummerierung der Angabe. Anhänge: `kapitel/97-glossar.tex` als Anhang A, `98-abkuerzungen.tex` als Anhang B, `99-quellen.tex` als unnummeriertes Quellenverzeichnis; alle drei wachsen mit jeder Aufgabe mit.

`vorlage/bsh-protokoll.cls` gilt für alle sechs Protokolle. Nach jeder Änderung eine betroffene Seite mit `pdftocairo -png` rendern und ansehen; ein fehlerfreier Bau beweist keine korrekte Darstellung. LaTeX-Quelltext nie durch `python -c` oder `sed` schleusen, `\r` und `\f` werden dort zu Steuerzeichen. In einer `tcolorbox` braucht `parskip` die Option `parbox=false`.

Glossar: Begriff halbfett, Kurzdefinition ohne Artikel, Rückverweis auf die Aufgabe, die den Begriff erklärt, sonst auf die Erstnennung. Die Sprungmarke steht direkt nach `\end{aufgabe}`. Abkürzungsverzeichnis: nur was im Fließtext ausgeschrieben und belegt ist, ein Satz je Eintrag, Auflösung und Apposition.

Aufgaben der Angabe stehen wörtlich in einer `aufgabe`-Umgebung, samt Zugangsdaten, mit der Fragestellung als optionalem Titel. Angabentext ohne eigene Frage, etwa eine Kapiteleinleitung, steht in einer `aufgabe` ohne Titel. Überschriften der Angabe werden Abschnitte; ein erfundener Titel, als Substantivgruppe, nur wo die Angabe keine Überschrift hat.

## Quellenblock

Folgt jeder beantworteten Aufgabe. Jedes Dokument steht darin genau einmal: mehrere Kapitel des Handbuchs als Unterpunkte eines Eintrags, mehrere Abschnitte eines Kapitels in einer Zeile. Form `Urheber: Titel, Fundstelle: Zitat. URL`, selbständige Werke in `\emph`, Seiten und Aufsätze in `\enquote`, Abschnitte ohne Nummer mit Titel und ohne übergeordneten Abschnitt. Ein Zitat nur, wo der Wortlaut die Aussage trägt: Definition, Zahl, Einschränkung, Auflösung einer Abkürzung, Zuschreibung. Reihenfolge: Primärdokumentation, Normen, Fachliteratur, Herstellermitteilungen, Angabe, eigene Feststellung; das Handbuch nach Kapitelnummer, sonst alphabetisch. Die volle bibliographische Angabe steht nur im Quellenverzeichnis. `[quellen]` hält die KI-Kennzeichnung beim Listenende.

Nach jeder Änderung am Aufgabentext werden Block und Verzeichnisse gegen den Text abgeglichen: Eine Quelle, ein Zitat oder ein Eintrag, der keinen Satz mehr trägt, fällt weg.

```latex
\paragraph{Quellen}
\begin{itemize}[quellen]
  \item Oracle: \emph{Oracle VirtualBox User Guide for Release 7.2}
  \begin{itemize}[nosep]
    \item Kap. 5 \enquote{Working with Virtual Machines}, Abschn. \enquote{Snapshots}. \url{https://docs.oracle.com/en/virtualization/virtualbox/7.2/user/working-with-vms.html}
    \item Kap. 9 \enquote{Virtual Networking}, Abschn. \enquote{Host-Only Networking}, Tabelle 9-1. \url{https://docs.oracle.com/en/virtualization/virtualbox/7.2/user/networkingdetails.html}
  \end{itemize}
  \item Eigene Messung, Abschnitt~\ref{mess:nat-ping}.
\end{itemize}
\kiquelle[20.\,09.\,2026]{Opus 5.5}
```

## Bauen

Aus dem Protokollverzeichnis `latexmk -pdf protokoll.tex`; `.latexmkrc` setzt den Suchpfad zur Vorlage. LaTeX Workshop baut beim Speichern nach `.vscode/settings.json`.

**Heimrechner, Windows mit MiKTeX.** In der Tool-Shell fehlen MiKTeX und Perl im `PATH`; das Perl aus Git genügt. Fehlende Pakete lädt MiKTeX selbst nach.

```
$env:PATH += ";C:\Users\Adam\AppData\Local\Programs\MiKTeX\miktex\bin\x64;C:\Program Files\Git\usr\bin"
latexmk -pdf -interaction=nonstopmode protokoll.tex
```

**Laborrechner, Linux Mint ohne Root.** Das Home-Verzeichnis liegt auf der lokalen Platte, an jedem anderen Platz beginnt die Einrichtung von vorn, rund 15 Minuten. TeX Live als Benutzerinstallation unter `~/texlive/<Jahr>`, Schema `scheme-small` plus `latexmk`, `collection-latexextra` und `collection-fontsrecommended`; der `PATH`-Eintrag in `~/.profile` wirkt nach der nächsten Anmeldung. Fehlende Pakete mit `tlmgr install <paket>`. Editor VSCodium mit LaTeX Workshop. `user.name` und `user.email` repo-lokal wie in den bisherigen Commits.

## Prüfen

Nach jeder Aufgabe `sh ../../vorlage/pruefen.sh` im Protokollverzeichnis. Es meldet doppelte URLs im Block, fehlende `\kiquelle`, verbotene Begriffe und Einheiten ohne Schmalraum; jede Meldung wird angesehen.

Vor der Abgabe zusätzlich, in dieser Reihenfolge: keine `% TODO` und keine `% BELEG FEHLT` übrig, Bau ohne Warnung, Inhalts- und Abbildungsverzeichnis aktuell, Deckblatt vollständig, PDF öffnet, Seitenzahl plausibel.
