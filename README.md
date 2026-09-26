# BSH-Labor 3AHIT 2026/2027 · HTBLA Traun
## Wo liegt was

| | Pfad | Inhalt |
|---|---|---|
| **Abgabestand** | `protokolle/01-virtualisierung/protokoll.pdf` | Das fertig gesetzte Protokoll. |
| **Arbeitsstand** | `intern/` | Offener Stand der Arbeit und die noch zu erledigenden Punkte. |
| **Regeln für die KI** | `.claude/skills/` | Die Vorgaben, nach denen die Texte entstehen: Form, Belege, Versuche, Stil und Commits. |

## Das Schuljahr

Zu jedem Protokoll gehören eine Theorieprüfung und eine praktische Leistungsfeststellung.

| Wintersemester | Stand | Sommersemester | Stand |
|---|---|---|---|
| **1** Virtualisierung | in Arbeit | **4** Serverhardware | folgt |
| **2** Serverinstallation | folgt | **5** Apache-Webserver | folgt |
| **3** Active Directory | folgt | **6** Betriebssicherheit | folgt |

## Wie eine Aufgabe aufgebaut ist

Jede Aufgabe folgt demselben Schema; Der Ausschnitt stammt aus Protokoll 1, Aufgabe 2.5 (gekürzt an den markierten Stellen):

> **2.5. Wie erstelle ich meine eigene virtuelle Maschine?**
>
> > **①** Du wirst zum Architekten deiner eigenen virtuellen Maschine! Welche Komponenten sind in einer virtuellen Maschine notwendig und was musst du bei diesen einstellen? Gib auch Beispiele für die Werte welche du zuweisen wirst. Begründe warum die Werte nicht beliebig klein und nicht beliebig groß sein dürfen.
>
> **②** Beim Anlegen einer VM werden fünf Bestandteile festgelegt: Gastbetriebssystemtyp, Arbeitsspeicher, Prozessorkerne, virtuelle Festplatte und Netzwerkkarte. Jeder Wert hat eine untere Schranke aus dem Bedarf des Gastes und eine obere aus dem Vorrat des Wirtsystems. *[…]*
>
> **Arbeitsspeicher** Er wird dem Wirtsbetriebssystem beim Start der VM entzogen und muss dann tatsächlich frei sein. *[…]*
>
> **③ Quellen**
> - Oracle VirtualBox: User Guide for Release 7.2, Kap. 4 „Creating a New Virtual Machine“. `https://docs.oracle.com/en/virtualization/virtualbox/7.2/user/create-vm.html`
> - Oracle VirtualBox: User Guide for Release 7.2, Kap. 9 „Virtual Networking“, Abschn. „Network Address Translation (NAT)“. `https://docs.oracle.com/en/virtualization/virtualbox/7.2/user/networkingdetails.html`
> - *[…]*
>
> <sub>**④** Textfassung erarbeitet mit Claude Opus 5 und Opus 5.5 (Anthropic), Stand 26. 09. 2026; die Sachaussagen sind den oben genannten Quellen entnommen.</sub>

1. **Angabe im Wortlaut.** Der Aufgabentext steht ungekürzt in einer eigenen Box, damit die Vollständigkeit gegenüber der Angabe prüfbar bleibt.
2. **Antwort.** Die Kernaussage steht am Anfang des Absatzes und beantwortet die Frage für sich allein. Fachbegriffe werden bei der ersten Nennung definiert.
3. **Quellen.** Jede Sachaussage ist mit einem vollständigen Link auf die Fundstelle belegt. Eigene Messungen erscheinen als eigene Quelle.
4. **KI-Kennzeichnung.** Bei jeder einzelnen Antwort, mit Modell und Stand der Textfassung, wie es die Angabe *Rolle der KI* verlangt.

## Belege und Versuche

Jeder Link wird vor dem Zitieren geöffnet. Ist eine Aussage nicht belegbar, wird sie gestrichen oder als eigene Ableitung kenntlich gemacht. Die Quellen werden in dieser Reihenfolge herangezogen:

1. **Dokumentation des Herstellers**, etwa das VirtualBox-Handbuch 7.2 mit Kapitelangabe
2. **Normen und RFCs** für Protokollverhalten und Portnummern
3. **Fachliteratur** mit Titel, Auflage und Seite
4. **Eigene Messung**, dokumentiert und wiederholbar
5. **Praktikerquellen**, ergänzend, wo sie den Sachverhalt klarer erklären

Die Kapitelnummern, auf die die Angabe im Handbuch verweist, stimmen in der aktuellen Fassung nicht mehr. Zitiert wird die aktuelle Fundstelle; wo sich ein Sachverhalt seither geändert hat, steht das im Text.

Wo die Angabe eine Tabelle mit Ja und Nein verlangt, wird jede Zelle gemessen. Jeder Versuch ist in fünf Teilen dokumentiert:

1. **Aufbau**: Wirt, Gast, VirtualBox-Version, Netzwerkmodus und Adressen
2. **Durchführung**: der ausgeführte Befehl im Wortlaut
3. **Rohdaten**: die Ausgabe als Listing, der Screenshot als Beleg
4. **Beobachtung**: was zu sehen ist, ohne Deutung
5. **Deutung**: warum es so ausging; eine Abweichung von der Erwartung wird erklärt

Die Versuche laufen an einem eigenen Rechner mit den VMs, die die Schule ausgegeben hat. Weicht die Umgebung vom Labor ab, etwa bei den Netzadressen, steht das im Aufbau.

## Einsatz von KI

Die Textfassungen entstehen mit Claude von Anthropic, in den Modellen Opus 5, Opus 5.5 und Sonnet 5. Jede Antwort trägt die Kennzeichnung, auch umgeschriebener Text.

Die KI ist nie Quelle einer Sachaussage. Die Kennzeichnung nennt, wie der Text entstanden ist, der Quellenblock, woher die Information stammt. Für Inhalt und Verständnis bleibt der Verfasser verantwortlich; das Protokoll ist zugleich seine Lernunterlage für die Prüfungen.

Die Regeln, nach denen die KI arbeitet, liegen offen unter `.claude/skills/` und in `CLAUDE.md`, der Arbeitsstand unter `intern/`.

## Warum LaTeX

Weil es kostenlos, praktisch und cool ist! Die Angabe gibt eine Word-Vorlage vor und erlaubt andere Programme, solange der Inhalt der Angabe vollständig enthalten ist - abgegeben wird jedoch als PDF.

Das Inhaltsverzeichnis wird bei jedem Bau neu erzeugt und bleibt damit von selbst aktuell. Schriftgrößen, Rahmen und Farben liegen zentral in einer Dokumentklasse und bleiben über alle sechs Protokolle gleich. Weil der Quelltext reiner Text ist, lässt er sich versionieren, und jeder Abgabestand bleibt nachvollziehbar.

## Aufbau des Repositorys

```
vorlage/bsh-protokoll.cls   Dokumentklasse, von allen sechs Protokollen geteilt

protokolle/01-virtualisierung/
  protokoll.tex             Hauptdatei, bindet die Kapitel ein
  protokoll.pdf             Abgabestand
  kapitel/01 … 10           ein Kapitel je Datei, nummeriert wie die Angabe
  kapitel/97, 98, 99        Glossar, Abkürzungen, Quellen
  bilder/                   Screenshots

intern/                     Arbeitsstand und offene Punkte
.claude/skills/             Regeln für die KI
```

Kapitel 10 von Protokoll 1 deckt die gesonderte Erweiterung *Einführung Client-Server* ab. Die Angabendokumente der Schule liegen nicht im Repository.

Gebaut wird aus dem jeweiligen Protokollverzeichnis mit `latexmk -pdf protokoll.tex`. Vorausgesetzt ist eine TeX-Distribution mit `latexmk` und Perl.
