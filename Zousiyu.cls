% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Zousiyu}
\LoadClass[a4paper,UTF8,space,openany,oneside,fntef]{ctexbook}%中英文之间空格，chapter任意页码开始，book文档类型，可加oneside参数去掉编译出来的空白页，fntef调用下画线宏包

%========================宏包和相关设置===============================
\usepackage{endnotes}%尾注宏包
\usepackage{fontspec}%字体选择宏包
\usepackage{etoolbox}%用于更改chapter定义

%========================一些表格宏包================================
\usepackage{array}			%一个表格宏包
\usepackage{colortbl}		%彩色表格宏包
\usepackage{booktabs}		%表格线宏包
\usepackage{multirow}		%跨行
\usepackage{diagbox}		%对角线宏包，刘海洋

\usepackage[top=2.7truecm,bottom=2.2truecm,left=3truecm,right=3truecm,includefoot,xetex]{geometry}
\usepackage[version=4]{mhchem}			%化学式宏包
\usepackage{siunitx}					%单位宏包

\usepackage{amsmath,amssymb,amsfonts,latexsym,textcomp,mathrsfs,euscript,yhmath}%与默认字体不冲突的一些符号包

\usepackage{texnames,metalogo}%TeX家族标识符宏包

\usepackage{titletoc}		%目录格式修改宏包
\usepackage{titlesec}		%标题样式宏包
\usepackage{caption}		%图表标题宏包

\usepackage{listings}		%代码展示宏包
\usepackage{pgfplots}		%数学绘图宏包
%\usepackage{enumerate}		%排序列表宏包
\usepackage{paralist}		%多功能列表宏包

% 令 \cleardoublepage 的偶数页页眉页脚为空
%\renewcommand{\cleardoublepage}
%{\clearpage\if@twoside \ifodd\c@page\else
%	\hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%===========================字体设置=================================
\setmainfont{Times New Roman}%仅对西文起作用
\setCJKmainfont{SimSun}%仅对中文起作用

%===========================图片设置=================================
\graphicspath{{fig/}}%图片路径
%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg,.bmp}

%===========================页眉页脚=================================
\usepackage{fancyhdr}			%宏包
\pagestyle{fancy}
%上面两行必备
\fancyhf{}						%清空当前设置
%\fancyhead[R]{邹思宇的 \LaTeX 学习笔记}
%\fancyfoot[C]{\thepage}
\lhead{\heiti\leftmark}
\rhead{\heiti\rightmark}
\chead{\heiti 邹思宇的 \LaTeX 学习笔记}
\cfoot{\bfseries \thepage}
%\headrulewidth{0.5pt} %页眉线
%\footrulewidth{0pt} %页脚线

%重新定义页眉页脚上的章节样式
%\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
%\renewcommand{\chaptermark}[1]{\markboth{第\thechapter 章\ #1}{}}

\ctexset{today=big}%改变日期的显示样式为全部大写，用于封面定义

%=========================标题样式设置===============================
\setcounter{secnumdepth}{5}%设置标题深度

%设置各级标题对齐方式，字号，字体及前后段间距
%一级标题，黑体四号，左对齐
%\CTEXsetup[format+={\zihao{4}\rm\heiti\flushleft},beforeskip={0pt},afterskip={0pt}]{chapter}
%\CTEXsetup[name={,}]{chapter}%更改一级标题计数形式
%\CTEXsetup[number={\arabic{chapter}}]{chapter}

\ctexset{
	chapter={
%		name={第,章},
		number=\chinese{chapter},
%		numberformat=\color{blue}\zihao{2}\itshape,
		format=\centering\heiti\zihao{2},
		beforeskip=0pt,
		afterskip=1em,
		fixbeforeskip=true,%抑制chapter后的空行
	}
}

\ctexset{
	section={
		format=\centering\heiti\zihao{-3},
		beforeskip=0pt,
		afterskip=0pt,
	}
}

\ctexset{
	subsection={
		format=\heiti\zihao{-4}\raggedright,%左对齐
		beforeskip=0pt,
		afterskip=0pt,
	}
}

\ctexset{
	subsubsection={
		format=\heiti\zihao{-4}\raggedright,%左对齐
		beforeskip=0pt,
		afterskip=0pt,
	}
}

%=================================目录===============================
\setcounter{tocdepth}{4}%目录深度

\renewcommand\contentsname{\heiti \zihao{3} 目 \quad 录}%\开头的这种命令后面一定要空一格，然后开始写文本  \hspace*{\fill}用于生成空白

\titlecontents{chapter}[0pt]{\songti \zihao{-4}}{\thecontentslabel}{}{\titlerule*{$\cdots$}\contentspage}
\titlecontents{section}[1em]{\songti \zihao{-4}}{\thecontentslabel}{}{\titlerule*{$\cdots$}\contentspage}
\titlecontents{subsection}[3em]{\songti \zihao{-4}}{\thecontentslabel}{}{\titlerule*{$\cdots$}\contentspage}
\titlecontents{subsubsection}[3em]{\songti \zihao{-4}}{\thecontentslabel}{}{\titlerule*{$\cdots$}\contentspage}
\titlecontents{paragraph}[4em]{\songti \zihao{-4}}{\thecontentslabel}{}{\titlerule*{$\cdots$}\contentspage}

%===========================图表标题样式============================
\DeclareCaptionFont{heiti}{\heiti}
\captionsetup[figure]{labelsep=space,justification=centering,font=heiti,aboveskip=1mm,belowskip=1mm}%空格分隔符，居中，黑体
\captionsetup[table]{labelsep=space,justification=centering,font=heiti,aboveskip=1mm,belowskip=1mm}%空格分隔符，居中，黑体

%在浮动体环境外使用图标标题
%\makeatletter
%\newcommand\figcaption{\def\@captype{figure}\caption}
%\newcommand\tabcaption{\def\@captype{table}\caption}
%\makeatother

%自定义各列列宽，使用参数CRL+长度
\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}m{#1}}
\newcolumntype{R}[1]{>{\PreserveBackslash\raggedleft}m{#1}}
\newcolumntype{L}[1]{>{\PreserveBackslash\raggedright}m{#1}}

\usepackage{xcolor}					%代码高亮
\usepackage{color}					%[usenames,dvipsnames]

%============================代码环境===============================
%定义一个代码字体
\newfontfamily\daima{Consolas}

\definecolor{backcolor}{RGB}{242,242,242}			%背景色
\definecolor{comment}{RGB}{0,128,0}					%注释
\definecolor{keyword}{RGB}{0,0,255}					%关键词
\definecolor{string}{RGB}{206,145,108}				%字符串
\definecolor{package}{RGB}{0,128,0}
\definecolor{envi}{RGB}{185,70,15}					%环境


\lstset{language=[LaTeX]TeX,
	frame=shadowbox,				%single
	numbers=left,
	numbersep=5pt,					%行号与代码距离
	breaklines=true,				%自动换行
	xleftmargin=5em,				%左边距
	xrightmargin=5em,
	aboveskip=1em,
	tabsize=4,						%设置tab空格数
	extendedchars=false,			%解决代码跨页时，章节标题，页眉等汉字不显示的问题
	showspaces=false,				%不显示空格
	showstringspaces=false,
	%高亮与样式设置
	numberstyle=\zihao{6}\daima,
	basicstyle=\zihao{6}\ttfamily,		%\footnotesize\ttfamily
	backgroundcolor=\color{backcolor},			%背景色
	commentstyle=\color{comment},
	keywordstyle=\color{keyword},
	stringstyle=\color{string},
	%
	classoffset=0,
	morekeywords={addplot, addplot3, begin, end},
	keywordstyle=\color{keyword},
	%
	classoffset=1,
	morekeywords={article,report,book,xeCJK,tikz,calc},
	keywordstyle=\color{package},
	%
	classoffset=2,
	morekeywords={document,tikzpicture},
	keywordstyle=\color{envi},
	escapeinside=``
	}

%定义latex代码专用环境和命令
\lstnewenvironment{latex}[1]{\lstset{#1}}{}
\newcommand{\latexline}[1]{{\lstinline[language=TeX,basicstyle=\small\ttfamily]{#1}}}


\newcommand{\qd}[1]{{\bfseries\slshape{#1}}}	% 强调，粗斜体

%%==============================MATLAB代码高亮=====================================
%\definecolor{DarkGreen}{rgb}{0.0,0.4,0.0}
%%%\lstloadlanguages{Matlab}
%\lstset{
%	language=Matlab,
%	frame=shadowbox,				%single
%	numbers=left,
%	numbersep=5pt,					%行号与代码距离
%	breaklines=true,				%自动换行
%	xleftmargin=5em,				%左边距
%	xrightmargin=5em,
%	aboveskip=1em,
%	tabsize=4,						%设置tab空格数
%	extendedchars=false,			%解决代码跨页时，章节标题，页眉等汉字不显示的问题
%	showspaces=false,				%不显示空格
%	showstringspaces=false,
%	%高亮与样式设置
%	numberstyle=\zihao{6}\daima,
%	basicstyle=\zihao{6}\daima,		%\footnotesize\ttfamily
%	basicstyle=\zihao{6}\daima,
%	keywordstyle=[1]\color[RGB]{0,0,255}\slshape,  % primitive funs in bold blue
%	keywordstyle=[2]\color[RGB]{128,128,128},         % args of funs in purple
%	keywordstyle=[3]\color[RGB]{0,0,255}\underbar,  % user funs in blue with underbar
%	stringstyle=\color[RGB]{138,68,136},             % strings in purple
%	identifierstyle=,
%	commentstyle=\usefont{T1}{pcr}{m}{sl}\color{DarkGreen}\small,
%	% more standard MATLAB funcs
%%	morekeywords={sawtooth, square},
%	% args of funcs
%%	morekeywords=[2]{on, off, interp},
%%	morecomment=[l][\color[RGB]{0,0,255}]{...},     % line continuation (...) like blue comment
%%	numberstyle=\tiny\color[RGB]{0,0,255},
%%	firstnumber=1,
%%	stepnumber=1
%	}

%===============构建一个左边显示代码，右边显示编译结果的代码展示环境====================
\usepackage{verbatim}
\newbox\savedlines
\newtoks\savedtokens
\makeatletter
\def\codeshow{%
	\global\savedtokens={}%
	\def\verbatim@processline{%
		{\setbox0=\hbox{\the\verbatim@line}%
			\hsize=\wd0
			\the\verbatim@line\par}%
		\global\savedtokens=\expandafter{\the\expandafter\savedtokens\the\verbatim@line^^J}}%
	\@tempswatrue
	\setbox0=\vbox\bgroup\parskip=0pt\topsep=0pt\partopsep=0pt
	\verbatim}
\def\endcodeshow{\endverbatim%
	\unskip\setbox0=\lastbox\egroup
	\global\setbox\savedlines=\box0
	\addvspace{1em}\par\noindent%
	\colorbox{lightgray}{%
		\begin{minipage}{.55\textwidth}{\usebox\savedlines}\end{minipage}}%
	\hfill\fbox{\parbox{.40\textwidth}%
		{\scantokens\expandafter{\the\savedtokens\unskip\endinput}}}%
	\par\addvspace{1em}}
\makeatother

%====================最后放置链接宏包，避免冲突===============================
\usepackage[colorlinks,bookmarksopen=true,bookmarksnumbered=true]{hyperref}

%======================新定义，使引用变为图1-1，式（3-2）这样的形式==========================
%\def\equationautorefname{式}%
\renewcommand{\eqref}[1]{式(\ref{#1})}
\def\footnoteautorefname{脚注}%
\def\itemautorefname{项}%
\def\figureautorefname{图}%
\def\tableautorefname{表}%
\def\partautorefname{篇}%
\def\appendixautorefname{附录}%
\def\chapterautorefname{章}%
\def\sectionautorefname{节}%
\def\subsectionautorefname{小小节}%
\def\subsubsectionautorefname{subsubsection}%
\def\paragraphautorefname{段落}%
\def\subparagraphautorefname{子段落}%
\def\FancyVerbLineautorefname{行}%
\def\theoremautorefname{定理}%
