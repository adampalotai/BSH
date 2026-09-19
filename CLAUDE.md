# BSH-Protokolle, HTBLA Traun

Sechs Laborprotokolle für Betriebssysteme (BSH) bei Prof. Gaisberger, Schuljahr 2026/2027, Klasse 3AHIT. Verfasser: Adam Ferenc Palotai.

Aufbau, Bauanleitung und Arbeitsweise stehen in `README.md`. Der laufende Arbeitsstand, offene Fragen und festgestellte Widersprüche stehen in `intern/ARBEITSSTAND.md`, das nicht versioniert wird.

## Warum das Projekt so ernst genommen wird

Je Protokoll gibt es eine Theorieprüfung und eine praktische Leistungsfeststellung. Alle grundlegenden Leistungsfeststellungen müssen positiv sein, sonst ist die Lehrveranstaltung negativ.

Die Theorieprüfung findet ohne Unterlagen statt. Das Protokoll ist dort Lernmaterial, nicht Hilfsmittel. In der praktischen Leistungsfeststellung dient es als Unterlage.

Daraus folgt die Anforderung an den Text: inhaltlich richtig, formal einwandfrei, und so geschrieben, dass Adam ihn ohne Vorlage wiedergeben kann. Siehe `bsh-schreibstil`.

## Rolle der KI

Claude schreibt die Texte, Adam verantwortet und versteht sie.

Modellwahl: Opus 5 für Konzeption, Kapitelaufbau, Argumentationsführung und Fließtext, Effort hoch. Sonnet 5 für Mechanisches (LaTeX-Fehler, Screenshot-Einbindung, Verzeichnisdurchsicht, Rechtschreibung), Effort mittel.

Die Angabe `Rolle der KI.pdf` verlangt die Kennzeichnung bei jeder einzelnen Antwort, ausdrücklich auch bei umgeschriebenem Text. Umgesetzt über `\kiquelle{}` im Quellenblock. Diese Kennzeichnung ersetzt den Sachbeleg nicht.

"Quelle: Claude" als Beleg für eine Fachaussage kommt nie ins Protokoll. Belege stammen aus Primärquellen nach `bsh-research`.

## Umgebung

Laborzugang mit VirtualBox und den vorbereiteten VMs, Windows Server 2019 und Linux Mint, besteht in der Schule. Zu Hause steht VMware mit einer eingerichteten VM aus einem anderen Projekt zur Verfügung.

VirtualBox-spezifische Versuche gehören ins Labor. Allgemeine Netzwerk- und Protokollversuche lassen sich zu Hause vorbereiten, um Laborzeit zu sparen.

## Skills

`bsh-research` Quellenpolitik und Belegpflicht. `bsh-protokoll` Formvorgaben und LaTeX-Konventionen. `bsh-messung` Versuchsdokumentation. `bsh-schreibstil` Stil der Protokolltexte. `bsh-committing` Commit-Konvention.
