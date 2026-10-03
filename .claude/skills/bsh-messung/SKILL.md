---
name: bsh-messung
description: Wie ein praktischer Versuch im Protokoll dokumentiert wird - Aufbau, Durchführung, Rohdaten, Beobachtung, Deutung, und die strikte Trennung zwischen Gemessenem und Erwartetem. TRIGGER bei jedem Kapitel mit Screenshots, Messwerten, Konsolenausgaben oder Konfigurationsschritten, und bevor irgendein Versuchsergebnis ins Protokoll geschrieben wird. SKIP bei rein theoretischen Aufgaben ohne praktischen Teil.
user-invocable: true
---

# Messung und Versuchsdokumentation

Wo die Angabe nur eine Ja-Nein-Tabelle verlangt, beantwortet ein gemessener, belegter und gedeuteter Versuch dieselbe Frage auf höherem Niveau. Das Niveau des Protokolls entsteht hier, nicht in der Sprache.

## Grundregel

Nie ein Ergebnis schreiben, das nicht gelaufen ist: kein erfundener Ping, keine plausible Zahl. Ein nicht durchgeführter Versuch bleibt als `% TODO MESSUNG: <was, wo, womit>` offen, bis Adam die Daten liefert.

Erwartung und Beobachtung stehen getrennt: Was die Theorie erwarten lässt und warum, steht im Antworttext vor dem Versuch, was geschah, im Versuch. Eine Abweichung wird in der Deutung erklärt, nicht kaschiert.

Ein gescheiterter oder fehlerhafter Anlauf steht im Text; gleichartige Wiederholungen dürfen zusammengefasst werden. Wegfallen darf ein Anlauf erst, wenn Adam den Versuch vollständig wiederholt hat. Aus mehreren Anläufen wird nie ein einziger zusammengesetzt.

## Planung

Bevor Adam einen Versuch durchführt, gibt Claude ihm je Messpunkt den Befehl und die Aufnahme vor, samt Dateiname nach Messpunkt. Die Aufnahme zeigt die ganze Ausgabe einschließlich der Summenzeilen, etwa Download- und Plattenbedarf bei `apt`. Das Fenster ist so breit, dass PowerShell keine Spalte kürzt. Direkt nach dem Versuch sichert Adam den Ordner `Logs` der VM, weil jeder Start die Protokolldateien weiterschiebt und VirtualBox nur vier behält.

Die öffentliche IPv4-Adresse des Heimanschlusses und globale IPv6-Adressen werden in Rohdaten und Screenshots geschwärzt und die Schwärzung benannt. Über anderes Persönliche, etwa Ordnernamen eines Sticks oder die Geräteliste des Wirtssystems, entscheidet Adam; Claude weist schon beim Planen der Aufnahmen darauf hin.

Gelieferte Screenshots werden nach Adams Dateinamen zugeordnet, nie nach der Reihenfolge im Chat.

## Aufbau eines Versuchs

Jeder Versuch steht in einer `messung`-Umgebung mit fünf Teilen in dieser Reihenfolge:

**Aufbau.** Konfiguration mit Werten: Wirtssystem, Gast, VirtualBox-Version, Netzwerkmodus, Adressen; genug zum Wiederholen. Dass der Versuch am Heimrechner lief, steht hier. Werte, Zustände und Zeitpunkte kommen aus `VBoxManage showvminfo --machinereadable` und `VBox.log`, nicht aus dem Gesprächsverlauf.

**Durchführung.** Der ausgeführte Befehl wörtlich in Monospace.

**Rohdaten.** Eine Terminalausgabe belegt der Screenshot allein, ein Listing wiederholt ihn nicht; die Werte, auf die sich die Deutung stützt, nennt die Beobachtung. Als `lstlisting` steht nur eine Ausgabe ohne Screenshot, etwa ein Auszug aus `VBox.log`, mit gekennzeichneter Kürzung. Mehrere gleichartige Ausgaben, etwa Dateilisten an mehreren Messpunkten, fasst eine Tabelle zusammen; die Screenshots belegen ihre Spalten. Der Absatz unter der Überschrift nennt nur, was die Beschriftungen nicht sagen: Herkunft und Umrechnung der Werte, etwa Laufzeit in `VBox.log` zu Ortszeit.

**Beobachtung.** Was zu sehen ist, ohne Deutung: Veränderungen und Auffälligkeiten.

**Deutung.** Warum es so ausging, mit Bezug auf die Theorie. Was allein aus dem Versuch geschlossen ist, steht als Ableitung da und nennt die Reichweite des Versuchs, etwa *in dieser Konfiguration*.

## Versuche über die Angabe hinaus

Die Tabelle der Netzwerkmodi hat zwölf Ja-Nein-Zellen, jede ist prüfbar: `ping` für VM zu Wirtssystem, eine zweite VM für VM zu VM, `curl` oder Browser für VM zu Internet, ein Dienst im Gast für Internet zu VM.

## Typische Fallen

Der Ping zum Gast scheitert im Bridged-Modus oft an dessen Firewall, Windows blockt eingehendes ICMP standardmäßig. Das wird benannt und mit einer Regeländerung belegt, nicht als Fehlschlag gemeldet.

Im NAT-Modus steht in der Voreinstellung 10.0.2.2 für die Loopback-Schnittstelle des Wirtssystems, nicht für dessen LAN-Adresse. Welche der beiden Adressen der Gast erreicht, zeigt erst der Versuch.

Dateigrößen aus `Get-ChildItem`, `dir` oder dem Explorer sind für Dateien, die eine laufende VM offen hält, veraltet: NTFS aktualisiert den Verzeichniseintrag erst beim Schließen der Datei. Plattenabbilder deshalb bei ausgeschalteter VM auflisten oder mit `VBoxManage showmediuminfo disk <Pfad>` messen, Zeile `Size on disk`.

Feste Adressen eines Labornetzes aus der Angabe werden als Regel auf das tatsächliche Netz übertragen; die Übertragung steht im Aufbau.
