---
name: bsh-committing
description: Commit-Konvention für das BSH-Protokollprojekt - deutsch, Abschnittsbezug im Betreff, Aufzählung im Rumpf, keine Co-Author-Zeilen, nie pushen. TRIGGER wenn Adam committen sagt, um eine Commit-Nachricht bittet, oder ein Arbeitsabschnitt fertig ist und festgehalten werden soll. SKIP für push, branch, rebase und das Lesen der Historie.
user-invocable: true
---

# Committen

Arbeit fertig, dann committen. Nie unaufgefordert.

## Regeln

Deutsch, weil das Projekt deutsch ist. Betreffzeile kurz, mit Protokollnummer und Abschnitt. Sie benennt die Änderung, nicht die Datei. Rumpf als Aufzählung, ein Punkt je inhaltliche Änderung. Keine Co-Author-Zeilen, kein `Generated with Claude Code`. Nie pushen, der Benutzer pusht. Vor jedem Commit `git status` prüfen und sehen, was tatsächlich eingeht. Keine Hilfsdateien der Kompilation, keine Zwischenstände aus dem Scratchpad.

## Format

```
P1 Netzwerkkonfiguration: NAT-Kapitel ausgearbeitet

- Theorieteil zu Adressumsetzung mit Handbuchbeleg Kap. 9
- Versuchsdokumentation Ping Gast zu Host, vier Screenshots
- Deutung der Erreichbarkeit unter 10.0.2.2 ergänzt
```

Eine einzeilige Änderung darf den Rumpf auslassen. Eine Änderung über mehrere Kapitel braucht ihn.

## Präfixe

`P1` bis `P6` für das jeweilige Protokoll. `Vorlage` für Änderungen an der Dokumentklasse, weil diese alle Protokolle betreffen. `Setup` für Projektinfrastruktur.

## PDF-Stände

Das erzeugte PDF wird mitversioniert, damit der Abgabestand nachvollziehbar bleibt. Ein Commit, der nur das PDF neu baut, ohne inhaltliche Änderung, wird nicht angelegt.
