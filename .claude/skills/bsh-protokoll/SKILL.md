---
name: bsh-protokoll
description: Form- und Aufbauregeln der BSH-Protokolle, die LaTeX-Konventionen dieses Projekts und der Bau auf Heim- und Laborrechner - Deckblatt, Verzeichnisse, Aufgabenblöcke, Screenshots, Quellenblöcke, Abgabeformat. TRIGGER bei jeder Bearbeitung einer Datei unter protokolle/ oder vorlage/, bei jedem Bau, beim Einrichten eines Rechners, beim Anlegen eines neuen Protokolls, und vor jeder Abgabe. SKIP sonst.
user-invocable: true
---

# Protokollform

Die Form wird eigens beurteilt; Punkte für gebrochene Form sind nicht zurückzuholen.

## Vorgaben der Angabe

Abgabe als PDF. Alles aus der Angabe ist enthalten: Deckblatt, Inhaltsverzeichnis, Beschreibung, jede Aufgabe, auch triviale. Mindestens Quellen- und Abbildungsverzeichnis. Die Felder "GPT Weitere Fragen" entfallen ab diesem Schuljahr und werden nicht angelegt. Keine Formelemente eines Fachartikels wie Abstract oder Related Work.

## KI-Kennzeichnung

Die Angabe verlangt sie bei jeder einzelnen Antwort, auch bei umgeschriebenem Text; keine Sammelangabe. Umsetzung: `\kiquelle` am Ende des Quellenblocks wie im Beispiel unten. Das Datum nennt den Stand der Textfassung, nicht den Bautag.

Claude ist keine Quelle. Die Zeile nennt die Herkunft der Textfassung, der Quellenblock die der Information; eine unbelegte Aussage wird nie der KI zugeschrieben.

## Formkriterien der Beurteilung

Einrückungen durchgängig. Höchstens drei Textgrößen im Fließtext, Überschriften ausgenommen; die Klasse hält das ein, also kein manuelles `\large`, `\small`, `\tiny`. Rahmungen und Ausrichtungen ungebrochen, Farben nur aus der Klasse.

Befehle und Code in Monospace, auch wo ein Screenshot sie belegt: inline `\cmd{ipconfig /all}`, mehrzeilig `lstlisting`, umbrechende Dateinamen und Pfade mit `\nolinkurl`.

## Abbildungen

Zugelassen sind der Screenshot als Beleg einer eigenen Messung und das Schema, das eine räumliche oder zeitliche Beziehung zeigt, die Fließtext nur umständlich wiedergibt; Schemata in TikZ mit den Formen der Klasse. Je Sachverhalt ein Screenshot, auf die belegende Stelle zugeschnitten und bei dem Text platziert, den er belegt.

Eingebunden mit `\bild[Kurzfassung]{Dateiname}{Breite}{Beschriftung}`, Label `abb:Dateiname`; der Dateiname ist sprechend und beginnt mit der Kapitelnummer: `05-nat-ipconfig-gast.png`. Die Breite ist so klein, wie der Beleg lesbar bleibt: Terminal- und Dateilisten, deren Werte ein Listing oder eine Tabelle wiedergibt, 0.8; Menüs, Dialoge und kurze Ausgaben 0.4 bis 0.5. Die Bildunterschrift begründet die Wahl des Bildes in einem Satz, damit sie bei der mündlichen Besprechung ablesbar ist.

## LaTeX-Konventionen

Ein Protokoll ist ein Verzeichnis unter `protokolle/` mit `protokoll.tex`, `kapitel/` und `bilder/`. Die Kapitel folgen der Nummerierung der Angabe. Anhänge: `kapitel/97-glossar.tex` als Anhang A, `98-abkuerzungen.tex` als Anhang B, `99-quellen.tex` als unnummeriertes Quellenverzeichnis.

`vorlage/bsh-protokoll.cls` gilt für alle sechs Protokolle. LaTeX-Quelltext nie durch `python -c` oder `sed` schleusen, `\r` und `\f` werden dort zu Steuerzeichen. In einer `tcolorbox` braucht `parskip` die Option `parbox=false`.

Glossar: Kurzdefinition ohne Artikel, Rückverweis auf die Aufgabe, die den Begriff erklärt, sonst auf die Erstnennung. Die Sprungmarke steht direkt nach `\end{aufgabe}`. Abkürzungsverzeichnis: nur was im Fließtext ausgeschrieben und belegt ist, ein Satz je Eintrag, Auflösung und Apposition.

Aufgaben der Angabe stehen wörtlich in einer `aufgabe`-Umgebung, samt Zugangsdaten, mit der Fragestellung als optionalem Titel. Angabentext ohne eigene Frage, etwa eine Kapiteleinleitung, steht in einer `aufgabe` ohne Titel. Überschriften der Angabe werden Abschnitte; ein erfundener Titel, als Substantivgruppe, nur wo die Angabe keine Überschrift hat.

## Quellenblock

Folgt jeder beantworteten Aufgabe. Jedes Dokument steht darin genau einmal: mehrere Kapitel des Handbuchs als Unterpunkte eines Eintrags, mehrere Abschnitte eines Kapitels in einer Zeile. Form `Urheber: Titel, Fundstelle: Zitat. URL`, selbständige Werke in `\emph`, Seiten und Aufsätze in `\enquote`, Abschnitte ohne Nummer mit Titel und ohne übergeordneten Abschnitt. Ein Zitat nur, wo der Wortlaut die Aussage trägt: Definition, Zahl, Einschränkung, Auflösung einer Abkürzung, Zuschreibung. Je getragener Aussage ein Zitat, gekürzt auf die Wörter, die sie tragen; kein Zitat für Aufzählungen, Befehle und Menüpfade, die die Fundstelle schon deckt. Der Eintrag zur eigenen Messung nennt die Versuche der Aufgabe und nur Material, das nicht schon als Rohdaten im Versuch steht, etwa einen OVF-Deskriptor. Reihenfolge: Primärdokumentation, Normen, Fachliteratur, Herstellermitteilungen, Angabe, eigene Feststellung; das Handbuch nach Kapitelnummer, sonst alphabetisch. Die volle bibliographische Angabe steht nur im Quellenverzeichnis.

Ein Fachbegriff braucht bei seiner Erstnennung neben der Definition einen Literaturverweis, die Beurteilung verlangt beides. Der Verweis steht im Quellenblock der Aufgabe, in der der Begriff zuerst fällt, und darf die Primärquelle der Sachaussage sein.

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

Aus dem Protokollverzeichnis `latexmk -pdf protokoll.tex`; `.latexmkrc` setzt den Suchpfad zur Vorlage.

**Heimrechner, Windows mit MiKTeX.** Fehlende Pakete lädt MiKTeX selbst nach. Dort blockiert eine Anwendungssteuerungsrichtlinie `latexmk.exe`, gebaut wird deshalb mit `pdflatex` direkt, zweimal für die Verweise. Aus Git Bash: `TEXINPUTS=".;../../vorlage//;" pdflatex.exe -interaction=nonstopmode -file-line-error -synctex=1 protokoll.tex`.

**Laborrechner, Linux Mint ohne Root.** Das Home-Verzeichnis liegt auf der lokalen Platte, an jedem anderen Platz beginnt die Einrichtung von vorn, rund 15 Minuten. TeX Live als Benutzerinstallation unter `~/texlive/<Jahr>`, Schema `scheme-small` plus `latexmk`, `collection-latexextra` und `collection-fontsrecommended`; der `PATH`-Eintrag in `~/.profile` wirkt nach der nächsten Anmeldung. Fehlende Pakete mit `tlmgr install <paket>`. Editor VSCodium mit LaTeX Workshop, das beim Speichern nach `.vscode/settings.json` baut. `user.name` und `user.email` repo-lokal wie in den bisherigen Commits.

## Prüfen

Nach jeder Aufgabe `sh ../../vorlage/pruefen.sh` im Protokollverzeichnis; jede Meldung wird angesehen. Nach jeder Änderung werden die betroffenen Seiten mit `pdftocairo -png` gerendert und angesehen, denn ein fehlerfreier Bau beweist keine korrekte Darstellung.

Vor der Abgabe zusätzlich: keine `% TODO` und `% BELEG FEHLT` übrig, Bau ohne Warnung, Deckblatt vollständig.
