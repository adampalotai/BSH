# BSH-Protokolle, HTBLA Traun

Sechs Laborprotokolle für den Unterrichtsgegenstand Betriebssysteme (BSH) bei Prof. Gaisberger, Schuljahr 2026/2027, Klasse 3AHIT. Verfasser: Adam Ferenc Palotai.

## Warum das Projekt so ernst genommen wird

Jedes Protokoll ist Voraussetzung für die zugehörige praktische Leistungsfeststellung; ohne bestandene Theorieprüfung kein Antreten zur praktischen. Alle grundlegenden theoretischen und praktischen Leistungsfeststellungen müssen positiv sein, sonst ist die Lehrveranstaltung negativ. Adam nutzt die fertigen Protokolle in der praktischen Prüfung direkt als Unterlage und zur Vorbereitung.

Das heißt: Der Text muss inhaltlich richtig, formal einwandfrei und gleichzeitig für Adam lernbar sein. Siehe `bsh-schreibstil`.

## Rolle der KI

Die Nutzung von Claude wird im Protokoll vermerkt, Opus 5 und Sonnet 5. Claude schreibt die Texte, Adam verantwortet und versteht sie.

Arbeitsteilung der Modelle: Opus 5 für Konzeption, Kapitelaufbau, Argumentationsführung und Ausformulierung der Fließtexte, Effort hoch. Sonnet 5 für Mechanisches, also LaTeX-Fehler, Screenshot-Einbindung, Verzeichnisdurchsicht, Rechtschreibung, Effort mittel. Bei jedem Kapitel wird festgehalten, welches Modell den Text erzeugt hat.

"Quelle: Claude" kommt nie ins Protokoll. Belege stammen aus Primärquellen nach `bsh-research`.

## Aufbau

```
vorlage/bsh-protokoll.cls      Dokumentklasse, von allen sechs Protokollen geteilt
protokolle/01-virtualisierung/ Protokoll 1
  protokoll.tex                Hauptdatei
  kapitel/*.tex                Kapitel einzeln
  bilder/                      Screenshots
protokolle/02 … 06/            weitere Protokolle, gleiche Struktur
angabe/                        Angabendokumente von Moodle
material/                      Recherchematerial, Handbuchauszüge
```

## Bauen

Aus dem jeweiligen Protokollverzeichnis:

```
latexmk -pdf protokoll.tex
```

`.latexmkrc` im Projektwurzelverzeichnis setzt den Suchpfad zur Vorlage. In VSCode baut LaTeX Workshop beim Speichern, Konfiguration in `.vscode/settings.json`.

MiKTeX 25.12 liegt unter `C:\Users\Adam\AppData\Local\Programs\MiKTeX\miktex\bin\x64` und ist im Benutzer-PATH. Fehlende Pakete installiert MiKTeX selbständig nach.

## Umgebung

Laborzugang mit VirtualBox und den vorbereiteten VMs, Windows Server 2019 und Linux Mint, besteht in der Schule. Zu Hause steht VMware mit einer eingerichteten VM zur Verfügung, aus einem anderen Projekt. Praktische Versuche, die VirtualBox-spezifisch sind, gehören ins Labor; allgemeine Netzwerk- und Protokollversuche lassen sich zu Hause vorbereiten.

## Offene Punkte

Abgabetermine stehen noch nicht fest, der Stundenplan war zu Schuljahresbeginn noch nicht fix. Die Themen der Protokolle 2 bis 6 sind noch nicht bekannt.

Adam hat Kontakt zu Andreas Kohlbauer, der die dritte Klasse im Vorjahr mit Note 3 bei Gaisberger abgeschlossen hat. Erfragt werden sollen: Ablauf der praktischen Leistungsfeststellung, Einsicht in ein Vorjahresprotokoll zur Kalibrierung des Niveaus, tatsächlich vergebene Punkteabzüge, Themen mit erfahrungsgemäßem Nachbohren bei der Theorieprüfung, die sechs Themen des Vorjahres samt Reihenfolge, und die Rolle des freiwilligen erweiterten Protokolls.

## Skills

`bsh-research` Quellenpolitik und Belegpflicht. `bsh-protokoll` Formvorgaben und LaTeX-Konventionen. `bsh-messung` Versuchsdokumentation. `bsh-schreibstil` Stil der Protokolltexte. `bsh-committing` Commit-Konvention.
