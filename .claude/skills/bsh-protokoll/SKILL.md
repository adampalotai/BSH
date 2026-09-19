---
name: bsh-protokoll
description: Form- und Aufbauregeln der BSH-Protokolle sowie die LaTeX-Konventionen dieses Projekts — Deckblatt, Verzeichnisse, Aufgabenblöcke, Screenshots, Quellenblöcke, Abgabeformat. TRIGGER bei jeder Bearbeitung einer Datei unter protokolle/, beim Anlegen eines neuen Protokolls, und vor jeder Abgabe. SKIP nur außerhalb des Protokollverzeichnisses.
user-invocable: true
---

# Protokollform

Die Form wird bei Gaisberger eigens beurteilt. Ein inhaltlich richtiges Protokoll mit gebrochener Form verliert Punkte, die nicht zurückzuholen sind.

## Harte Vorgaben der Angabe

Abgabeformat ist PDF. Andere Formate führen zu Punkteabzug.

Alles aus der ursprünglichen Angabe muss enthalten sein: Deckblatt, Inhaltsverzeichnis, Beschreibung, alle Aufgaben. Keine Aufgabe wird weggelassen, auch keine, die trivial erscheint.

Deckblattfelder sind vollständig ausgefüllt. Klasse 3AHIT, Schuljahr 2026/2027, Adam Ferenc Palotai, HTBLA Traun, Prof. Gaisberger.

Inhaltsverzeichnis ist beim Abgabestand aktuell. Bei LaTeX heißt das: mindestens zwei Durchläufe, `latexmk` erledigt das.

Mindestens Quellen- und Abbildungsverzeichnis.

Die Felder "GPT Weitere Fragen" entfallen ab diesem Schuljahr und werden nicht angelegt.

## Formkriterien der Beurteilung

Einrückungen durchgängig und vollständig.

Höchstens drei verschiedene Textgrößen im Fließtext, Überschriften ausgenommen. Die Dokumentklasse hält das ein; keine manuellen `\large`, `\small` oder `\tiny` im Fließtext einstreuen.

Texte in Screenshots lesbar und unverzerrt. Immer `\bild{}{}{}` mit Breitenangabe verwenden, nie Höhe und Breite gleichzeitig setzen.

Screenshots sinnvoll und klar zuordenbar bei dem Text, den sie belegen.

Rahmungen und Ausrichtungen ungebrochen, Gesamtbild einheitlich in der Farbgebung. Farben nur aus der Klasse: `akzent`, `htlgruen`, `rahmengrau`, `fuellgrau`.

CLI-Befehle und Code-Snippets in Monospace, ergänzend zum Bildschirmabgriff im Text. Ein Screenshot einer Konsole ersetzt den Befehl im Text nicht, er belegt ihn. Inline `\cmd{ipconfig /all}`, mehrzeilig `lstlisting`.

Fachbegriffe bei Erstnennung durch Definition und Verweis auf Fachliteratur ergänzt.

## LaTeX-Konventionen dieses Projekts

Ein Protokoll ist ein Verzeichnis unter `protokolle/`, mit `protokoll.tex` als Hauptdatei, `kapitel/` für die Kapiteldateien und `bilder/` für Screenshots.

Die Dokumentklasse liegt zentral unter `vorlage/bsh-protokoll.cls` und wird von allen sechs Protokollen geteilt. Änderungen daran wirken auf alle; das ist beabsichtigt und beim Ändern zu bedenken.

Gebaut wird mit `latexmk -pdf protokoll.tex` aus dem Protokollverzeichnis. `.latexmkrc` setzt den Suchpfad zur Vorlage.

Eine Aufgabe der Angabe wird wörtlich in eine `aufgabe`-Umgebung übernommen, mit der Fragestellung als optionalem Titel. Der Wortlaut wird nicht gekürzt oder umformuliert, weil die Angabe Vollständigkeit verlangt.

Dateinamen für Screenshots sprechend und mit Kapitelbezug: `05-nat-ipconfig-guest.png`, nicht `bild3.png`.

Nach jeder beantworteten Aufgabe folgt der Quellenblock:

```latex
\paragraph{Quellen}
\begin{itemize}[nosep]
  \item Oracle VM VirtualBox: User Manual, Kap. 6.3 \enquote{Network Address Translation}. \url{https://www.virtualbox.org/manual/ch06.html#network_nat}
  \item Eigene Messung, Abschnitt~\ref{mess:nat-ping}
\end{itemize}
```

## Vor jeder Abgabe

Prüfe in dieser Reihenfolge: keine `% TODO` übrig, keine `% BELEG FEHLT` übrig, Kompilation ohne Warnung, Inhaltsverzeichnis und Abbildungsverzeichnis aktuell, Deckblattfelder gefüllt, PDF öffnet und Seitenzahl plausibel.
