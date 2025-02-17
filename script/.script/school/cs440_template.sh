#!/bin/bash

# usage 
if [[ $# -ne 2 ]]; then
  echo "usage: cs440_template [hw?].tex [questions]"
  return
fi

HW_FILE="$1".tex
NUM_QUESTIONS=$2
touch "$HW_FILE"
cat > "$HW_FILE" << EOF
\documentclass[12pt]{exam}
\usepackage[utf8]{inputenc}

\usepackage[margin=1in]{geometry}
\usepackage{amsmath,amssymb}
\usepackage{mathtools}
\usepackage{multicol}
\usepackage{listings}
\usepackage{enumerate}
\usepackage{blindtext}
\usepackage{scrextend}
\usepackage{graphicx}
\usepackage{comment}
\usepackage{float}

\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=blue,
    pdftitle={Overleaf Example},
    pdfpagemode=FullScreen,
    }

\def\ojoin{\setbox0=\hbox{$\bowtie$}%
  \rule[-.02ex]{.25em}{.4pt}\llap{\rule[\ht0]{.25em}{.4pt}}}
\def\leftouterjoin{\mathbin{\ojoin\mkern-5.8mu\bowtie}}
\def\rightouterjoin{\mathbin{\bowtie\mkern-5.8mu\ojoin}}
\def\fullouterjoin{\mathbin{\ojoin\mkern-5.8mu\bowtie\mkern-5.8mu\ojoin}}


\renewcommand{\choiceshook}{%
    \setlength{\leftmargin}{15pt}%
}
\title{CS 440 - Homework , Part 2 }
\author{[HW TOPIC]}
\date{Spring 2025 - Taylor Huang}

\newcommand{\vg}{\textsf{video\_games}}
\newcommand{\region}{\textsf{region}}
\newcommand{\gs}{\textsf{games\_sales}}
\newcommand{\developer}{\textsf{developer}}
\newcommand{\platform}{\textsf{platform}}
\newcommand{\result}{\textsf{result}}

\begin{document}

\maketitle

\begin{questions}

EOF

for ((i = 1; i <= "$NUM_QUESTIONS"; i++)); do
  touch "question$i.tex"
  cat >> "$HW_FILE" << EOF
%.........  Q1$i  ..... %	
\question (? points): \\ 
\input{question$i.tex}

   %.........  Write your answer   ..... %	

EOF
done

cat >> "$HW_FILE" << EOF
\end{questions}
\end{document}
EOF
