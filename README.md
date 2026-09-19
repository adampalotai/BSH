# BSH-Laborprotokolle

Laborprotokolle für den Unterrichtsgegenstand Betriebssysteme, HTBLA Traun, Klasse 3AHIT, Schuljahr 2026/2027. Verfasser: Adam Ferenc Palotai. Betreuung: Prof. Gaisberger.

Sechs Protokolle sind zu erarbeiten, zu jedem gehören eine Theorieprüfung und eine praktische Leistungsfeststellung. Dieses Repository enthält den Quelltext der Protokolle, die zugehörigen Angaben und die abgegebenen PDF-Stände.

## Warum LaTeX

Die Angabe gibt eine Word-Vorlage vor, erlaubt aber ausdrücklich andere Programme, solange der Inhalt der ursprünglichen Angabe vollständig enthalten ist. Abgegeben wird ohnehin als PDF.

In einem Dokument dieser Länge bleibt das Inhaltsverzeichnis bei jedem Bau von selbst aktuell, weil es neu erzeugt wird. Die Formatierung liegt zentral in einer Dokumentklasse und nicht in jedem Absatz einzeln, sodass Schriftgrößen, Rahmen und Farben über sechs Protokolle hinweg gleich bleiben. Und weil der Quelltext reiner Text ist, lässt er sich mit Git versionieren, wodurch jeder Abgabestand nachvollziehbar bleibt.

## Aufbau

```
vorlage/bsh-protokoll.cls        Dokumentklasse, von allen sechs Protokollen geteilt
protokolle/01-virtualisierung/   Protokoll 1
  protokoll.tex                  Hauptdatei, bindet die Kapitel ein
  kapitel/*.tex                  ein Kapitel je Datei
  bilder/                        Screenshots
angabe/                          Angabendokumente aus Moodle, unverändert
```

Die Kapitelnummerierung folgt der Angabe. Kapitel 10 deckt die gesonderte Erweiterung *Einführung Client-Server* ab.

## Bauen

Aus dem jeweiligen Protokollverzeichnis:

```
latexmk -pdf protokoll.tex
```

Erzeugt `protokoll.pdf`. Mehrere Durchläufe für Inhalts- und Abbildungsverzeichnis erledigt `latexmk` selbst. In VSCode baut die Erweiterung LaTeX Workshop beim Speichern.

Vorausgesetzt wird eine TeX-Distribution mit `latexmk` und Perl. Fehlende Pakete installiert MiKTeX bei Bedarf nach.

## Arbeitsweise

Fachaussagen werden aus Primärquellen belegt: dem VirtualBox-Handbuch mit Kapitelangabe, den einschlägigen RFCs, der Dokumentation der jeweiligen Hersteller. Nennt die Angabe ein Handbuchkapitel, gilt dieses als erwartete Quelle.

Wo die Angabe eine Tabelle mit Ja und Nein verlangt, wird gemessen statt abgeschrieben. Jeder Versuch ist so dokumentiert, dass er sich wiederholen lässt: Aufbau, ausgeführter Befehl, Rohdaten, Beobachtung, Deutung, wobei Erwartung und tatsächliches Ergebnis getrennt festgehalten werden. Weicht das Ergebnis von der Erwartung ab, wird das erklärt statt verschwiegen.

Die Textentwürfe entstehen mit Claude (Opus 5 und Sonnet 5, Anthropic). Das wird bei jeder Antwort im Quellenblock kenntlich gemacht, wie es die Angabe *Rolle der KI* verlangt. Diese Kennzeichnung ersetzt den fachlichen Beleg nicht; Sachaussagen sind zusätzlich aus Primärquellen belegt. Für Inhalt und Verständnis bleibt der Verfasser verantwortlich.
