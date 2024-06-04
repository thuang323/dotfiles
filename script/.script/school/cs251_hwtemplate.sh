touch main.tex
cat > main.tex << EOF
\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{graphicx}
\usepackage{enumerate}
\usepackage{enumitem}
\usepackage{amssymb}
\usepackage{algorithm}
\usepackage{algpseudocode}

\title{CS251 - homework }
\author{Taylor Huang}
\date{}

\begin{document}

\maketitle

\input{resources.tex}
\newpage
\include{problem1.tex}
\include{problem2.tex}
\include{problem3.tex}
\include{problem4.tex}
\include{problem5.tex}


\end{document}
EOF
touch resources.tex
touch problem1.tex
touch problem2.tex
touch problem3.tex
touch problem4.tex
touch problem5.tex

cat > resources.tex << EOF
\noindent\subsection*{Resource and Collaborator Statement}
\hspace*{5mm}\textbf{Problem 1} \newline
\hspace*{10mm} 1. Resource Used: None \newline
\hspace*{10mm} 2. Collaborators: None \newline

\textbf{Problem 2} \newline
\hspace*{10mm} 1. Resource Used: None \newline
\hspace*{10mm} 2. Collaborators: None \newline

\textbf{Problem 3} \newline
\hspace*{10mm} 1. Resource Used: None \newline
\hspace*{10mm} 2. Collaborators: None \newline

\textbf{Problem 4} \newline
\hspace*{10mm} 1. Resource Used: None \newline
\hspace*{10mm} 2. Collaborators: None \newline

\textbf{Problem 5} \newline
\hspace*{10mm} 1. Resource Used: None \newline
\hspace*{10mm} 2. Collaborators: None \newline
EOF
