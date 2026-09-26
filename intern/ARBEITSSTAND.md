# Arbeitsstand

Zustandsbeschreibung, kein Änderungsprotokoll. Was zu tun ist, steht in `BESTEHENDE_AUFGABEN.md`.

Stand: 26.09.2026

## Unterricht und Prüfung

Sechs Protokolle, deckungsgleich mit dem Bewertungsraster und den angelegten Verzeichnissen. Wintersemester: Virtualisierung, Serverinstallation, Active Directory. Sommersemester: Serverhardware, Apache, Betriebssicherheit. Bearbeitungsdauer fünf bis sechs Wochen je Protokoll. Gearbeitet wird am jeweils laufenden Protokoll; ein Verzeichnis bleibt leer, bis die zugehörige Angabe vorliegt.

Der folgende Ablauf stammt aus dem Erfahrungswissen eines Vorjahresschülers. Er ist keine offizielle Aussage, stimmt aber mit der Beurteilungsseite überein.

**Theorieprüfung.** Etwa zwanzig Fragen aus einem Pool von siebzig bis neunzig, bei kürzeren Protokollen weniger. Der Pool wird aus dem Protokolltext gebildet, jeder Absatz ist damit potentielle Prüfungsfrage.

**Praktische Leistungsfeststellung.** Fünf Aufgaben, meist zehn Punkte je Aufgabe, gearbeitet an einer VM am Laborrechner. Daneben ein Editorfenster mit einigen Zeilen Text und die eigenen Bilder aus der Protokollarbeit. Apache und Serverhardware weichen davon ab, wie, ist nicht bekannt. Für Protokoll 1 empfiehlt sich Linux Mint, weil sich alles im Terminal erledigen lässt und die Browser-Downloads entfallen.

**Mündliche Besprechung des erweiterten Protokolls.** Der Protokollinhalt wird abgefragt, je mehr richtige Antworten, desto mehr Punkte, bei vollständiger Beantwortung fünfzig oder hundert. Das ist der größte einzelne Punkteposten.

**Punkte je Semester.** Bis 249 Genügend, 250 bis 349 Befriedigend, 350 bis 449 Gut, ab 450 Sehr Gut. Abgezogen wurde erfahrungsgemäß vor allem für die Form und für ungenaue Quellenangaben.

Vorjahresprotokolle sind als Vorlage untersagt, ein Lehrbuch gibt es im dritten Jahrgang nicht. Form und Niveau kommen aus Angabe, Beurteilungsraster und Primärquellen. Einige Vorjahresprotokolle hat der Professor im Unterricht gezeigt, zugänglich sind sie nicht. Ein mit Gut bewertetes davon war deutlich knapper geschrieben, als es Protokoll 1 zunächst war.

## Rechner und VMs

**Heimrechner.** Windows 11 Pro, Intel Core i9-14900 mit dem Stromprofil des i9-14900K, 64 GB DDR5, RTX 5070 Ti, 1 TB für VMs reserviert. VMware Workstation mit einer VM aus einem anderen Projekt. VirtualBox ist noch nicht installiert. MiKTeX 25.12, VS Code mit LaTeX Workshop.

**VMs der Schule.** Zwei OVA-Dateien unter `C:\Users\Adam\Projekte`, außerhalb des Repositorys, exportiert im Oktober 2024 mit VirtualBox 7.1.2, noch nicht importiert.

| | `Mint22_BSHLab_2410` | `W11_23H2_BSHLab_2410` |
|---|---|---|
| Gast | Linux Mint 22 | Windows 11 23H2 |
| Prozessoren | 1 | 2 |
| Arbeitsspeicher | 4096 MB | 4096 MB |
| Platte (VMDK) | 21,1 GB (19,6 GiB) | 32,3 GB (30,1 GiB) |
| Firmware | BIOS | EFI, kein TPM im Deskriptor |
| USB-Controller | OHCI, EHCI | xHCI |
| Netz | NAT | NAT |

Abgelesen aus den OVF-Deskriptoren. Die Angabe nennt in Kapitel 4 noch Windows Server 2019 und dessen Zugangsdaten; keine Aufgabe setzt eine Serverfunktion voraus.

**Laborrechner.** Am 25.09.2026 an `1221-pc09` erhoben: Linux Mint 22.3, Intel Core i3-6100 (zwei Kerne, vier Threads, VT-x), 15 GiB Arbeitsspeicher, VirtualBox 7.2.18 mit Extension Pack. Keine Adminrechte. Wireshark zeichnet ohne Root auf, nmap ist vorhanden, `traceroute`, `iperf3`, `tshark` und ein RDP-Client fehlen. Netz 10.4.0.0/16, Gateway 10.4.255.254, DNS 10.100.0.11 und .12. Andere Laborrechner laufen unter Windows 11 Education.

## Protokoll 1, Virtualisierung

Gerüst vollständig: Kapitel 1 bis 10 nach der Angabe, Glossar als Anhang A, Abkürzungsverzeichnis als Anhang B, Quellenverzeichnis. Alle Angabentexte wörtlich übernommen und gegen die Original-PDFs geprüft. Kapitel 10 deckt die Erweiterung `Client-Server-V170901-V.pdf` ab.

Kapitel 2 ist fertig, alle acht Aufgaben. Kapitel 3 ist bis Aufgabe 3.6 geschrieben, offen sind Shared Folder, Snapshots und Snapshots im Labor.

Ohne VM schreibbar sind die übrigen Theorieaufgaben von Kapitel 3, Kapitel 6 und die Theorieteile von 5, 7 bis 9 und 10. Eine laufende VM brauchen Kapitel 4, die Versuche in 5 und 10 sowie die Installationen in 7 bis 9.

Veraltet in der Angabe: Die Erweiterung trägt die Version V170901 und Formularfelder mit `201_`. Der XP-Mode-Verweis im Einführungstext bezieht sich auf Windows 7. Die Proxy-Aufgabe nennt `proxies.by` als Bezugsquelle für einen offenen Proxy, Existenz und Zumutbarkeit sind fraglich. Die Bridged-Aufgabe gibt Adressen in 172.16.110.0 vor, das Labornetz liegt inzwischen in 10.4.0.0/16.
