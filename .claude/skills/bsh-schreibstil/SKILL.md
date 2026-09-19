---
name: bsh-schreibstil
description: Schreibstil der Protokolltexte — wissenschaftlich und gehoben, aber auf Adams Verständnisniveau, weil er die Protokolle als Prüfungsunterlage braucht. TRIGGER vor jedem Fließtext, der in eine Protokolldatei geschrieben wird. SKIP für Antworten im Chat, dort gilt die globale CLAUDE.md.
user-invocable: true
---

# Schreibstil im Protokoll

Achtung: Dieser Skill gilt für den Protokolltext, nicht für Chatantworten. Im Chat gilt weiterhin `~/.claude/CLAUDE.md` mit kurzen, knappen Antworten. Im Protokoll gilt das Gegenteil: ausformuliert, zusammenhängend, erklärend.

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

## Prüfungstauglichkeit

Was in der praktischen Prüfung gebraucht wird, muss auffindbar sein. Konkrete Werte, Befehle und Schrittfolgen gehören in Listings und Tabellen, nicht in den Fließtext vergraben.

Nach jedem größeren Kapitel darf ein kurzer Absatz stehen, der das Prüfungsrelevante bündelt. Die Angabe verlangt ausdrücklich, prüfungsrelevante Aspekte klar hervorzuheben.
