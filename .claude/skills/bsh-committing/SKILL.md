---
name: bsh-committing
description: Commit-Konvention für das BSH-Protokollprojekt - deutsch, Abschnittsbezug im Betreff, Aufzählung im Rumpf, keine Co-Author-Zeilen, nie pushen. TRIGGER wenn Adam committen sagt oder um eine Commit-Nachricht bittet. SKIP für push, branch, rebase und das Lesen der Historie.
user-invocable: true
---

# Committen

Committet wird nur fertige Arbeit und nur auf Aufforderung. Nie pushen, das macht Adam.

## Regeln

Deutsch. Die Betreffzeile ist kurz und beginnt mit dem Präfix, bei einem Protokoll samt Abschnitt; sie benennt die Änderung, nicht die Datei. Rumpf als Aufzählung, ein Punkt je inhaltliche Änderung. Keine Co-Author-Zeilen, kein `Generated with Claude Code`. Vor jedem Commit `git status` prüfen und sehen, was tatsächlich eingeht; keine Hilfs- und Zwischendateien.

## Format

```
P1 Netzwerkkonfiguration: NAT-Kapitel ausgearbeitet

- Theorieteil zu Adressumsetzung mit Handbuchbeleg Kap. 9
- Versuchsdokumentation Ping Gast zu Host, vier Screenshots
- Deutung der Erreichbarkeit unter 10.0.2.2 ergänzt
```

Eine einzeilige Änderung darf den Rumpf auslassen. Eine Änderung über mehrere Kapitel braucht ihn.

## Präfixe

`P1` bis `P6` für das jeweilige Protokoll, `Vorlage` für `vorlage/`, `Setup` für Skills, `CLAUDE.md`, `README.md`, `intern/` und übrige Projektinfrastruktur.

## PDF-Stände

Das erzeugte PDF wird mitversioniert, damit der Abgabestand nachvollziehbar bleibt. Ein Commit, der nur das PDF neu baut, ohne inhaltliche Änderung, wird nicht angelegt.
