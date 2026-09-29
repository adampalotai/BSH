\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsh-protokoll}[2026/09/19 BSH-Laborprotokoll HTBLA Traun]

\LoadClass[11pt,a4paper,parskip=half]{scrreprt}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage{lmodern}
\renewcommand{\familydefault}{\sfdefault}
% Angabentexte enthalten unteilbare Bindestrichwoerter in schmalen Boxen
\setlength{\emergencystretch}{1em}

% \paragraph darf nicht allein am Seitenfuss stehen; betrifft vor allem
% die Quellenbloecke, deren Liste sonst auf der Folgeseite beginnt
\RequirePackage{needspace}
\let\bsh@origparagraph\paragraph
\renewcommand{\paragraph}{\needspace{3\baselineskip}\bsh@origparagraph}
\RequirePackage[a4paper,left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{listings}
\RequirePackage{pmboxdraw}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{csquotes}
\RequirePackage{enumitem}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable}
\RequirePackage{tikz}
\usetikzlibrary{positioning,fit,backgrounds,arrows.meta,calc}
\RequirePackage[hidelinks]{hyperref}
% bricht lange URLs im Quellenblock statt über den Rand zu laufen
\RequirePackage{xurl}

% ── Farben ────────────────────────────────────────────────────────────────
\definecolor{htlgruen}{RGB}{140,190,70}
\definecolor{akzent}{RGB}{31,73,125}
\definecolor{rahmengrau}{RGB}{128,128,128}
\definecolor{fuellgrau}{RGB}{242,242,242}
\definecolor{codehintergrund}{RGB}{248,248,248}

% ── Metadaten ─────────────────────────────────────────────────────────────
\newcommand{\protokollthema}[1]{\def\@protokollthema{#1}}
\newcommand{\verfasser}[1]{\def\@verfasser{#1}}
\newcommand{\klasse}[1]{\def\@klasse{#1}}
\newcommand{\schuljahr}[1]{\def\@schuljahr{#1}}
\newcommand{\betreuer}[1]{\def\@betreuer{#1}}
\protokollthema{Thema}
\verfasser{Adam Ferenc Palotai}
\klasse{3AHIT}
\schuljahr{2026/2027}
\betreuer{Prof. Gaisberger}

% ── Kopf- und Fußzeile ────────────────────────────────────────────────────
\pagestyle{scrheadings}
\clearpairofpagestyles
\automark[chapter]{chapter}
\ihead{\small\color{rahmengrau}\@protokollthema}
\ohead{\small\color{rahmengrau}\leftmark}
\ifoot{\small\color{rahmengrau}\@verfasser}
\ofoot{\small\color{rahmengrau}\thepage}
\setkomafont{pageheadfoot}{\normalfont\small}
\KOMAoptions{headsepline=0.4pt,footsepline=0.4pt}

% ── Überschriften: genau drei Textgrößen im Fließtext ─────────────────────
\addtokomafont{chapter}{\color{akzent}}
\addtokomafont{section}{\color{akzent}}
\addtokomafont{subsection}{\color{akzent}}
\RedeclareSectionCommand[beforeskip=-1\baselineskip,afterskip=0.8\baselineskip]{chapter}

% ── Codedarstellung ───────────────────────────────────────────────────────
\lstdefinestyle{bsh}{
  basicstyle=\ttfamily\footnotesize,
  backgroundcolor=\color{codehintergrund},
  frame=single,
  rulecolor=\color{rahmengrau},
  breaklines=true,
  breakatwhitespace=false,
  showstringspaces=false,
  keywordstyle=\color{akzent}\bfseries,
  commentstyle=\color{rahmengrau}\itshape,
  numbers=left,
  numberstyle=\footnotesize\color{rahmengrau},
  numbersep=8pt,
  xleftmargin=16pt,
  framexleftmargin=16pt,
  captionpos=b,
  % Baumzeichen aus lsblk und tree, Umlaute aus deutschsprachigen Ausgaben
  literate={├}{{\textSFviii}}1 {└}{{\textSFii}}1 {─}{{\textSFx}}1
    {ä}{{\"a}}1 {ö}{{\"o}}1 {ü}{{\"u}}1 {Ä}{{\"A}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1 {ß}{{\ss}}1,
}
\lstset{style=bsh}
\renewcommand{\lstlistingname}{Listing}
\renewcommand{\lstlistlistingname}{Listingverzeichnis}

% Inline-Befehl: \cmd{ipconfig /all}
\newcommand{\cmd}[1]{\texttt{\small #1}}
% URLs und \nolinkurl in derselben Größe wie \cmd
\renewcommand{\UrlFont}{\ttfamily\small}
% lmtt setzt -- sonst als Halbgeviertstrich, aus --resize wird -resize
\RequirePackage[protrusion=false,expansion=false]{microtype}
\DisableLigatures[-]{encoding=T1,family=tt*}

% Liste im Quellenblock: sperrt den Umbruch am Listenende, sonst steht die
% KI-Kennzeichnung allein oben auf der Folgeseite
\SetEnumitemKey{quellen}{nosep,before=\@endparpenalty\@M}

% KI-Kennzeichnung, von der Angabe je Antwort verlangt.
% Steht bewusst ausserhalb der Quellenliste: die Textherkunft ist kein Beleg.
% \kiquelle[20.\,09.\,2026]{Opus 5.5} -- Datum wie im Beispielformat der Angabe
% \noindent vor \color, sonst entsteht vor dem Absatz ein Umbruchpunkt
\newcommand{\kiquelle}[2][]{%
  \par\nopagebreak\smallskip
  \noindent{\footnotesize\color{rahmengrau}%
   Textfassung erarbeitet mit Claude #2 (Anthropic)%
   \ifx\\#1\\\else, Stand #1\fi; die Sachaussagen sind
   den oben genannten Quellen entnommen.}%
  \par
}

% ── Aufgabenblock: rahmt die Angabenfrage wie in der Vorlage ──────────────
% Der Titel wird zugleich Abschnittsueberschrift, sonst steht ein
% zehnseitiges Kapitel ohne einen einzigen Eintrag im Inhaltsverzeichnis.
\RequirePackage{environ}
\RequirePackage{xstring}
\newtcolorbox{bsh@aufgabenbox}{
  breakable,
  colback=fuellgrau,
  colframe=rahmengrau,
  boxrule=0.4pt,
  arc=0pt,
  before skip=\baselineskip, after skip=0.6\baselineskip,
  left=6pt,right=6pt,top=6pt,bottom=6pt,
  parbox=false,
}
% Manche Angaben stellen die Frage schon im Titel und liefern keinen
% eigenen Beschreibungstext (z.B. Aufg. 2.8); dann bleibt die Box leer
% und wird deshalb ausgelassen, statt einen leeren Rahmen zu zeigen.
% \expandafter noetig: \IfBlankTF{\BODY} sieht sonst nur das Makro \BODY
% selbst (immer "nicht leer"), nicht dessen Inhalt.
\NewEnviron{aufgabe}[1][]{%
  \def\bsh@aufgabentitel{#1}%
  \ifx\bsh@aufgabentitel\@empty\else
    \section{#1}%
    % \label steht nach \end{aufgabe}, auch wenn die Box entfaellt
    \global\let\@currentlabel\@currentlabel
    \global\let\@currentHref\@currentHref
  \fi
  \expandafter\IfBlankTF\expandafter{\BODY}{}{%
    \begin{bsh@aufgabenbox}
    \BODY
    \end{bsh@aufgabenbox}%
  }%
}

% ── Messblock: Aufbau, Durchführung, Beobachtung, Deutung ─────────────────
\newtcolorbox{messung}[1][]{
  breakable,
  colback=white,
  colframe=htlgruen,
  boxrule=0.8pt,
  arc=0pt,
  left=6pt,right=6pt,top=6pt,bottom=6pt,
  fonttitle=\bfseries,
  title={Versuch: #1},
  coltitle=white,
  colbacktitle=htlgruen,
}

% ── Abbildungen ───────────────────────────────────────────────────────────
\captionsetup{font=small,labelfont=bf,labelsep=period,figurename=Abbildung,tablename=Tabelle}
\renewcommand*{\figureformat}{\figurename~\thefigure}
\renewcommand*{\tableformat}{\tablename~\thetable}
% \bild[Kurzfassung]{04-mint-desktop}{0.8}{Beschriftung}, Label abb:04-mint-desktop
\NewDocumentCommand{\bild}{o m m m}{%
  \begin{figure}[H]
    \centering
    \includegraphics[width=#3\textwidth]{#2}
    \IfNoValueTF{#1}{\caption{#4}}{\caption[#1]{#4}}%
    \label{abb:#2}
  \end{figure}%
}

% ── Deckblatt ─────────────────────────────────────────────────────────────
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \vspace*{2cm}
    \begin{flushright}
      {\Large\bfseries BSH-Labor \@klasse\ \@schuljahr}\\[3cm]
      {\Huge\bfseries\color{akzent}\MakeUppercase{\@protokollthema}}\\[0.8cm]
      {\Large\color{rahmengrau}\@verfasser}\\[0.4cm]
      {\large\color{rahmengrau}HTBLA Traun}\\[0.2cm]
      {\large\color{rahmengrau}Betreuung: \@betreuer}
    \end{flushright}
    \vfill
    \begin{flushleft}
      \IfFileExists{logo.png}{\includegraphics[width=5cm]{logo.png}\\[1cm]}{}
      {\small\color{rahmengrau}Abgabe: \today}
    \end{flushleft}
  \end{titlepage}
}

% ── Verzeichnisse ─────────────────────────────────────────────────────────
% zweistellige Abschnittsnummern wie 10.10 sprengen die Voreinstellung
\DeclareTOCStyleEntry[numwidth=3.2em]{tocline}{section}

\newcommand{\verzeichnisse}{%
  \tableofcontents
  \listoffigures
  \cleardoublepage
}

% ── Zeichnungen ───────────────────────────────────────────────────────────
% Gemeinsame Formen für alle Schemata, damit Strichstärke und Farbe über
% sechs Protokolle hinweg gleich bleiben.
\tikzset{
  schicht/.style={
    draw=rahmengrau, line width=0.4pt, fill=fuellgrau,
    minimum height=8mm, align=center, font=\small,
    inner xsep=6pt,
  },
  schichthervor/.style={schicht, fill=akzent!12, draw=akzent},
  gast/.style={schicht, fill=htlgruen!20, draw=htlgruen!70!black},
  fluss/.style={-{Stealth[length=2mm]}, draw=akzent, line width=0.5pt},
  beschriftung/.style={font=\footnotesize\itshape, text=rahmengrau},
}

% ── Glossar ───────────────────────────────────────────────────────────────
% Begriff, Kurzdefinition, Rückverweis auf die Stelle der Einführung.
% Die Langfassung bleibt im Fließtext; hier steht nur, was zum Wiedererkennen
% reicht.
\newenvironment{glossar}{%
  \begin{description}[
    style=nextline,
    leftmargin=0.8cm,
    labelindent=0pt,
    labelsep=0.3cm,
    font=\normalfont\bfseries,
    itemsep=0.45\baselineskip,
    parsep=0pt,
  ]
}{%
  \end{description}
}

% \begriff{Snapshot} oder \begriff[kap:grundlagen]{Snapshot}
\newcommand{\begriff}[2][]{%
  \item[#2\ifx\\#1\\\else\quad{\normalfont\footnotesize\color{rahmengrau}(Kap.~\ref{#1})}\fi]%
}
