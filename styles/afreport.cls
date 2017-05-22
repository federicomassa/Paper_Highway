
%
% Author: Adriano Fagiolini
% 1st nov 2012, created
% 27 nov 2012, added options
%

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{afreport}[2012/11/01 AF Report]

% Short-circuit Macros 
\newcommand{\afdraft}[1]{#1}
\newcommand{\afonlyremaining}[1]{#1}

\DeclareOption{onlyremaining}{\renewcommand{\afonlyremaining}[1]{}}
\DeclareOption{final}{
	\renewcommand{\afdraft}[1]{} 
	\renewcommand{\afonlyremaining}[1]{#1}
}
\ProcessOptions

\LoadClass[fontsize=10pt, paper=a4]{report}

\def\afthetitle#1{\def\af@thetitle{#1}}
\def\aftheauthors#1{\def\af@theauthors{#1}}

\RequirePackage{xr} % Package for external links
\RequirePackage{sc} % Package for external citations

%
% Macros
%

\newcommand{\afspace}{\vspace{18pt}}
\newcommand{\afcomment}[1]{{\bf #1}}
\RequirePackage[usenames, dvipsnames]{xcolor}
\newcommand{\afcommentRed}[1]{{\color{Red} \bf #1}}
\newcommand{\afcommentCyan}[1]{{\color{Cyan} \bf #1}}
\newcommand{\afcommentBlue}[1]{{\color{MidnightBlue} \bf #1}}
\newcommand{\afcommentGreen}[1]{{\color{ForestGreen} \bf #1}}
\RequirePackage{pifont} 
\newcommand{\tick}{{\color{green}\ding{52}~}}  
\newcommand{\aftick}{{\afdraft{\color{LimeGreen} \huge \ding{52}~}}}
\newcommand{\afcross}{{\afdraft{\color{Red} \huge \ding{56}~}}}

%
% Title Page
%

\newcommand{\aftitlepage}
{
	\begin{center}
	{\Huge {\bf Statement of Changes and \\Answers to Comments}} 
	\\[30pt]
	{\bf Paper Title}:
	\\[10pt]
	{\em \af@thetitle}
	\\[20pt]
	{\bf Authors}: {\em \af@theauthors}
	\\[20pt]
	{\bf Date}: \today
	\end{center}
}

%
% Item
%

\newcounter{reviewercnt}
\newcounter{commentcnt}

\newcommand{\afitem}[2]{%
	\item[\afcross R\thereviewercnt-\thecommentcnt)] {\em #1}%
	\item[A\thereviewercnt-\thecommentcnt)] #2%
	\afspace%
	\addtocounter{commentcnt}{1}%
}

\newcommand{\afitemok}[2]{%
	\item[\aftick R\thereviewercnt-\thecommentcnt)] {\em \afonlyremaining{#1}}%
	\afonlyremaining{\item[A\thereviewercnt-\thecommentcnt)] #2}%
	\afonlyremaining{\afspace}%
	\addtocounter{commentcnt}{1}%
}
	
\newenvironment{afsection}[3]%
	{\newpage
	\section*{\huge {\bf #1}}
	\setcounter{reviewercnt}{#2}
	\afspace%
	\begin{description}
	\setcounter{commentcnt}{1}
	#3}
	{\end{description}
}

