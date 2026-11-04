\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ThePsychologyOfMoney}
\LoadClass[zihao=-4,a4paper,12pt,twoside,fontset=none]{ctexart}
\RequirePackage[top=3.2cm,bottom=2.7cm,left=3.18cm,right=3.18cm]{geometry}
\RequirePackage{xcolor,graphicx}

% 中文各字体独立设置；西文保留模板的 Times New Roman。
\RequirePackage[AutoFallBack=true]{xeCJK}
\setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
\setCJKsansfont[BoldFont={FZHei-B01}]{FZHei-B01}
\setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
\setCJKfamilyfont{zhsong}[BoldFont={FZHei-B01}]{FZShuSong-Z01}
\setCJKfamilyfont{zhhei}[BoldFont={FZHei-B01}]{FZHei-B01}
\setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03}
\setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
\providecommand{\songti}{}
\renewcommand*{\songti}{\CJKfamily{zhsong}}
\providecommand{\heiti}{}
\renewcommand*{\heiti}{\CJKfamily{zhhei}}
\providecommand{\kaishu}{}
\renewcommand*{\kaishu}{\CJKfamily{zhkai}}
\providecommand{\fangsong}{}
\renewcommand*{\fangsong}{\CJKfamily{zhfs}}
\newCJKfontfamily\xbsong{FZXiaoBiaoSong-B05S}
\setCJKfallbackfamilyfont{\CJKrmdefault}{TH-Sy-P0,FZSongS--GB1-5,FZSONG_ZHSJ_02--GB1-5}
\xeCJKDeclareCharClass{CJK}{"2160 -> "216F, "2460 -> "2473}
\setmainfont{Times New Roman}[SmallCapsFont=TeX Gyre Termes:+smcp]
\RequirePackage{newunicodechar}
\newunicodechar{∶}{\ensuremath{\mathrel{:}}}
\xeCJKsetup{CJKecglue=\hskip 0.15em plus 0.05em minus 0.03em}

% 正文与页眉。封面的字体、字号和页面参数沿用原模板。
\RequirePackage{fancyhdr,emptypage,indentfirst,setspace}
\setlength{\parindent}{2em}
\setlength{\parskip}{0.25em}
\setstretch{1.5}
\setlength{\emergencystretch}{2em}
% 与参考模板一致，避免页眉盒高度将正文和页码整体向下推移。
\setlength{\headheight}{15pt}
\setlength{\footskip}{30pt}
\raggedbottom
\fancypagestyle{tocstyle}{%
  \fancyhf{}\renewcommand{\headrulewidth}{0.35pt}%
  \fancyhead[C]{\kaishu\small 目录}\fancyfoot[C]{\small\thepage}}
\fancypagestyle{docstyle}{%
  \fancyhf{}\renewcommand{\headrulewidth}{0.35pt}%
  \fancyhead[CO]{\kaishu\small\nouppercase{\leftmark}}%
  \fancyhead[CE]{\kaishu\small 金钱心理学}%
  \fancyfoot[C]{\small\thepage}}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\renewcommand{\subsectionmark}[1]{}

% section 对应全书各章；subsection 对应原书目录中的章内主题。
\RequirePackage{titlesec}
\newcommand{\sectionbreak}{\cleardoublepage}
\setcounter{secnumdepth}{0}
\setcounter{tocdepth}{2}
\titleformat{\section}[block]
  {\centering\xbsong\zihao{-2}\xeCJKsetup{CJKglue=\hskip 1.5pt}}
  {}{0pt}{}
\titleformat{\subsection}[block]
  {\centering\heiti\setstretch{1.25}\zihao{-3}}{}{0pt}{}
\titleformat{\subsubsection}[block]
  {\heiti\setstretch{1.25}\zihao{4}}{}{0pt}{}
\titlespacing*{\section}{0pt}{1.8em}{1.6em}
\titlespacing*{\subsection}{0pt}{1.5em}{0.8em}
\titlespacing*{\subsubsection}{0pt}{1.1em}{0.5em}
\titleformat{\paragraph}[block]{\heiti\normalsize}{}{0pt}{}
\titlespacing*{\paragraph}{0pt}{0.8em}{0.3em}
\newcommand{\q}{\ \ }
\renewcommand*{\l@section}[2]{%
  \vskip 0.3em\@plus\p@\@dottedtocline{1}{0em}{0em}{\bfseries #1}{#2}}
\renewcommand*{\l@subsection}[2]{\@dottedtocline{2}{1.5em}{0em}{#1}{#2}}
\let\BookOriginalTOC\tableofcontents
\renewcommand{\tableofcontents}{%
  \begingroup\setstretch{1.35}\BookOriginalTOC\endgroup}
\newcommand{\BookChapter}[1]{%
  \setcounter{section}{#1}\setcounter{table}{0}\setcounter{figure}{0}}
\renewcommand{\thefigure}{\arabic{section}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}.\arabic{table}}

% 附录保留原书的“附图1”“附表1”编号。
\newcommand{\BookAppendix}{%
  \BookChapter{21}%
  \renewcommand{\figurename}{附图}\renewcommand{\tablename}{附表}%
  \renewcommand{\thefigure}{\arabic{figure}}%
  \renewcommand{\thetable}{\arabic{table}}}

% 图题、表题共用样式；表格可自然跨页。
\RequirePackage{caption,array,longtable,booktabs}
\captionsetup{font=small,labelfont=bf,labelsep=quad,skip=8pt}
\captionsetup[longtable]{position=top}
% 让正文中的图与说明文字同页，避免中等高度插图单独占一页。
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.8}
\setlength{\LTpre}{0.5em}
\setlength{\LTpost}{0.8em}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newunicodechar{≈}{\ensuremath{\approx}}
\newunicodechar{×}{\ensuremath{\times}}
\newunicodechar{−}{\ensuremath{-}}
\newunicodechar{℃}{\ensuremath{{}^{\circ}\mathrm{C}}}
\newunicodechar{℉}{\ensuremath{{}^{\circ}\mathrm{F}}}

% 列表沿用正文行距。
\RequirePackage{enumitem}
\setlist{topsep=0pt,partopsep=0pt,itemsep=0pt,parsep=\parskip,leftmargin=2em}
\setlist[itemize]{label=\textbullet}

\RequirePackage[stable,bottom]{footmisc}
\RequirePackage{perpage}
\MakePerPage{footnote}
\interfootnotelinepenalty=10000
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,allcolors=black,linktoc=all,
  bookmarksopen=true,bookmarksopenlevel=1,
  pdftitle={金钱心理学：财富、人性和幸福的永恒真相},pdfauthor={〔美〕摩根·豪泽尔 著；李青宗 译}}
\renewcommand{\theHfigure}{\arabic{section}.\arabic{figure}}
\renewcommand{\theHtable}{\arabic{section}.\arabic{table}}
\endinput
