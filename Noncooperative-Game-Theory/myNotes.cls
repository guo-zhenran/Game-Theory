\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myNotes}[2026/07/26 Custom notes class for economics with math and biblatex]

% ---------- 默认双面 ----------
\LoadClass[11pt,twoside]{article}

% ---------- 字体（pdfLaTeX 兼容） ----------
\RequirePackage{newpxtext}
\RequirePackage{newpxmath}
\RequirePackage{courier}

% ---------- 页面布局 ----------
\RequirePackage[rmargin=3cm, lmargin=3cm, bmargin=3cm, tmargin=3cm]{geometry}

% ---------- 解决 amsthm 与 amssymb 冲突 ----------
\makeatletter
\@ifpackageloaded{amssymb}{}{%
  \let\openbox\undefined
  \let\Bbbk\undefined
}
\makeatother
\RequirePackage{amsmath, amssymb}
\RequirePackage{amsthm}

% ---------- 颜色 ----------
\RequirePackage{xcolor}
\definecolor{ecolor}{RGB}{0,0,0}
\definecolor{elegant-blue}{RGB}{98,121,142}

% ---------- 定理环境 ----------
\newtheoremstyle{namedthm}
  {3pt}{3pt}{\normalfont}{}{\bfseries}{.}{0.5em}%
  {\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}
\theoremstyle{namedthm}

\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{axiom}{Axiom}[section]
\newtheorem{assumption}{Assumption}[section]

\theoremstyle{definition}
\newtheorem{definition}{Definition}[section]
\newtheorem{conjecture}{Conjecture}[section]
\newtheorem{example}{Example}[section]

\theoremstyle{remark}
\newtheorem{remark}{Remark}
\newtheorem{note}{Note}
\newtheorem{case}{Case}

% ---------- 带名字的引用命令 ----------
\makeatletter
\newcommand{\namedlabel}[2]{%
  \label{#1}%
  \ifx\\#2\\\else
    \expandafter\gdef\csname name@#1\endcsname{#2}%
  \fi
}
\newcommand{\thmref}[1]{%
  \@ifundefined{name@#1}{\textbf{theorem~\ref{#1}}}%
  {\textbf{theorem~\ref{#1}, \csname name@#1\endcsname}}%
}
\newcommand{\propref}[1]{%
  \@ifundefined{name@#1}{\textbf{proposition~\ref{#1}}}%
  {\textbf{proposition~\ref{#1}, \csname name@#1\endcsname}}%
}
\newcommand{\lemmaref}[1]{%
  \@ifundefined{name@#1}{\textbf{lemma~\ref{#1}}}%
  {\textbf{lemma~\ref{#1}, \csname name@#1\endcsname}}%
}
\newcommand{\corref}[1]{%
  \@ifundefined{name@#1}{\textbf{corollary~\ref{#1}}}%
  {\textbf{corollary~\ref{#1}, \csname name@#1\endcsname}}%
}
\newcommand{\axiomref}[1]{%
  \@ifundefined{name@#1}{\textbf{axiom~\ref{#1}}}%
  {\textbf{axiom~\ref{#1}, \csname name@#1\endcsname}}%
}
\newcommand{\tabref}[1]{%
    \textbf{table~\ref{#1}}%
}
\newcommand{\figref}[1]{%
    \textbf{figure~\ref{#1}}%
}
\makeatother

% ---------- \partname ----------
\providecommand{\partname}{Part}

% ---------- Fancy Part 样式 ----------
\RequirePackage{titlesec}
\titleclass{\part}{top}
\titleformat{\part}[frame]
{\normalfont\color{ecolor}}
{\filright\LARGE\enspace \textbf{Part \thepart}\enspace}
{12pt}
{\LARGE\bfseries\filcenter}

% ---------- Section / Subsection ----------
\titleformat{\section}%
  {\normalfont\Large\bfseries}%
  {\thesection}{1em}{}
\titleformat{\subsection}%
  {\normalfont\large\bfseries}%
  {\thesubsection}{1em}{}

% ---------- 页眉页脚 ----------
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{fancy-note}{
  \fancyhf{}
  \fancyfoot[C]{\footnotesize\textcolor{gray}{\thepage}}
}
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[R]{\footnotesize\textcolor{gray}{\thepage}}}
\pagestyle{fancy-note}

% ---------- 目录深度 ----------
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{3}

% ---------- 常用数学命令 ----------
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\E}{\mathbb{E}}
\newcommand{\Prob}{\mathbb{P}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\diam}{\operatorname{diam}}
\newcommand{\cball}{\bar{\mathbb{B}}}
\newcommand{\oball}{\mathbb{B}}
\newcommand{\Int}[1]{{#1}^{\circ}}
\newcommand{\col}[1]{\operatorname{Col}_{#1}}
\newcommand{\row}[1]{\operatorname{Row}_{#1}}
\newcommand{\mat}[1]{\mathbf{#1}}      
\newcommand{\vct}[1]{\boldsymbol{#1}}
\newcommand{\tp}{^{\prime}}

% ---------- biblatex（手动分段）----------
\RequirePackage[
  style=authoryear,
  backend=biber,
  maxnames=10,
  minnames=10,
  backref=true,
  backrefstyle=all+,
  isbn=false,
  url=false,
  natbib=true
]{biblatex}

% 彻底隐藏语言标识和文章页码
\AtEveryBibitem{%
  \clearlist{language}%
  \clearlist{langid}%
  \clearfield{pages}%
}

% ---------- 其他宏包 ----------
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{enumitem}
\RequirePackage{subcaption}
\RequirePackage{istgame}
\RequirePackage{microtype}
% ---------- 列表设计 ----------
\setlist{
  leftmargin=4em,
  itemindent=6pt,
  labelsep=0.5em,
  itemsep=2pt,
  parsep=2pt,
  topsep=2pt
}
\setlist[itemize]{leftmargin=*, nosep, noitemsep}
\setlist[enumerate]{leftmargin=*, nosep, noitemsep, label=(\arabic*)}
% ---------- 列表设计结束 ----------
\RequirePackage{csquotes}
\RequirePackage[onehalfspacing]{setspace}
\RequirePackage{parskip}
\RequirePackage{ragged2e}
\RequirePackage{float}
\RequirePackage[bottom, hang, symbol]{footmisc}
\RequirePackage{microtype}
\RequirePackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks,
  citecolor=elegant-blue,
  filecolor=elegant-blue,
  linkcolor=elegant-blue,
  urlcolor=elegant-blue,
  frenchlinks=true,
  pdfencoding=unicode,
  pdftitle={Economics Notes},
  pdfauthor={Author},
  pdfsubject={economics},
}

% ---------- Proof 名称 ----------
\renewcommand{\proofname}{\normalfont\bfseries\color{ecolor} Proof}

% ---------- tocloft 定制 ----------
\RequirePackage{tocloft}
\setlength{\cftsecindent}{1.5em}
\renewcommand{\cftsecfont}{\bfseries}
\renewcommand{\cftsecpagefont}{\bfseries}
\setlength{\cftsubsecindent}{3.8em}
\renewcommand{\cftsubsecfont}{\bfseries}
\renewcommand{\cftsubsecpagefont}{\bfseries}
\setlength{\cftsubsubsecindent}{7.0em}
\renewcommand{\cftsubsubsecfont}{\normalfont}
\renewcommand{\cftsubsubsecpagefont}{\normalfont}

% ---------- Part 目录条目 ----------
\makeatletter
\renewcommand{\l@part}[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{1pc}%
    \begingroup
      \parindent \z@
      \rightskip \@tocrmarg
      \parfillskip -\rightskip
      \centering
      \bfseries\Large
      \leavevmode
      {\bfseries Part \thepart\enspace}#1%
      \nobreak
      \par
      \penalty\@highpenalty
    \endgroup
  \fi}
\makeatother

% ==================== 核心：按 Part 在文末统一输出参考文献 ====================
\newcounter{partsegmentcount}   % 记录手动创建的分段数

\let\oldpart\part
\renewcommand{\part}[1]{%
  \newrefsegment                % 开启新的 refsegment
  \stepcounter{partsegmentcount}%
  \oldpart{#1}%                 % 输出 Part 标题
}

% ========== 新增：先打印全部参考文献，再按 Part 打印 ==========
\AtEndDocument{%
  \clearpage
  \section*{References}
  \addcontentsline{toc}{section}{References}
  % --- 1. 打印全部参考文献（所有 segment 合并） ---
  \printbibliography[heading=none]%
  % --- 2. 按 Part 分别打印 ---
  \makeatletter
  \ifnum\value{partsegmentcount}>0
    \newcounter{partloop}
    \setcounter{partloop}{1}
    \loop
      \ifnum\value{partloop}>\value{partsegmentcount}
    \else
      \phantomsection
      \subsection*{References for Part \thepartloop}
      \edef\currentsegment{\number\value{partloop}}%
      % 检查该 segment 是否有文献
      \expandafter\ifcsvoid\expandafter{blx@segm@0@\currentsegment}%
        {No literature referred.}%
        {\printbibliography[segment=\currentsegment, heading=none]}%
      \stepcounter{partloop}%
    \repeat
  \fi
  \makeatother
}
% ==================== 核心结束 ====================

% ========== 新增：迁移自 myPaper 的标题与摘要样式 ==========
\RequirePackage{titling}   % 提供 \pretitle 等钩子

% 标题垂直居中、大号加粗
\pretitle{%
  \begin{center}
  \vspace*{\fill}
  \LARGE\bfseries
}
\posttitle{\par\end{center}\vskip 0.5em}

% 作者居中，表格形式（可包含多行）
\preauthor{%
  \begin{center}
  \large\lineskip 0.2em
  \begin{tabular}[t]{c}
}
\postauthor{%
  \end{tabular}
  \par\end{center}
  \vskip 0.3em
}

% 日期居中
\predate{%
  \begin{center}
  \large
}
\postdate{%
  \par\end{center}
  \vskip 0.5em
}

% 自定义摘要：单独一页，居中标题，内容不缩进
\newcommand{\myPreface}[1]{%
  \begin{center}
    \bfseries\large Preface
  \end{center}
  \noindent #1
  \par\vspace{0.5em}
  \vspace*{\fill}
}

\newcommand{\myAbstract}[1]{%
\vspace*{\fill}
  \begin{center}
    \bfseries\large Abstract
  \end{center}
  \noindent #1
  \par\vspace{0.5em}
  \vspace*{\fill}
}

% 可选：更新链接命令（保留）
\newcommand{\myUpdate}[1]{(See \href{#1}{#1} for updates.)}
% ========== 迁移结束 ==========

\endinput