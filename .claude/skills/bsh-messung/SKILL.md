---
name: bsh-messung
description: Wie ein praktischer Versuch im Protokoll dokumentiert wird — Aufbau, Durchführung, Rohdaten, Beobachtung, Deutung, und die strikte Trennung zwischen Gemessenem und Erwartetem. TRIGGER bei jedem Kapitel mit Screenshots, Messwerten, Konsolenausgaben oder Konfigurationsschritten, und bevor irgendein Versuchsergebnis ins Protokoll geschrieben wird. SKIP bei rein theoretischen Aufgaben ohne praktischen Teil.
user-invocable: true
---

# Messung und Versuchsdokumentation

Hier entsteht der Unterschied zwischen einem erfüllten und einem überraschenden Protokoll. Die Angabe fragt oft nur nach einer Tabelle mit Ja und Nein. Wer stattdessen misst, belegt und deutet, beantwortet dieselbe Frage auf einem anderen Niveau.

## Eiserne Regel

Nie ein Ergebnis schreiben, das nicht gelaufen ist. Kein erfundener Ping, keine ausgedachte Ausgabe, keine plausible Zahl. Wenn ein Versuch nicht durchgeführt wurde, steht das da, und der Abschnitt bleibt als `% TODO MESSUNG: <was zu messen ist, wo, womit>` offen, bis Adam die Daten liefert.

Erwartung und Beobachtung werden getrennt geschrieben. Zuerst was erwartet wurde und warum, dann was tatsächlich passiert ist. Wenn beides übereinstimmt, ist das eine Bestätigung und wird als solche benannt. Wenn nicht, ist die Abweichung der interessanteste Teil des Protokolls und wird ausführlich behandelt, nicht kaschiert.

## Aufbau eines Versuchs

Jeder Versuch steht in einer `messung`-Umgebung und hat fünf Teile, in dieser Reihenfolge:

**Aufbau.** Was ist konfiguriert, mit welchen Werten. Hostsystem, Gastsystem, VirtualBox-Version, Netzwerkmodus, IP-Adressen. Genug, dass jemand anderer den Versuch wiederholen kann.

**Durchführung.** Der ausgeführte Befehl in Monospace, wörtlich. Nicht paraphrasiert.

**Rohdaten.** Die Ausgabe als `lstlisting`, ungekürzt oder mit gekennzeichneter Kürzung. Zusätzlich der Screenshot als Beleg, nicht als Ersatz.

**Beobachtung.** Was zu sehen ist, ohne Deutung. Antwortzeiten, Fehlermeldungen, Statuscodes.

**Deutung.** Warum es so ausgegangen ist, mit Bezug auf die Theorie aus dem entsprechenden Kapitel.

## Versuche, die über die Angabe hinausgehen

Bei den Netzwerkmodi verlangt die Angabe eine Tabelle mit sechzehn Ja-Nein-Zellen. Jede Zelle ist prüfbar: `ping` für VM zu Host und Host zu VM, eine zweite VM für VM zu VM, `curl` oder Browser für VM zu Internet, ein Portscan oder ein Dienst auf dem Gast für Internet zu VM. Wer alle sechzehn belegt, hat die Tabelle nicht abgeschrieben, sondern erarbeitet.

Bei den virtuellen Festplattenformaten lassen sich Erstellungsdauer und tatsächliche Belegung von fester und dynamischer Zuweisung messen und gegenüberstellen.

Bei Snapshots lässt sich der Speicherplatzverbrauch vor und nach dem Snapshot vergleichen und damit das Differenzprinzip belegen.

Bei Guest Additions lässt sich dieselbe Operation mit und ohne Additions durchführen, etwa Bildschirmauflösung, Mauszeiger, Zwischenablage.

## Typische Fallen, die zu erklären sind statt zu verschweigen

Der Ping vom Host zum Gast scheitert im Bridged-Modus häufig an der Firewall des Gastsystems, nicht an der Netzwerkkonfiguration. Windows blockt eingehendes ICMP standardmäßig. Wer das erkennt, benennt und mit einer Regeländerung belegt, zeigt Verständnis; wer es als Fehlschlag meldet, verschenkt Punkte.

Im NAT-Modus ist der Host vom Gast aus unter der Gateway-Adresse des NAT-Netzes erreichbar, typischerweise 10.0.2.2, nicht unter seiner LAN-Adresse. Das ist der häufigste Grund für einen scheinbar fehlschlagenden Ping.

## Werkzeuge

Für Netzwerkmessungen: `ping`, `tracert` beziehungsweise `traceroute`, `ipconfig /all` beziehungsweise `ip addr`, `nslookup`, `netstat -an`. Für Portprüfungen `Test-NetConnection` unter PowerShell. Für Durchsatz `iperf3`, falls verfügbar.
