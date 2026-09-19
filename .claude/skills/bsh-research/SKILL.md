---
name: bsh-research
description: Quellenpolitik für die BSH-Protokolle — welche Quellen zählen, in welcher Reihenfolge ihnen zu trauen ist, und wie ein Beleg im Protokoll aussieht. TRIGGER bevor irgendeine Fachaussage in eine Protokolldatei geschrieben wird, bei jeder Portnummer, Versionsangabe, Grenzwertangabe oder Herstellerbehauptung, und wenn der Benutzer um Recherche bittet. SKIP nur, wenn die Aussage bereits im Protokoll belegt ist und lediglich umformuliert wird.
user-invocable: true
---

# Recherche

Nie aus dem Gedächtnis belegen. Ein erfundener Beleg in einem abgegebenen Protokoll ist keine Ungenauigkeit, sondern eine Täuschung, und die Angabe verlangt bei jeder Aufgabe die Quelle als Link.

## Quellenrangfolge

**1. Primärdokumentation des Herstellers.** Für VirtualBox das Oracle-Handbuch unter `https://www.virtualbox.org/manual/`, mit Kapitelnummer im Beleg. Für Mozilla-Produkte `support.mozilla.org` und `developer.mozilla.org`. Für FileZilla `wiki.filezilla-project.org`.

**2. Normen und RFCs.** Protokollverhalten, Portnummern und Statuscodes kommen aus dem RFC, nicht aus einem Blogartikel. FTP ist RFC 959, SMTP ist RFC 5321, IMAP ist RFC 9051, POP3 ist RFC 1939. Portzuweisungen aus dem IANA-Register.

**3. Fachliteratur und Standardwerke.** Mit Titel, Auflage, Seitenzahl.

**4. Eigene Messung.** Ein selbst durchgeführter und dokumentierter Versuch ist ein vollwertiger Beleg und der wertvollste im Protokoll. Er gehört nach `bsh-messung` dokumentiert und wird als eigene Quelle geführt.

**5. Alles andere.** Forenbeiträge, Wikipedia, Blogartikel nur, wenn die Ränge darüber nichts hergeben, und dann mit Datum und ausdrücklichem Hinweis auf die schwächere Belegkraft.

## Regeln

Jede Zahl im Protokoll braucht eine Quelle: Portnummern, Versionsstände, maximale Arbeitsspeichergrößen, Formatgrenzen von VDI und VMDK.

Websuche vor jeder Versionsangabe. Versionsstände veralten zwischen Ausbildungsjahr und Abgabe.

Unbelegte Aussagen bekommen im Quelltext die Marke `% BELEG FEHLT: <was zu belegen ist>`. Vor der Abgabe darf keine dieser Marken übrigbleiben. Suche vor jeder Abgabe im gesamten Protokollverzeichnis danach.

Eine Quelle ist ein vollständiger Link, kein Domainname. Nicht `virtualbox.org`, sondern die Seite mit Kapitelanker.

Trenne, was die Quelle sagt, von dem, was daraus folgt. Das Handbuch beschreibt das Verhalten von NAT; dass daraus die Unerreichbarkeit des Gastes von außen folgt, ist eine Ableitung und darf als solche kenntlich sein.

## Belegform im Protokoll

Am Ende jeder beantworteten Aufgabe steht ein Quellenblock. Format siehe `bsh-protokoll`.

## Gaisberger-spezifisch

Die Angabe verweist mehrfach auf Kapitel des VirtualBox-Handbuchs, etwa Kap. 6.2ff für die Netzwerkmodi und Kap. 4.3 für Shared Folders. Wo die Angabe ein Kapitel nennt, ist dieses Kapitel die erwartete Quelle und wird auch so zitiert.
