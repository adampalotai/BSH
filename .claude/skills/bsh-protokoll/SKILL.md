---
name: bsh-protokoll
description: Form- und Aufbauregeln der BSH-Protokolle, die LaTeX-Konventionen dieses Projekts und der Bau auf Heim- und Laborrechner - Deckblatt, Verzeichnisse, Aufgabenblöcke, Screenshots, Quellenblöcke, Abgabeformat. TRIGGER bei jeder Bearbeitung einer Datei unter protokolle/ oder vorlage/, bei jedem Bau, beim Einrichten eines Rechners, beim Anlegen eines neuen Protokolls, und vor jeder Abgabe. SKIP sonst.
user-invocable: true
---

# Protokollform

Die Form wird eigens beurteilt. Ein inhaltlich richtiges Protokoll mit gebrochener Form verliert Punkte, die nicht zurückzuholen sind.

## Harte Vorgaben der Angabe

Abgabeformat ist PDF.

Alles aus der ursprünglichen Angabe muss enthalten sein: Deckblatt, Inhaltsverzeichnis, Beschreibung, alle Aufgaben. Keine Aufgabe wird weggelassen, auch keine, die trivial erscheint.

Deckblattfelder vollständig: Klasse 3AHIT, Schuljahr 2026/2027, Adam Ferenc Palotai, HTBLA Traun, Prof. Gaisberger.

Inhaltsverzeichnis beim Abgabestand aktuell, dafür sorgt `latexmk` mit mehreren Durchläufen.

Mindestens Quellen- und Abbildungsverzeichnis.

Die Felder "GPT Weitere Fragen" entfallen ab diesem Schuljahr und werden nicht angelegt.

Keine Formelemente eines Fachartikels: kein Abstract, kein Related Work, keine gesammelte Bibliographie anstelle des Quellenblocks je Aufgabe. Das Niveau kommt aus belegten Messungen nach `bsh-messung`.

## KI-Kennzeichnung

Die Angabe verlangt bei jeder einzelnen Antwort den Hinweis, dass sie mit KI erstellt wurde, ausdrücklich auch bei umgeschriebenem Text. Keine Sammelangabe am Dokumentende.

Umsetzung: `\kiquelle[20.\,09.\,2026]{Opus 5.5}` nach dem `\end{itemize}` des Quellenblocks. Das Datum verlangt das Beispielformat der Angabe; es benennt den Stand der Textfassung, nicht den Tag des Baus.

Claude ist keine Quelle. Die Zeile nennt die Herkunft der Textfassung, der Quellenblock die Herkunft der Information; ein `\item` mit "Claude Opus 5.5" behauptet das Gegenteil. Findet sich für eine Aussage kein Beleg, wird sie gestrichen oder als eigene Ableitung kenntlich gemacht, nie der KI zugeschrieben.

## Formkriterien der Beurteilung

Einrückungen durchgängig und vollständig.

Höchstens drei verschiedene Textgrößen im Fließtext, Überschriften ausgenommen. Die Dokumentklasse hält das ein; keine manuellen `\large`, `\small` oder `\tiny` einstreuen.

Screenshots: mit `\bild{}{}{}` und Breitenangabe eingebunden, nie Höhe und Breite zugleich, damit nichts verzerrt. So klein wie möglich und auf die belegende Stelle zugeschnitten, statt das ganze Fenster zu zeigen, wenn ein Dialogfeld die Aussage trägt. Platziert bei dem Text, den sie belegen. Dateiname sprechend und mit Kapitelbezug: `05-nat-ipconfig-guest.png`, nicht `bild3.png`.

Rahmungen und Ausrichtungen ungebrochen, Farben nur aus der Klasse: `akzent`, `htlgruen`, `rahmengrau`, `fuellgrau`.

CLI-Befehle und Code-Snippets in Monospace, ergänzend zum Bildschirmabgriff. Ein Screenshot einer Konsole ersetzt den Befehl im Text nicht, er belegt ihn. Inline `\cmd{ipconfig /all}`, mehrzeilig `lstlisting`.

Fachbegriffe bei Erstnennung mit Definition und Literaturverweis. Die Beurteilung nennt beides, die Definition allein genügt nicht. Der Verweis geht in den Quellenblock der Aufgabe, in der der Begriff zuerst fällt, und darf dieselbe Primärquelle sein, die die Sachaussage trägt.

## Abbildungen

Zwei Sorten sind zugelassen: der Screenshot als Beleg einer eigenen Messung, und das Schema, das eine räumliche oder zeitliche Beziehung zeigt, die Fließtext nur umständlich wiedergibt. Was unter keine der beiden fällt, kommt nicht hinein.

Die Begründung, warum die Abbildung gewählt wurde, steht in ihrer Unterschrift, damit sie bei der mündlichen Besprechung ablesbar ist. Schemata werden mit TikZ im Quelltext gezeichnet, nicht extern, damit Strichstärke und Farbe über alle Protokolle gleich bleiben.

## LaTeX-Konventionen dieses Projekts

Ein Protokoll ist ein Verzeichnis unter `protokolle/`, mit `protokoll.tex` als Hauptdatei, `kapitel/` für die Kapiteldateien und `bilder/` für Screenshots. Kapitel 1 bis 10 folgen der Nummerierung der Angabe.

Die Dokumentklasse liegt unter `vorlage/bsh-protokoll.cls` und wird von allen sechs Protokollen geteilt. Änderungen daran wirken auf alle. Nach jeder Änderung eine betroffene Seite mit `pdftocairo -png` rendern und ansehen; ein Bau ohne Fehler beweist keine korrekte Darstellung.

LaTeX-Quelltext nie durch `python -c` oder `sed`-Substitution schleusen: `\r` und `\f` werden dort zu Steuerzeichen. Write und Edit verwenden. Absätze in einer `tcolorbox` brauchen `parbox=false`, sonst greift `parskip` in der Box nicht.

Die Anhänge stehen in fester Ordnung: `kapitel/97-glossar.tex` als Anhang A, `kapitel/98-abkuerzungen.tex` als Anhang B, `kapitel/99-quellen.tex` als unnummeriertes Quellenverzeichnis. Beide Anhänge wachsen mit jedem geschriebenen Kapitel mit. Ins Abkürzungsverzeichnis kommt nur, was im Fließtext bei Erstnennung ausgeschrieben und belegt ist.

Das Glossar ist nach Kernighan und Ritchie gebaut: Begriff halbfett, Kurzdefinition darunter, Rückverweis auf das einführende Kapitel. Es ersetzt die Definition im Fließtext nicht, sondern macht sie auffindbar, wenn nicht in Kapitelreihenfolge gelernt wird.

Eine Aufgabe der Angabe wird wörtlich in eine `aufgabe`-Umgebung übernommen, mit der Fragestellung als optionalem Titel. Der Wortlaut wird nicht gekürzt oder umformuliert, weil die Angabe Vollständigkeit verlangt.

Nach jeder beantworteten Aufgabe folgt der Quellenblock:

```latex
\paragraph{Quellen}
\begin{itemize}[nosep]
  \item Oracle VirtualBox: User Guide for Release 7.2, Kap. 9 \enquote{Virtual Networking}, Abschn. \enquote{Host-Only Networking}. \url{https://docs.oracle.com/en/virtualization/virtualbox/7.2/user/networkingdetails.html}
  \item Eigene Messung, Abschnitt~\ref{mess:nat-ping}
\end{itemize}
\kiquelle[20.\,09.\,2026]{Opus 5.5}
```

## Bauen

Aus dem Protokollverzeichnis `latexmk -pdf protokoll.tex`. `.latexmkrc` setzt den Suchpfad zur Vorlage, die nötigen Durchläufe erledigt `latexmk`. LaTeX Workshop baut beim Speichern nach `.vscode/settings.json`, unter Windows wie unter Linux ohne Anpassung.

**Heimrechner, Windows mit MiKTeX.** In der Tool-Shell fehlen MiKTeX und Perl im `PATH`; das Perl aus Git genügt. Fehlende Pakete lädt MiKTeX selbst nach, die Meldung zu ausstehenden Updates blockiert nicht.

```
$env:PATH += ";C:\Users\Adam\AppData\Local\Programs\MiKTeX\miktex\bin\x64;C:\Program Files\Git\usr\bin"
latexmk -pdf -interaction=nonstopmode protokoll.tex
```

**Laborrechner, Linux Mint ohne Root.** Das Home-Verzeichnis liegt auf der lokalen Platte des jeweiligen Rechners, an jedem anderen Platz beginnt die Einrichtung von vorn, rund 15 Minuten. TeX Live als Benutzerinstallation unter `~/texlive/<Jahr>`, Schema `scheme-small` plus `latexmk`, `collection-latexextra` und `collection-fontsrecommended`; der `PATH`-Eintrag in `~/.profile` wirkt nach der nächsten Anmeldung. Fehlende Pakete mit `tlmgr install <paket>`. Editor ist VSCodium mit LaTeX Workshop. `user.name` und `user.email` repo-lokal wie in den bisherigen Commits setzen.

## Vor jeder Abgabe

Prüfe in dieser Reihenfolge: keine `% TODO` übrig, keine `% BELEG FEHLT` übrig, Kompilation ohne Warnung, Inhalts- und Abbildungsverzeichnis aktuell, Deckblattfelder gefüllt, PDF öffnet und Seitenzahl plausibel.
