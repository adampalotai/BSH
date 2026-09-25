# Übergabe Labor → zu Hause (25.09.2026)

Bericht der Claude-Sitzung am Laborrechner für die Claude-Sitzung zu Hause. Diese Datei ist ein Einwegkanal: Inhalt übernehmen, dann löschen und den Löschvorgang committen (Kein Bloat, siehe `CLAUDE.md`).

## 1. Wichtigste Neuigkeit: Versuchsumgebung ändert sich

Adam bekommt von der Schule **zwei VirtualBox-VMs: Windows 11 und Linux Mint**. Er richtet sie zu Hause ein, und **die Versuche werden zu Hause abgeschlossen**.

Folgen, mit Adam zu klären und dann einzuarbeiten:

- `CLAUDE.md`, Abschnitt *Umgebung*, stimmt nicht mehr. Dort stehen Windows Server 2019 statt Windows 11 und die Regel „VirtualBox-spezifische Versuche gehören ins Labor“.
- Zu Hause läuft bisher VMware. Für die neuen VMs braucht es dort VirtualBox. Ob VirtualBox und VMware parallel installiert werden oder VMware weichen muss, ist offen.
- Offen ist auch, in welcher Form die VMs übergeben werden (OVA-Export, Datenträger o. ä.) und wann.
- Prüfen, ob die Angabe von P1 ausdrücklich Windows Server 2019 verlangt. Falls ja, muss Adam klären, ob Windows 11 als Ersatz zulässig ist.

## 2. Synchronisationsstand

| Ort | Stand | Anmerkung |
|---|---|---|
| Laborrechner | `dd5a6b5` + dieser Übergabe-Commit | vor diesem Commit sauber |
| GitHub `origin/main` | zuletzt bekannt `dd5a6b5` | frischer `git fetch` aus der Claude-Shell nicht möglich, keine Zugangsdaten |
| Windows zu Hause | unbekannt | zuerst `git status` und `git pull` |

Nicht über Git synchronisiert, also am Laborrechner **nicht vorhanden**:

- `intern/` (`ARBEITSSTAND.md`, `BESTEHENDE_AUFGABEN.md`), weil in `.gitignore`
- `angabe/`, weil in `.gitignore`
- die Claude-Memory. Sie liegt benutzerlokal, am Laborrechner ist sie leer.

Die Laborsitzung hat also ohne Arbeitsstand, Aufgabenliste und Memory gearbeitet. Verhaltensregeln aus der Memory zu Hause galten hier nicht.

## 3. Was der Laborrechner kann (erhoben am 25.09.2026)

- Linux Mint 22.3, Intel Core i3-6100 (2 Kerne, 4 Threads, VT-x vorhanden), 15 GiB RAM
- VirtualBox 7.2.18 installiert, Kernelmodule geladen, Benutzer in Gruppe `vboxusers`. Im Benutzerprofil sind keine VMs registriert.
- Wireshark (Benutzer in Gruppe `wireshark`) und nmap installiert
- keine Adminrechte (`sudo` verlangt Passwort)
- Netz: `eno1` mit 10.4.109.1/16 sowie öffentliches IPv6
- Das Home-Verzeichnis liegt auf der lokalen Platte (`/dev/sda1`), nicht auf einem Netzlaufwerk. Die Einrichtung hängt daher an **diesem** Rechner und geht bei Platzwechsel oder Neuaufsetzen verloren.

## 4. Einrichtung am Laborrechner (erledigt)

- **TeX Live 2026** statt MiKTeX, weil MiKTeX unter Linux Root für die Installation braucht. Installiert in `~/texlive/2026` mit scheme-small, `latexmk`, `collection-latexextra` und `collection-fontsrecommended`. Automatisches Nachladen fehlender Pakete wie bei MiKTeX gibt es hier nicht; Abhilfe ist `tlmgr install <paket>`.
- **PATH:** Eintrag in `~/.profile`; wirksam nach einer Neuanmeldung.
- **VSCodium** (nicht VS Code) mit nachinstalliertem **LaTeX Workshop**. Die bereits vorhandene Erweiterung `mathematic.vscode-latex` kann sich damit überschneiden.
- **Probebau P1:** fehlerfrei, keine Warnungen. `.vscode/settings.json` funktioniert unverändert; das `;` in `TEXINPUTS` wird unter Linux ebenfalls als Trenner akzeptiert.
- **Git:** repo-lokal `user.name`/`user.email` gesetzt, passend zu den bisherigen Commits. Pushen geht nur über Adams Anmeldung in VSCodium, nicht aus der Claude-Shell.

## 5. Aufgaben für die Sitzung zu Hause

1. `git pull`, prüfen, ob sich Stände überschneiden.
2. Punkt 1 mit Adam klären und `CLAUDE.md` *Umgebung* anpassen.
3. Relevantes in `intern/ARBEITSSTAND.md` und `intern/BESTEHENDE_AUFGABEN.md` übernehmen, etwa VirtualBox zu Hause einrichten, VM-Übergabe und die Frage Windows 11 statt Server 2019.
4. Klären, ob für Laborsitzungen künftig ein versionierter Minimalstand nötig ist, weil `intern/` und die Memory dort fehlen. Falls nein, reicht diese einmalige Übergabe.
5. Diese Datei löschen und committen.
