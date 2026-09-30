---
name: bsh-schreibstil
description: Schreibstil der Protokolltexte - wissenschaftlich und gehoben, aber auf Adams Verständnisniveau, weil er die Protokolle als Prüfungsunterlage braucht. TRIGGER vor jedem Fließtext, der in eine Protokolldatei geschrieben wird. SKIP für Antworten im Chat, dort gilt die globale CLAUDE.md.
user-invocable: true
---

# Schreibstil im Protokoll

Das Protokoll soll Gaisberger überzeugen und ist zugleich Adams Lern- und Prüfungsunterlage. Wo beides kollidiert, gewinnt die Verständlichkeit: Ein Satz, den Adam in der Prüfung nicht erklären kann, nützt ihm nichts.

## Sprache und Begriffe

Jeder Fachbegriff wird bei seiner ersten Nennung im Protokoll im Fließtext definiert, nicht in einer Fußnote, und danach nicht erneut; wiederfinden lässt er sich über das Glossar.

Deutsche Fachsprache, wie sie an einer HTL gesprochen wird. Wo Angabe oder Werkzeug den englischen Begriff verwenden, bleibt er englisch, etwa Drag and Drop oder Guest Additions, sofern die Festlegungen nichts anderes bestimmen. Keine englische Übersetzung in Klammern, außer bei einem Begriff, den man nur unter dem englischen Namen in Handbuch oder Oberfläche wiederfindet, und dann einmal.

Festgelegt über alle Protokolle, außer in Angabentext und Zitaten: Wirtssystem, Wirtsbetriebssystem und Gast statt Host und Guest, Snapshot statt Speicherabbild, Shared Folder statt gemeinsamer Ordner, Aktualisierung statt Update, Prozessorstrang für thread. Zahlen mit Einheit als Ziffer mit schmalem Abstand und Einheitenzeichen, auch im Fließtext: `8\,GB`, `100\,\%`. Eine neue Festlegung kommt in diese Liste, bevor der Begriff ein zweites Mal verwendet wird.

Abkürzungen bei Erstnennung ausgeschrieben, Kurzform in Klammern: virtuelle Maschine (VM).

## Satz und Absatz

Vollständige Sätze, Absätze mit erkennbarem Gedankengang. Eine Aufzählung nur, wo tatsächlich eine Liste vorliegt, etwa die Funktionen der Guest Additions.

Aktiv vor Passiv: "der Hypervisor weist zu", nicht "es wird konfiguriert". Kausalketten ausschreiben: nicht "NAT verhindert eingehende Verbindungen", sondern warum.

Satzanfänge und Satzbau wechseln. Ein Absatz beginnt mit dem Gedanken, nicht mit seiner Ankündigung.

## Zu vermeiden

Füllsätze wie "Virtualisierung ist ein wichtiges Thema in der modernen IT". Marketingsprache aus Herstellerquellen. Analogien; die Angabe nennt den Hypervisor einen Magier, das Protokoll nicht.

Erkennbare KI-Muster: der Gedankenstrich als Häufungsfigur, die dreiteilige Aufzählung als Reflex, "es ist wichtig zu beachten", "zusammenfassend lässt sich sagen", "im Wesentlichen".

Quellenerzählung im Fließtext: "laut Handbuch", "das Handbuch hält fest". Die Zuordnung leistet der Quellenblock. Eine Quelle steht im Text nur, wo die Zuschreibung selbst die Aussage ist, etwa die Einteilung nach Goldberg. Auch was eine Quelle nicht sagt, wird nicht erzählt ("die Handbuchstelle nennt X, sagt aber nicht Y"); der eigene Schluss steht als Ableitung da.

Versuchschronik statt Befund. Uhrzeiten, Kennungen wie UUIDs und Zustandsnamen aus Protokolldateien stehen nur, wo sie die Aussage tragen. Dateien heißen nach ihrer Rolle, etwa "Differenzabbild ab Vor-der-Installation", nicht nach ihrer Kennung.

Wiederholung. Innerhalb einer Aufgabe steht jeder Wert und jede Aussage an einer Stelle: Beobachtung, Deutung und Bildunterschrift wiederholen nicht, was Tabelle, Listing, Kernsatz oder Theorieabsatz schon sagen; ein Nebensatz genügt als Rückbezug.

Länge um der Länge willen. Die Angabe warnt vor Text, der vom Wesentlichen ablenkt, und der Fragenpool der Theorieprüfung entsteht aus dem Protokolltext. Eine Antwort ist fertig, wenn die Frage beantwortet und begründet ist. Was darüber hinausgeht, bleibt nur, wenn es belegt ist und selbst als Prüfungsfrage taugt.

## Prüfungstauglichkeit

Werte, Befehle und Schrittfolgen stehen in Listings und Tabellen, wo sie beim Durchblättern auffindbar sind.

Der Kernsatz einer Aufgabe steht vorn im Absatz, vollständig und ohne Rückverweis, sodass er allein eine Prüfungsfrage beantwortet. So löst das Protokoll die Forderung der Angabe ein, Prüfungsrelevantes hervorzuheben.

Der Fließtext einer Aufgabe verweist auf keine andere Aufgabe und kein anderes Kapitel. Ein Sachverhalt aus einer anderen Aufgabe steht knapp noch einmal da, soweit Kernsatz oder Deutung ihn brauchen. Verweise auf Tabellen und Abbildungen der eigenen Aufgabe sind erlaubt, ebenso die Rückverweise in Glossar und Abkürzungsverzeichnis.

Ein bündelnder Absatz am Kapitelende nur, wo mehrere Fäden zusammenlaufen.

## Kürzungsdurchgang

Nach dem ersten Entwurf wird die gerenderte Aufgabe Satz für Satz gelesen. Gestrichen wird jeder Satz, der nichts Neues trägt oder den Ablauf erzählt, statt den Befund zu nennen; ein Satz mit zwei Aussagen, von denen eine schon dasteht, wird auf die andere gekürzt. Die Prüffrage je Satz: Welche Prüfungsfrage beantwortet er, oder welche Deutung stützt sich auf ihn? Ohne Antwort fällt er, auch wenn er belegt ist. Bei einer Überarbeitung nennt die Meldung an Adam den Umfang von Fließtext und Quellenblock vorher und nachher.
