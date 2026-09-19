\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsh-protokoll}[2026/09/19 BSH-Laborprotokoll HTBLA Traun]

\LoadClass[11pt,a4paper,parskip=half]{scrreprt}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage{lmodern}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage[a4paper,left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{listings}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{csquotes}
\RequirePackage{enumitem}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable}
\RequirePackage[hidelinks]{hyperref}

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
  numberstyle=\tiny\color{rahmengrau},
  numbersep=8pt,
  xleftmargin=16pt,
  framexleftmargin=16pt,
  captionpos=b,
}
\lstset{style=bsh}
\renewcommand{\lstlistingname}{Listing}
\renewcommand{\lstlistlistingname}{Listingverzeichnis}

% Inline-Befehl: \cmd{ipconfig /all}
\newcommand{\cmd}[1]{\texttt{\small #1}}

% KI-Kennzeichnung, von der Angabe je Antwort verlangt
\newcommand{\kiquelle}[1]{Text erarbeitet mit Claude #1 (Anthropic)}
\newcommand{\kiquellekurz}[1]{Claude #1}

% ── Aufgabenblock: rahmt die Angabenfrage wie in der Vorlage ──────────────
\newtcolorbox{aufgabe}[1][]{
  breakable,
  colback=fuellgrau,
  colframe=rahmengrau,
  boxrule=0.4pt,
  arc=0pt,
  left=6pt,right=6pt,top=6pt,bottom=6pt,
  fonttitle=\bfseries,
  title={#1},
  coltitle=black,
  colbacktitle=fuellgrau,
  titlerule=0pt,
  parbox=false,
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
\captionsetup{font=small,labelfont=bf,labelsep=period}
\newcommand{\bild}[3]{%
  \begin{figure}[H]
    \centering
    \includegraphics[width=#2\textwidth]{#1}
    \caption{#3}
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
\newcommand{\verzeichnisse}{%
  \tableofcontents
  \listoffigures
  \cleardoublepage
}
