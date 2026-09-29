---
name: bsh-research
description: Quellenpolitik für die BSH-Protokolle - welche Quellen zählen, in welcher Reihenfolge ihnen zu trauen ist, und wie ein Beleg im Protokoll aussieht. TRIGGER bevor irgendeine Fachaussage in eine Protokolldatei geschrieben wird, bei jeder Portnummer, Versionsangabe, Grenzwertangabe oder Herstellerbehauptung, und wenn der Benutzer um Recherche bittet. SKIP nur, wenn die Aussage bereits im Protokoll belegt ist und lediglich umformuliert wird.
user-invocable: true
---

# Recherche

Nie aus dem Gedächtnis belegen, jeden Link vor dem Zitieren öffnen. Ein erfundener Beleg in einem abgegebenen Protokoll ist eine Täuschung.

## Quellenrangfolge

**1. Primärdokumentation des Herstellers.** VirtualBox: Handbuch 7.2 unter `docs.oracle.com/en/virtualization/virtualbox/7.2/user/`, weil nur dort die Kapitelnummer steht. "Technical Background" und "Known Limitations" gibt es nur unter `virtualbox.org/manual/`. Unterabschnitte tragen keine Nummer und werden mit Titel zitiert. Mozilla: `support.mozilla.org`, `developer.mozilla.org`. FileZilla: `wiki.filezilla-project.org`.

**2. Normen und RFCs.** Protokollverhalten, Portnummern und Statuscodes aus dem RFC: FTP RFC 959, SMTP RFC 5321, IMAP RFC 9051, POP3 RFC 1939. Portzuweisungen aus dem IANA-Register.

**3. Fachliteratur.** Mit Titel, Auflage, Seitenzahl.

**4. Eigene Messung.** Ein dokumentierter Versuch nach `bsh-messung` ist ein vollwertiger Beleg und der wertvollste im Protokoll.

**5. Praktikerquellen.** IONOS, Proxmox, Herstellerblogs, Fachcommunity. Gaisberger wünscht sie ausdrücklich. Sie treten neben den Primärbeleg, wo sie besser erklären, nie an seine Stelle.

**6. Alles andere.** Foren und Wikipedia nur, wenn die Ränge darüber nichts hergeben, dann mit Datum und Hinweis auf die schwächere Belegkraft.

## Regeln

Jede Zahl braucht eine Quelle: Portnummern, Versionsstände, Grenzwerte. Vor jeder Versionsangabe eine Websuche, weil Versionsstände veralten.

Eine Quelle ist ein vollständiger Link auf die Seite, kein Domainname.

Eine unbelegte Aussage wird gestrichen, als Ableitung kenntlich gemacht oder bis zum Beleg im Quelltext mit `% BELEG FEHLT: <was zu belegen ist>` markiert; vor der Abgabe darf keine Markierung übrig sein.

Was die Quelle sagt, und was daraus folgt, bleiben getrennt. Ableitungen sollen vorkommen, weil die Angabe eigene Gedanken verlangt; sie sind im Fließtext erkennbar, etwa durch *daraus folgt*, und werden der Quelle nicht in den Mund gelegt. Das gilt auch für Einschränkungen und Verallgemeinerungen, die die Quelle nicht macht: *nur*, *zusätzlich*, *immer*.

## Gegenprüfung

Die Angabe verlangt, den Inhalt selbständig zu prüfen, über weitere Quellen oder ein zweites KI-Modell. Erfüllt wird das über die Quellen: Jede Fachaussage wird an der geöffneten Primärquelle nachgelesen, bevor sie stehen bleibt. Ein zweites Modell ersetzt das nicht.

Ein Zitat wird am Rohtext der Seite geprüft, nicht an der Ausgabe von WebFetch, die ein kleines Modell zusammenfasst und dabei Wortlaut verändert: `curl -sL <URL> | sed 's/<[^>]*>/ /g' | tr -s ' \n' ' ' | grep -oF "<Zitat>"`. In Manpages trennt das Entfernen der Tags Satzzeichen ab; dort ohne sie suchen.

## Kapitelnummern der Angabe

Die Verweise der Angabe auf Handbuchkapitel (6.2ff, 4.3, 4.3.1, 1.9, 1.14) stimmen im Handbuch 7.2 nicht mehr. Zitiert wird nur die aktuelle Fundstelle. Beschreibt die Angabe einen Sachverhalt, der heute anders liegt, benennt der Protokolltext die Abweichung.
