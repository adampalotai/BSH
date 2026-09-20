---
name: bsh-protokoll
description: Form- und Aufbauregeln der BSH-Protokolle sowie die LaTeX-Konventionen dieses Projekts - Deckblatt, Verzeichnisse, Aufgabenblöcke, Screenshots, Quellenblöcke, Abgabeformat. TRIGGER bei jeder Bearbeitung einer Datei unter protokolle/, beim Anlegen eines neuen Protokolls, und vor jeder Abgabe. SKIP nur außerhalb des Protokollverzeichnisses.
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

## KI-Kennzeichnung

Die Angabe verlangt bei jeder einzelnen Antwort den Hinweis, dass sie mit KI erstellt wurde, ausdrücklich auch bei umgeschriebenem Text. Keine Sammelangabe am Dokumentende.

Umsetzung: `\kiquelle[20.\,09.\,2026]{Opus 5}` nach dem `\end{itemize}` des Quellenblocks. Das Datum verlangt das Beispielformat der Angabe; es benennt den Stand der Textfassung, nicht den Tag des Baus.

Claude ist keine Quelle. Die Zeile nennt die Herkunft der Textfassung, der Quellenblock die Herkunft der Information; ein `\item` mit "Claude Opus 5" behauptet das Gegenteil. Findet sich für eine Aussage kein Beleg, wird sie gestrichen oder als eigene Ableitung kenntlich gemacht, nie der KI zugeschrieben.

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

Ein Protokoll ist ein Verzeichnis unter `protokolle/`, mit `protokoll.tex` als Hauptdatei, `kapitel/` für die Kapiteldateien und `bilder/` für Screenshots. Gebaut wird mit `latexmk -pdf protokoll.tex` aus dem Protokollverzeichnis; `.latexmkrc` setzt den Suchpfad zur Vorlage.

Die Dokumentklasse liegt unter `vorlage/bsh-protokoll.cls` und wird von allen sechs Protokollen geteilt. Änderungen daran wirken auf alle.

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
\kiquelle[20.\,09.\,2026]{Opus 5}
```

## Vor jeder Abgabe

Prüfe in dieser Reihenfolge: keine `% TODO` übrig, keine `% BELEG FEHLT` übrig, Kompilation ohne Warnung, Inhalts- und Abbildungsverzeichnis aktuell, Deckblattfelder gefüllt, PDF öffnet und Seitenzahl plausibel.
