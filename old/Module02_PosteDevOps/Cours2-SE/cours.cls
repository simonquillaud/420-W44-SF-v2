\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours}[2017/02/02 classe de presentation de cours]
\documentclass{beamer}
%\usetheme{CambridgeUS}
%\usetheme{Goettingen}
\usetheme{Marburg}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{wrapfig}
\RequirePackage{hyperref}
\RequirePackage{listings}
\RequirePackage{color}
\RequirePackage{array,multirow,makecell}

\setcellgapes{1pt}
\makegapedcells
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash }b{#1}}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash }b{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash }b{#1}}
