---
name: bsh-schreibstil
description: Schreibstil der Protokolltexte - wissenschaftlich und gehoben, aber auf Adams Verständnisniveau, weil er die Protokolle als Prüfungsunterlage braucht. TRIGGER vor jedem Fließtext, der in eine Protokolldatei geschrieben wird. SKIP für Antworten im Chat, dort gilt die globale CLAUDE.md.
user-invocable: true
---

# Schreibstil im Protokoll

Für Protokolltext, nicht für Chatantworten: dort gilt `~/.claude/CLAUDE.md` und damit das Gegenteil dieser Regeln.

## Der Zielkonflikt

Das Protokoll muss zwei Dinge gleichzeitig sein: ein wissenschaftlich anmutender Text, der Gaisberger positiv überrascht, und eine Unterlage, mit der Adam in der praktischen Prüfung arbeitet und aus der er lernt. Wo diese Ziele kollidieren, gewinnt die Verständlichkeit. Ein Satz, den Adam in der Prüfung nicht erklären kann, nützt ihm nichts, egal wie gut er klingt.

## Was das konkret heißt

Jeder Fachbegriff wird bei Erstnennung im Fließtext definiert, nicht in einer Fußnote. Die Definition steht vor der Verwendung, nicht danach.

Deutsche Fachsprache mit dem englischen Originalbegriff in Klammern bei Erstnennung: Speicherabbild (snapshot), Wirtsystem (host system). Danach durchgängig eine Variante, meist die im Werkzeug verwendete.

Abkürzungen bei Erstnennung ausgeschrieben, Kurzform in Klammern: virtuelle Maschine (VM), Network Address Translation (NAT).

Vollständige Sätze, Absätze mit erkennbarem Gedankengang. Keine Stichwortlisten als Ersatz für Erklärung. Eine Aufzählung nur, wo tatsächlich eine Liste vorliegt, etwa sechs Aufgaben der Guest Additions.

Aktiv vor Passiv, wo es geht. Nicht "es wird konfiguriert", sondern "der Hypervisor weist zu".

Kausalketten ausschreiben. Nicht "NAT verhindert eingehende Verbindungen", sondern warum: weil der Gast hinter einer Adressumsetzung liegt und von außen keine Route zu ihm existiert, solange keine Portweiterleitung eingerichtet ist.

## Was zu vermeiden ist

Keine Füllsätze, die nichts erklären. "Virtualisierung ist ein wichtiges Thema in der modernen IT" sagt nichts und kostet Platz und Glaubwürdigkeit.

Keine Marketingsprache aus Herstellerquellen. Oracle schreibt, dass VirtualBox leistungsstark sei; das ist keine Aussage, die ins Protokoll gehört.

Keine Analogien, die nicht tragen. Die Angabe selbst nennt den Hypervisor einen Magier; im Protokolltext wird sachlich formuliert.

Keine Behauptung ohne Beleg. Siehe `bsh-research`.

Keine Länge um der Länge willen. Die Angabe warnt ausdrücklich vor zu viel Text, der vom Wesentlichen ablenkt.

Keine erkennbaren KI-Textmuster. Das Protokoll wird als KI-Mitarbeit gekennzeichnet, soll aber nicht danach klingen. Kein Gedankenstrich als Häufungsfigur ("Virtualisierung ist effizient - sie spart Hardware, Energie und Platz"), Kommas oder ein neuer Satz leisten das genauso. Keine dreiteilige Aufzählung als Stilreflex, nur wo tatsächlich drei Dinge aufzuzählen sind. Kein "es ist wichtig zu beachten", "zusammenfassend lässt sich sagen", "im Wesentlichen". Ein Absatz beginnt mit dem Gedanken, nicht mit einer Ankündigung des Gedankens.

## Prüfungstauglichkeit

Konkrete Werte, Befehle und Schrittfolgen gehören in Listings und Tabellen, wo sie beim Durchblättern auffindbar sind, nicht in den Fließtext vergraben.

Die Angabe verlangt, prüfungsrelevante Aspekte klar hervorzuheben. Eingelöst wird das im Satzbau: Der Kernsatz einer Aufgabe steht vorn im Absatz, vollständig und ohne Rückverweis, sodass er für sich allein eine Prüfungsfrage beantwortet. Eine Erklärung, die über drei Kapitel verteilt ist, besteht diesen Test nicht, auch wenn sie vollständig ist.

Ein Kapitel darf mit einem bündelnden Absatz schließen, wo mehrere Fäden zusammenlaufen. Nach jedem Kapitel wird daraus eine Floskel.
