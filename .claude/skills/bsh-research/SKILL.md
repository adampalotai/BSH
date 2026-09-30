---
name: bsh-research
description: Quellenpolitik für die BSH-Protokolle - welche Quellen zählen, in welcher Reihenfolge ihnen zu trauen ist, und wie ein Beleg im Protokoll aussieht. TRIGGER bevor irgendeine Fachaussage in eine Protokolldatei geschrieben wird, bei jeder Portnummer, Versionsangabe, Grenzwertangabe oder Herstellerbehauptung, beim Überarbeiten bestehenden Protokolltexts, und wenn der Benutzer um Recherche für ein Protokoll bittet. SKIP nur für Antworten im Chat.
user-invocable: true
---

# Recherche

Nie aus dem Gedächtnis belegen, jeden Link vor dem Zitieren öffnen. Ein erfundener Beleg in einem abgegebenen Protokoll ist eine Täuschung.

## Quellenrangfolge

**1. Primärdokumentation des Herstellers.** VirtualBox: Handbuch 7.2 unter `docs.oracle.com/en/virtualization/virtualbox/7.2/user/`, weil nur dort die Kapitelnummer steht. "Technical Background" und "Known Limitations" gibt es nur unter `virtualbox.org/manual/`. Mozilla: `support.mozilla.org`, `developer.mozilla.org`. FileZilla: `wiki.filezilla-project.org`.

**2. Normen und RFCs.** Protokollverhalten und Statuscodes aus dem RFC: FTP RFC 959, SMTP RFC 5321, IMAP RFC 9051, POP3 RFC 1939. Portnummern aus dem IANA-Register.

**3. Fachliteratur.** Mit Titel, Auflage, Seitenzahl.

**4. Eigene Messung.** Ein dokumentierter Versuch nach `bsh-messung` ist ein vollwertiger Beleg.

**5. Praktikerquellen.** IONOS, Proxmox, Herstellerblogs, Fachcommunity. Gaisberger wünscht sie ausdrücklich. Sie treten neben den Primärbeleg, wo sie besser erklären, nie an seine Stelle.

**6. Alles andere.** Foren und Wikipedia nur, wenn die Ränge darüber nichts hergeben, dann mit Datum und Hinweis auf die schwächere Belegkraft.

## Regeln

Jede Zahl braucht eine Quelle: Portnummern, Versionsstände, Grenzwerte. Vor jeder Versionsangabe eine Websuche, weil Versionsstände veralten.

Eine Quelle ist ein vollständiger Link auf die Seite, kein Domainname.

Eine unbelegte Aussage wird belegt, als Ableitung kenntlich gemacht, gestrichen oder bis zum Beleg im Quelltext mit `% BELEG FEHLT: <was zu belegen ist>` markiert.

Was die Quelle sagt, und was daraus folgt, bleiben getrennt. Ableitungen sollen vorkommen, weil die Angabe eigene Gedanken verlangt; sie sind im Fließtext erkennbar, etwa durch *daraus folgt*, und werden der Quelle nicht in den Mund gelegt. Das gilt auch für Einschränkungen und Verallgemeinerungen, die die Quelle nicht macht: *nur*, *zusätzlich*, *immer*.

Die Fundstelle bezeichnet, was die Seite tatsächlich hat. Abschnitt heißt nur, was dort Überschrift ist; ein Listenpunkt ist ein Punkt, ein Feld einer Manpage ein Feld, jeweils mit dem Abschnitt, in dem er steht.

Beschreibt eine Stelle einen anderen Fall als den im Text, etwa das Wirtssystem statt des Gastes oder eine andere Version, trägt sie die Aussage erst über die Stelle, die die Übertragung erlaubt. Diese wird mitzitiert, sonst ist die Übertragung eine Ableitung und steht als solche da.

Die Zuschreibung nennt, wer etwas sagt. Eine Warnung aus dem Handbuch ist keine Warnung der Software; *VirtualBox warnt* steht nur, wenn die Oberfläche warnt.

Ein bestehender Beleg gilt beim Überarbeiten als ungeprüft. Überarbeitet wird der Quellenblock mit dem Text, nicht danach.

Eine eigene Beobachtung trägt nur, was beobachtet wurde. Dass ein Befehl in einem Menü fehlt, belegt nicht, dass es ihn nirgends gibt. Bevor daraus *nur* oder *nicht möglich* wird, wird das Handbuch danach durchsucht.

## Gegenprüfung

Die Angabe verlangt, den Inhalt selbständig zu prüfen, über weitere Quellen oder ein zweites KI-Modell. Erfüllt wird das über die Quellen: Jede Fachaussage wird an der geöffneten Primärquelle nachgelesen, bevor sie stehen bleibt. Ein zweites Modell ersetzt das nicht.

Ein Zitat wird am Rohtext der Seite geprüft, nicht an der Ausgabe von WebFetch, die ein kleines Modell zusammenfasst und dabei Wortlaut verändert. Für ein Kapitel erledigt das `python ../../vorlage/zitate.py kapitel/<Datei>.tex` aus dem Protokollverzeichnis. Es sucht jedes `\enquote` einer Quellenzeile mit URL auf der verlinkten Seite, auch Kapitel- und Abschnittstitel, und nennt die Überschrift, unter der es steht; ein Eintrag bleibt deshalb auf einer Zeile. `FEHLT` heißt, Wortlaut oder Titel stimmt nicht; passt die genannte Überschrift nicht zur Fundstelle im Eintrag, stimmt die Fundstelle nicht. PDFs und Seiten, die das Skript nicht laden kann, werden von Hand geprüft: PDFs mit `pdftotext`, Seiten mit `curl -sL <URL> | sed 's/<[^>]*>/ /g' | tr -s ' \n' ' ' | grep -oF "<Zitat>"`. In Manpages trennt das Entfernen der Tags Satzzeichen ab; dort ohne sie suchen.

Vor der Übergabe einer Aufgabe folgt der Belegabgleich in beide Richtungen. Für jeden Satz steht fest, welches Zitat, welche genannte Fundstelle oder welcher Messwert ihn trägt; ein Satz ohne Träger wird nach den Regeln oben behandelt. Eine Quelle, ein Zitat oder ein Verzeichniseintrag, der keinen Satz mehr trägt, fällt weg.

## Kapitelnummern der Angabe

Die Verweise der Angabe auf Handbuchkapitel stimmen im Handbuch 7.2 nicht mehr. Zitiert wird nur die aktuelle Fundstelle. Beschreibt die Angabe einen Sachverhalt, der heute anders liegt, benennt der Protokolltext die Abweichung.
