---
name: bsh-research
description: Quellenpolitik für die BSH-Protokolle - welche Quellen zählen, in welcher Reihenfolge ihnen zu trauen ist, und wie ein Beleg im Protokoll aussieht. TRIGGER bevor irgendeine Fachaussage in eine Protokolldatei geschrieben wird, bei jeder Portnummer, Versionsangabe, Grenzwertangabe oder Herstellerbehauptung, und wenn der Benutzer um Recherche bittet. SKIP nur, wenn die Aussage bereits im Protokoll belegt ist und lediglich umformuliert wird.
user-invocable: true
---

# Recherche

Nie aus dem Gedächtnis belegen. Jeden Link vor dem Zitieren tatsächlich öffnen. Ein erfundener Beleg in einem abgegebenen Protokoll ist keine Ungenauigkeit, sondern eine Täuschung, und die Angabe verlangt bei jeder Aufgabe die Quelle als Link.

## Quellenrangfolge

**1. Primärdokumentation des Herstellers.** Für VirtualBox das Oracle-Handbuch unter `https://www.virtualbox.org/manual/`, mit Kapitelangabe im Beleg. Für Mozilla-Produkte `support.mozilla.org` und `developer.mozilla.org`. Für FileZilla `wiki.filezilla-project.org`.

**2. Normen und RFCs.** Protokollverhalten, Portnummern und Statuscodes kommen aus dem RFC. FTP ist RFC 959, SMTP ist RFC 5321, IMAP ist RFC 9051, POP3 ist RFC 1939. Portzuweisungen aus dem IANA-Register.

**3. Fachliteratur und Standardwerke.** Mit Titel, Auflage, Seitenzahl.

**4. Eigene Messung.** Ein selbst durchgeführter und dokumentierter Versuch ist ein vollwertiger Beleg und der wertvollste im Protokoll. Dokumentation nach `bsh-messung`, geführt als eigene Quelle.

**5. Praktikerquellen.** IONOS, Proxmox, Herstellerblogs, Beiträge aus der Fachcommunity. Gaisberger wünscht sie ausdrücklich, weil sie von Fachleuten aus der Wirtschaft stammen und auf Lernende zielen. Sie treten neben den Primärbeleg, wenn sie den Sachverhalt besser erklären, nie an seine Stelle.

**6. Alles andere.** Forenbeiträge und Wikipedia nur, wenn die Ränge darüber nichts hergeben, und dann mit Datum und ausdrücklichem Hinweis auf die schwächere Belegkraft.

## Regeln

Jede Zahl im Protokoll braucht eine Quelle: Portnummern, Versionsstände, maximale Arbeitsspeichergrößen, Formatgrenzen von VDI und VMDK. Vor jeder Versionsangabe eine Websuche, weil Versionsstände zwischen Ausbildungsjahr und Abgabe veralten.

Eine Quelle ist ein vollständiger Link, kein Domainname. Nicht `virtualbox.org`, sondern die Seite mit Kapitelanker. Der Quellenblock am Ende jeder Aufgabe ist nach `bsh-protokoll` aufgebaut.

Unbelegte Aussagen bekommen im Quelltext die Marke `% BELEG FEHLT: <was zu belegen ist>`. Vor der Abgabe darf keine übrigbleiben.

Trenne, was die Quelle sagt, von dem, was daraus folgt. Das Handbuch beschreibt das Verhalten von NAT; dass daraus die Unerreichbarkeit des Gastes von außen folgt, ist eine Ableitung.

Solche Ableitungen sollen vorkommen. Die Angabe verlangt ausdrücklich, eigenes Verständnis durch eigene Gedanken zu zeigen, und ein Kapitel aus aneinandergereihten Belegstellen leistet das nicht. Die Ableitung ist im Fließtext erkennbar, etwa durch *daraus folgt* oder *im Versuch bedeutet das*, und wird der Quelle nicht in den Mund gelegt.

## Gegenprüfung

Die Angabe verlangt, den Inhalt selbständig zu prüfen, wahlweise über weitere Quellen oder ein zweites KI-Modell. Erfüllt wird das über die Quellen: Jede Fachaussage wird an der geöffneten Primärquelle nachgelesen, bevor sie stehen bleibt. Ein zweites Modell prüft nur die Übereinstimmung zweier Textgeneratoren und ersetzt das nicht.

## Kapitelnummern der Angabe

Die Angabe verweist auf Kap. 6.2ff für die Netzwerkmodi, Kap. 4.3 und 4.3.1 für Shared Folders, Kap. 1.9 für Snapshots, Kap. 1.14 für Export und Import. Im Handbuch 7.2 stimmt keine dieser Nummern mehr.

Zitiert wird ausschließlich die aktuelle Fundstelle mit Link, ohne die veraltete Nummer mitzuführen. Wo die Angabe einen Sachverhalt beschreibt, der heute anders liegt, wird die Abweichung im Protokolltext benannt statt stillschweigend korrigiert.
