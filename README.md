# BSH-Laborprotokolle

Laborprotokolle für den Unterrichtsgegenstand Betriebssysteme, HTBLA Traun, Klasse 3AHIT, Schuljahr 2026/2027. Sechs Protokolle, zu jedem gehören eine Theorieprüfung und eine praktische Leistungsfeststellung.

## Warum LaTeX

Die Angabe gibt eine Word-Vorlage vor, erlaubt aber ausdrücklich andere Programme, solange der Inhalt der ursprünglichen Angabe vollständig enthalten ist. Abgegeben wird ohnehin als PDF.

In einem Dokument dieser Länge bleibt das Inhaltsverzeichnis bei jedem Bau von selbst aktuell, weil es neu erzeugt wird. Die Formatierung liegt zentral in einer Dokumentklasse und nicht in jedem Absatz einzeln, sodass Schriftgrößen, Rahmen und Farben über sechs Protokolle hinweg gleich bleiben. Und weil der Quelltext reiner Text ist, lässt er sich versionieren, wodurch jeder Abgabestand nachvollziehbar bleibt.

## Aufbau

```
vorlage/bsh-protokoll.cls        Dokumentklasse, von allen sechs Protokollen geteilt
protokolle/01-virtualisierung/   Protokoll 1
  protokoll.tex                  Hauptdatei, bindet die Kapitel ein
  kapitel/01..10                 ein Kapitel je Datei, Nummerierung nach der Angabe
  kapitel/97,98,99               Glossar, Abkürzungsverzeichnis, Quellenverzeichnis
  bilder/                        Screenshots
```

Kapitel 10 deckt die gesonderte Erweiterung *Einführung Client-Server* ab.

Nicht im Repository liegen die Angabendokumente der Schule und die internen Arbeitsunterlagen; beide sind in `.gitignore` ausgenommen.

## Bauen

Aus dem jeweiligen Protokollverzeichnis:

```
latexmk -pdf protokoll.tex
```

Erzeugt `protokoll.pdf`. Mehrere Durchläufe für Inhalts- und Abbildungsverzeichnis erledigt `latexmk` selbst. In VSCode baut die Erweiterung LaTeX Workshop beim Speichern. Vorausgesetzt wird eine TeX-Distribution mit `latexmk` und Perl; fehlende Pakete installiert MiKTeX bei Bedarf nach.

## Arbeitsweise

Fachaussagen werden aus Primärquellen belegt, jede mit vollständigem Link. Wo die Angabe eine Tabelle mit Ja und Nein verlangt, wird gemessen statt abgeschrieben, und jeder Versuch ist so dokumentiert, dass er sich wiederholen lässt. Weicht ein Ergebnis von der Erwartung ab, wird das erklärt statt verschwiegen.

Die Textentwürfe entstehen mit Claude (Opus 5 und Sonnet 5, Anthropic). Das ist bei jeder Antwort im Quellenblock gekennzeichnet, wie es die Angabe *Rolle der KI* verlangt. Die Kennzeichnung ersetzt den fachlichen Beleg nicht; für Inhalt und Verständnis bleibt der Verfasser verantwortlich.

Die ausführlichen Regeln liegen als Skills unter `.claude/skills/`.
