if [[ $# -ne 2 ]]; then
  echo "stat355 which_hw num_of_problems"
  exit 1
fi

mydate=$(date +"%b %d, %Y")

touch "main.tex"
cat > "main.tex" << EOF
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

\title{Stat355 - Homework $1 }
\author{Taylor Huang}
\date{ $mydate }

\begin{document}

\maketitle

\input{problem1.tex}
\newpage
EOF

for ((i = 1; i < $2; i++)); do
  echo "\include{problem$(($i+1)).tex}" >> "main.tex"
done
echo "\end{document}" >> "main.tex"

for ((i = 0; i < $2; i++)); do
  touch "problem$(($i+1)).tex"
  echo '\\noindent' > "problem$(($i+1)).tex"
  echo "\subsection*{Question $(($i+1)).}" >> "problem$(($i+1)).tex"
done
