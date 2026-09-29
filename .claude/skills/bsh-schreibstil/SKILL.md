---
name: bsh-schreibstil
description: Schreibstil der Protokolltexte - wissenschaftlich und gehoben, aber auf Adams Verständnisniveau, weil er die Protokolle als Prüfungsunterlage braucht. TRIGGER vor jedem Fließtext, der in eine Protokolldatei geschrieben wird. SKIP für Antworten im Chat, dort gilt die globale CLAUDE.md.
user-invocable: true
---

# Schreibstil im Protokoll

Das Protokoll soll Gaisberger überzeugen und ist zugleich Adams Lern- und Prüfungsunterlage. Wo beides kollidiert, gewinnt die Verständlichkeit: Ein Satz, den Adam in der Prüfung nicht erklären kann, nützt ihm nichts.

## Sprache und Begriffe

Jeder Fachbegriff wird bei Erstnennung im Fließtext definiert, vor seiner Verwendung, nicht in einer Fußnote.

Deutsche Fachsprache, wie sie an einer HTL gesprochen wird. Wo Angabe oder Werkzeug den englischen Begriff verwenden, bleibt er englisch: Shared Folder, Drag and Drop, Guest Additions, Snapshot. Keine englische Übersetzung in Klammern, außer bei einem Begriff, den man nur unter dem englischen Namen in Handbuch oder Oberfläche wiederfindet, und dann einmal.

Festgelegt über alle Protokolle: Wirtssystem, Wirtsbetriebssystem und Gast statt Host und Guest, außer im wörtlichen Angabentext. Snapshot statt Speicherabbild, Shared Folder statt gemeinsamer Ordner, Aktualisierung statt Update, Prozessorstrang für thread. Zahlen mit Einheit als Ziffer mit schmalem Abstand und Einheitenzeichen, auch im Fließtext: `8\,GB`, `100\,\%`. Eine neue Festlegung kommt in diese Liste, bevor der Begriff ein zweites Mal verwendet wird.

Abkürzungen bei Erstnennung ausgeschrieben, Kurzform in Klammern: virtuelle Maschine (VM).

## Satz und Absatz

Vollständige Sätze, Absätze mit erkennbarem Gedankengang. Eine Aufzählung nur, wo tatsächlich eine Liste vorliegt, etwa die Funktionen der Guest Additions.

Aktiv vor Passiv: "der Hypervisor weist zu", nicht "es wird konfiguriert". Kausalketten ausschreiben: nicht "NAT verhindert eingehende Verbindungen", sondern warum.

Satzanfänge und Satzbau wechseln. Ein Absatz beginnt mit dem Gedanken, nicht mit seiner Ankündigung.

## Zu vermeiden

Füllsätze wie "Virtualisierung ist ein wichtiges Thema in der modernen IT". Marketingsprache aus Herstellerquellen. Analogien; die Angabe nennt den Hypervisor einen Magier, das Protokoll nicht. Behauptungen ohne Beleg nach `bsh-research`.

Erkennbare KI-Muster: der Gedankenstrich als Häufungsfigur, die dreiteilige Aufzählung als Reflex, "es ist wichtig zu beachten", "zusammenfassend lässt sich sagen", "im Wesentlichen".

Quellenerzählung im Fließtext: "laut Handbuch", "das Handbuch hält fest". Die Zuordnung leistet der Quellenblock. Eine Quelle steht im Text nur, wo die Zuschreibung selbst die Aussage ist, etwa die Einteilung nach Goldberg.

Länge um der Länge willen. Die Angabe warnt vor Text, der vom Wesentlichen ablenkt, und der Fragenpool der Theorieprüfung entsteht aus dem Protokolltext. Eine Antwort ist fertig, wenn die Frage beantwortet und begründet ist. Was darüber hinausgeht, bleibt nur, wenn es belegt ist und selbst als Prüfungsfrage taugt.

## Prüfungstauglichkeit

Werte, Befehle und Schrittfolgen stehen in Listings und Tabellen, wo sie beim Durchblättern auffindbar sind.

Der Kernsatz einer Aufgabe steht vorn im Absatz, vollständig und ohne Rückverweis, sodass er allein eine Prüfungsfrage beantwortet. So löst das Protokoll die Forderung der Angabe ein, Prüfungsrelevantes hervorzuheben.

Der Fließtext einer Aufgabe verweist auf keine andere Aufgabe und kein anderes Kapitel. Ein Sachverhalt, den der Kernsatz braucht, steht knapp noch einmal da. Ein Fachbegriff wird nur bei seiner ersten Nennung im Protokoll definiert und ist danach über das Glossar auffindbar. Verweise auf Tabellen und Abbildungen der eigenen Aufgabe sind erlaubt, ebenso die Rückverweise in Glossar und Abkürzungsverzeichnis.

Ein bündelnder Absatz am Kapitelende nur, wo mehrere Fäden zusammenlaufen.
