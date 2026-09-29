---
name: bsh-messung
description: Wie ein praktischer Versuch im Protokoll dokumentiert wird - Aufbau, Durchführung, Rohdaten, Beobachtung, Deutung, und die strikte Trennung zwischen Gemessenem und Erwartetem. TRIGGER bei jedem Kapitel mit Screenshots, Messwerten, Konsolenausgaben oder Konfigurationsschritten, und bevor irgendein Versuchsergebnis ins Protokoll geschrieben wird. SKIP bei rein theoretischen Aufgaben ohne praktischen Teil.
user-invocable: true
---

# Messung und Versuchsdokumentation

Wo die Angabe nur eine Ja-Nein-Tabelle verlangt, beantwortet ein gemessener, belegter und gedeuteter Versuch dieselbe Frage auf höherem Niveau. Das Niveau des Protokolls entsteht hier, nicht in der Sprache.

## Grundregel

Nie ein Ergebnis schreiben, das nicht gelaufen ist: kein erfundener Ping, keine plausible Zahl. Ein nicht durchgeführter Versuch bleibt als `% TODO MESSUNG: <was, wo, womit>` offen, bis Adam die Daten liefert.

Erwartung und Beobachtung stehen getrennt: erst was erwartet wurde und warum, dann was geschah. Stimmen sie überein, ist das eine Bestätigung. Weichen sie ab, wird die Abweichung ausführlich behandelt, nicht kaschiert.

Ein gescheiterter oder fehlerhafter Anlauf steht im Text; gleichartige Wiederholungen dürfen zusammengefasst werden. Wegfallen darf ein Anlauf erst, wenn Adam den Versuch vollständig wiederholt hat. Aus mehreren Anläufen wird nie ein einziger zusammengesetzt.

## Aufbau eines Versuchs

Jeder Versuch steht in einer `messung`-Umgebung mit fünf Teilen in dieser Reihenfolge:

**Aufbau.** Konfiguration mit Werten: Wirtssystem, Gast, VirtualBox-Version, Netzwerkmodus, Adressen; genug zum Wiederholen. Dass der Versuch am Heimrechner lief, steht hier. Werte, Zustände und Zeitpunkte kommen aus `VBoxManage showvminfo --machinereadable` und `VBox.log`, nicht aus dem Gesprächsverlauf.

**Durchführung.** Der ausgeführte Befehl wörtlich in Monospace; ein eigenes Listing nur, wenn die Rohdaten die Befehle nicht samt Prompt zeigen.

**Rohdaten.** Die Ausgabe als `lstlisting`, ungekürzt oder mit gekennzeichneter Kürzung, dazu der Screenshot als Beleg.

**Beobachtung.** Was zu sehen ist, ohne Deutung.

**Deutung.** Warum es so ausging, mit Bezug auf die Theorie.

## Versuche über die Angabe hinaus

Die Tabelle der Netzwerkmodi hat zwölf Ja-Nein-Zellen, jede ist prüfbar: `ping` für VM zu Wirtssystem, eine zweite VM für VM zu VM, `curl` oder Browser für VM zu Internet, ein Dienst im Gast für Internet zu VM.

Weitere Kandidaten: Erstellungsdauer und Belegung fester und dynamischer Plattendateien, Platzverbrauch vor und nach einem Snapshot, dieselbe Operation mit und ohne Guest Additions.

## Typische Fallen

Der Ping zum Gast scheitert im Bridged-Modus oft an dessen Firewall, Windows blockt eingehendes ICMP standardmäßig. Das wird benannt und mit einer Regeländerung belegt, nicht als Fehlschlag gemeldet.

Im NAT-Modus erreicht der Gast das Wirtssystem unter der Gateway-Adresse des NAT-Netzes, typischerweise 10.0.2.2, nicht unter dessen LAN-Adresse.

Feste Adressen eines Labornetzes aus der Angabe werden als Regel auf das tatsächliche Netz übertragen; die Übertragung steht im Aufbau.

Öffentliche Adressen des Heimanschlusses, die IPv4-Adresse des Routers und globale IPv6-Adressen, werden in Rohdaten und Screenshots geschwärzt und die Schwärzung benannt. Über anderes Persönliche, etwa Ordnernamen eines Sticks oder die Geräteliste des Wirtssystems, entscheidet Adam; Claude weist schon beim Planen der Aufnahmen darauf hin.
