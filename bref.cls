% -----------------------------
%           COGNITO
% -----------------------------
% ACADEMIC NOTES AND CHEATSHEET
% 
% Daniel Balle (c) 2016-2018
% -----------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cognito}[2016/01/10 Academic Notes and Cheatsheet Class]

% Cheatsheet option
% --------------------------
\newif\ifcheat
\cheatfalse

\DeclareOption{cheat}{\cheattrue}
\ProcessOptions\relax


% Document Base
% -------------------------
\ifcheat
	\LoadClass[a4paper, 8pt]{article}
	\RequirePackage[includehead, headsep=0.1in, margin=0.1in]{geometry}
\else
	\LoadClass[multi={minipage}, border={15pt 15pt 15pt 15pt}]{standalone} %left bottom right top
\fi


% Packages
% --------------------------
\RequirePackage{amsfonts,amssymb,enumerate}
\RequirePackage[fleqn]{amsmath}
\RequirePackage{mdframed}
\RequirePackage{afterpage} % for "\afterpage"
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{enumitem} % for more control over description
\RequirePackage{multicol}
\RequirePackage{pagecolor}
\RequirePackage{hyperref}
\RequirePackage{listings}
\RequirePackage{amsthm}

% Theorems
% --------------------------
\theoremstyle{plain}
\newtheorem*{theorem}{Theorem}
\newtheorem*{definition}{Definition}
\newtheorem*{lemma}{Lemma}
\newtheorem*{claim}{Claim}

\theoremstyle{remark}
\newtheorem*{remark}{Remark}
\newtheorem*{example}{Example}
\newtheorem*{observation}{Observation}


% Colors
% --------------------------
\colorlet{noteColor}{white}
\colorlet{questionColor}{white!90!blue}
\colorlet{answerColor}{white!90!green}
\colorlet{draftColor}{white!90!yellow}
\colorlet{codeColor}{black!5!white}
\colorlet{frameColor}{black!25!white}
\colorlet{codeFontColor}{black!85!white}


% Properties
% --------------------------
\pagenumbering{gobble} % remove page numbering
\setlength\parindent{0pt} % remove paragraph indent
\setlist[description,itemize,enumerate]{leftmargin=0.2in,labelindent=0.1in,itemsep=0pt} % custom lists
\ifcheat 
\DeclareMathSizes{8}{6}{6}{6}
\setlist[description,itemize,enumerate]{leftmargin=0.1in,labelindent=0.1in,itemsep=0pt, topsep=0pt, parsep =0pt}
\fi
\hypersetup{colorlinks, linkcolor={red!40!black}}
\newcommand{\noteref}{\setlength{\fboxsep}{1.5pt}\raisebox{0.3ex}{\color{red!40!black}\fbox{\tiny$\uparrow$} }} % for other notes
\newcommand{\solutionref}{\setlength{\fboxsep}{1.5pt}\raisebox{0.3ex}{\color{red!40!black}\fbox{\tiny$\downarrow$} }} % for other notes


% Category
% --------------------------
\newcommand{\category}[1]{
    \begin{minipage}{3.5in}
        \pdfbookmark[0]{#1}{#1}
        \pagecolor{questionColor}
        \afterpage{\nopagecolor}
        \begin{center}
            \large\bf#1
        \end{center}
    \end{minipage}
}
\ifcheat
\renewcommand{\category}[1]{
    \footnotesize
	\vspace{3pt} \hrule
	\vspace{3pt} {\normalsize \bf #1}
}
\fi

% Notes
% --------------------------
% system note : requires 3 arguments, not for user
% 1 = Title,
% 2 = Content,
% 3 = Page color
\newenvironment{systemNote}[2]{
        \begin{minipage}{4in}
        \pdfbookmark[1]{#1}{#1}
    	\pagecolor{#2}\afterpage{\nopagecolor}
    	\subsection*{#1}\label{note:#1}
	
	}{\end{minipage}}
\ifcheat
\renewenvironment{systemNote}[2]{
	\vspace{3pt} \hrule
	\vspace{3pt}
	{\bf #1} :
	}{
}
\fi


% User notes : notes, question, answer
\newenvironment{note}[1]{\begin{systemNote}{#1}{noteColor}}{\end{systemNote}}
\newenvironment{question}[1]{\begin{systemNote}{#1}{questionColor}}{\end{systemNote}}
\newenvironment{answer}[1]{\begin{systemNote}{#1}{answerColor}}{\end{systemNote}}
\newenvironment{draft}[1]{\begin{systemNote}{#1}{draftColor}}{\end{systemNote}}


% Additional Stuff
% --------------------------
% For code
\lstnewenvironment{code}{\lstset{
	%frame=single,framerule=0pt,basicstyle=\ttfamily\scriptsize,breaklines=true,keywordstyle=\color{black}\bfseries,backgroundcolor=\color{codeColor}}}{}
	frame=single,
	tabsize=4,
	basicstyle=\scriptsize\ttfamily\color{black!60!white},
	breaklines=true,
	keywordstyle=\bfseries\color{black!80!white},
	identifierstyle=\color{black!100!white},
	rulecolor=\color{frameColor}}}{}
\newcommand{\incode}[1]{{\tt\footnotesize\colorbox{codeColor}{\color{codeFontColor}#1}}}

\lstnewenvironment{largecode}{\lstset{
	%frame=single,framerule=0pt,basicstyle=\ttfamily\scriptsize,breaklines=true,keywordstyle=\color{black}\bfseries,backgroundcolor=\color{codeColor}}}{}
	frame=single,
	tabsize=4,
	basicstyle=\footnotesize\ttfamily\color{black!60!white},
	breaklines=true,
	keywordstyle=\bfseries\color{black!80!white},
	identifierstyle=\color{black!100!white},
	rulecolor=\color{frameColor}}}{}


% Tags
\newcommand{\tags}[1]{\tiny\color{frameColor}\vspace{8pt} % before hrule space
	\hrule\vspace{3pt} % between hrule and tags
	\tt #1
	\vspace{-8pt} % after tags
}

% Favorite
\newcommand{\favorite}{
	\begin{textblock*}{5cm}(13.2cm,2.8cm) % {block width} (coords) 
   		\color{black!20!yellow}$\bigstar$
	\end{textblock*}
}

% Daniel Balle (c) 2016-2018
