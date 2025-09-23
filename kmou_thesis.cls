%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Unofficial KMOU's latex thesis class
% Creater: Will Son
% Date: 21st September, 2025
% Github: https://github.com/will2world/kmou_thesis_latex_class
% Comment:
% - 현재는 영문버전 논문만 지원합니다.
% - 현재 작성규정에는 영문 버전에 대한 설명이 미흡하여,
%	영문 양식을 기반으로 하고, 한글 양식을 일부 참고하여
%	작성하였습니다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kmou_thesis}[2025/09/19 v0.1 Unofficial KMOU thesis class]

% 기반 클래스: book
\LoadClass[11pt,b5paper,oneside]{book}

\RequirePackage{iftex}
\ifPDFTeX\else
  \ClassError{thesis}{This class supports only pdfLaTeX}{Compile with pdflatex.}
\fi

% -------------------------------
% Class options: [Korean]
% -------------------------------
\newif\if@Korean
\DeclareOption{korean}{\@Koreantrue}
\ProcessOptions\relax

% 기본 패키지
\RequirePackage[T1]{fontenc} % pdflatex 기본
\RequirePackage{newtxtext,newtxmath} % times new roman font
\renewcommand{\ttdefault}{\rmdefault} % tt font 통일

\RequirePackage[hangul]{kotex}    % UTF-8 한글
\SetHangulFonts{nanummj}{nanumgt}{nanummj} % 기본 글꼴을 나눔명조로, sanserif 글꼴을 나눔고딕으로 설정.

\RequirePackage{geometry}
\geometry{
  paper=b5paper,
  left=20mm, right=20mm,
  top=20mm,  bottom=15mm,
  headsep=10mm,   % 머리말과 본문 사이
  footskip=15mm,  % 본문과 꼬리말 사이
  includehead, includefoot
}
\RequirePackage{titlesec}   % 장/절 제목 포맷팅
\RequirePackage{tocloft}    % TOC/LOF/LOT 모양 손보기(필요시)
\RequirePackage{array}      % 인준지 제작
\RequirePackage{amsmath}
\RequirePackage{chngcntr}

% TOC 설정용 패키지
\RequirePackage[nottoc]{tocbibind} % Bib을 TOC에 추가 하는 패키지
\RequirePackage[labelsep=period]{caption} % fig와 table의 caption separator 지정: 또는 period, space, quad

% --- 전역 본문 행간: 150% ---
\RequirePackage{setspace}
\AtBeginDocument{\setstretch{1.5} \pagestyle{plain}}  % 전역 1.5배


% 챕터 시작마다 figure와 table 번호 초기화
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}
\counterwithin{equation}{chapter}

% figure, table, equation 표기 방식 수정
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

% --- 메타데이터 키 (변수)---
\def\@university{}
\def\@department{}
\def\@graduateschool{}
\def\@thesistitle{}
\def\@authorname{}
\def\@advisor{}
\def\@degree{}
\def\@submissiondate{}
\def\@keywords{}
\def\@chairman{}
\def\@committeeA{}
\def\@committeeB{}
\def\@committeeC{}
\def\@committeeD{}

\newcommand\university[1]{\gdef\@university{#1}}
\newcommand\department[1]{\gdef\@department{#1}}
\newcommand\graduateschool[1]{\gdef\@graduateschool{#1}}
\newcommand\thesistitle[1]{\gdef\@thesistitle{#1}}
\newcommand\authorname[1]{\gdef\@authorname{#1}}
\newcommand\advisor[1]{\gdef\@advisor{#1}}
\newcommand\degree[1]{\gdef\@degree{#1}}
\newcommand\submissiondate[1]{\gdef\@submissiondate{#1}}
\newcommand\keywords[1]{\gdef\@keywords{#1}}
\newcommand\chairman[1]{\gdef\@chairman{#1}}
\newcommand\committeeA[1]{\gdef\@committeeA{#1}}
\newcommand\committeeB[1]{\gdef\@committeeB{#1}}
\newcommand\committeeC[1]{\gdef\@committeeC{#1}}
\newcommand\committeeD[1]{\gdef\@committeeD{#1}}

% --- 한글 제목 문자열 ---
\if@Korean
  \renewcommand\contentsname{목차}
  \renewcommand\listfigurename{그림 목록}
  \renewcommand\listtablename{표 목록}
  \newcommand\listofabbreviationsname{약어 목록}
  \newcommand\acknowledgmentsname{감사의 글}
  \renewcommand\bibname{참고문헌}
  \newcommand\kabstractname{초록}
  \newcommand\eabstractname{Abstract}
\else
  \renewcommand\contentsname{Contents}
  \renewcommand\listfigurename{List of Figures}
  \renewcommand\listtablename{List of Tables}
  \newcommand\listofabbreviationsname{List of Abbreviations}
  \newcommand\acknowledgmentsname{Acknowledgments}
  \renewcommand\bibname{References}
  \newcommand\kabstractname{Korean Abstract} % 필요 시 사용
  \newcommand\eabstractname{Abstract}
\fi

% -------------------------------
% TOC formatting per spec (서식4,5): show chapter/section/subsection on TOC
% -------------------------------
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{2}

\if@Korean
  % ---- 한국식 번호/표기 ----
  % subsection은 로마자(I, II, ...)로
  \renewcommand{\thesubsection}{\Roman{subsection}}

  % 목차 제목/항목 폰트 크기: 16/14/12/11pt
  \renewcommand{\cfttoctitlefont}{\fontsize{16}{18}\selectfont\bfseries}
  \renewcommand{\cftaftertoctitle}{\par\vspace{0.5em}}

  \renewcommand{\cftchapfont}{\fontsize{14}{16}\selectfont}
  \renewcommand{\cftchappagefont}{\fontsize{14}{16}\selectfont}

  \renewcommand{\cftsecfont}{\fontsize{12}{14}\selectfont}
  \renewcommand{\cftsecpagefont}{\fontsize{12}{14}\selectfont}

  \renewcommand{\cftsubsecfont}{\fontsize{11}{13}\selectfont}
  \renewcommand{\cftsubsecpagefont}{\fontsize{11}{13}\selectfont}

  % 장: "제<번호>장", 절: "제<번호> 절", 소절: "I."
  \renewcommand{\cftchappresnum}{제}
  \renewcommand{\cftchapaftersnum}{장\ }
  \settowidth{\cftchapnumwidth}{제99장\ }

  \renewcommand{\cftsecnumformat}[1]{제#1\space 절\quad}
  \renewcommand{\cftsubsecnumformat}[1]{#1.\quad}

  % 점선/간격 조절
  \renewcommand{\cftdotsep}{1}
  \setlength{\cftbeforechapskip}{0.5em}
  \setlength{\cftbeforesecskip}{0.2em}
  \setlength{\cftbeforesubsecskip}{0.1em}
\else
  % ---- 영문 기본 번호/표기 ----
  \renewcommand{\cfttoctitlefont}{\fontsize{16}{18}\selectfont\bfseries}
  \renewcommand{\cftaftertoctitle}{\hfill\par\vspace{0.5em}}

  \renewcommand{\cftchapfont}{\fontsize{12}{14}\selectfont\bfseries}
  \renewcommand{\cftchappagefont}{\fontsize{12}{14}\selectfont\bfseries}

  \renewcommand{\cftsecfont}{\fontsize{12}{14}\selectfont}
  \renewcommand{\cftsecpagefont}{\fontsize{12}{14}\selectfont}

  \renewcommand{\cftsubsecfont}{\fontsize{11}{13}\selectfont}
  \renewcommand{\cftsubsecpagefont}{\fontsize{11}{13}\selectfont}

  % 장/절 번호 포맷은 book 기본값 사용 (예: 1, 1.1)
  % 다만 번호폭이 짧아 잘리면 필요 시 다음 줄 주석 해제:
  % \renewcommand{\cftchapaftersnum}{\ } \settowidth{\cftchapnumwidth}{99\ }
  \renewcommand{\cftdot}{\textperiodcentered} % U+00B7(·)를 사용
  \renewcommand{\cftdotsep}{0.5}
  \renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}}
  \renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
  \renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
  \renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}

  % List of Figures 항목에 "Figure <번호>" 설정
  \renewcommand{\cftfigpresnum}{\figurename~}
  \renewcommand{\cftfigaftersnum}{.\enspace}  % 번호 뒤 마침표+공백
  \settowidth{\cftfignumwidth}{Fig.~99-99.\:} % 번호 폭 재조정
  
  % List of Tables 항목에 "Table <번호>" 설정
  \renewcommand{\cfttabpresnum}{\tablename~}
  \renewcommand{\cfttabaftersnum}{.\enspace}  % 번호 뒤 마침표+공백
  \settowidth{\cfttabnumwidth}{Table~99-99.\:}  % 번호 폭 재조정

  % TOC에서 chapter, section, subsection 상단 폭 지정
  \setlength{\cftbeforechapskip}{5pt} 
  \setlength{\cftbeforesecskip}{0pt}
  \setlength{\cftbeforesubsecskip}{0pt}

   \renewcommand{\figurename}{Fig.}
   \renewcommand{\tablename}{Table}
\fi

% -------------------------------
% Headings (titlesec)
% -------------------------------
\if@Korean
  % 장: 제<번호> 장  <제목>
  \titleformat{\chapter}[hang]
  {\fontsize{16}{18}\selectfont\bfseries}
    {제\thechapter 장}
    {1em}
    {}
  % 절: 제<번호> 절  <제목>
  \titleformat{\section}[hang]
    {\Large\bfseries}
    {제\thesection 절}
    {0.8em}
    {}
  % 소절: "<로마자>." <제목>
  \titleformat{\subsection}[hang]
    {\normalsize\bfseries}
    {\thesubsection.}
    {0.6em}
    {}

  \titlespacing*{\chapter}{0pt}{0pt}{0pt}
  \titlespacing*{\section}{0pt}{0pt}{0.8em}
  \titlespacing*{\subsection}{0pt}{0pt}{0.6em}
\else
  % 장: <번호> <제목>
  \titleformat{\chapter}[hang]
    {\fontsize{16}{18}\selectfont\bfseries}
    {\thechapter}
    {1em}
    {}
  % 절: <번호> <제목>
  \titleformat{\section}[hang]
    {\fontsize{14}{16}\selectfont\bfseries}
    {\thesection}
    {0.8em}
    {}
  % 소절: "<로마자>." <제목>
  \titleformat{\subsection}[hang]
    {\fontsize{12}{14}\selectfont\bfseries}
    {\thesubsection.}
    {0.6em}
    {}
  % subsubsection: <제목>
  \titleformat{\subsubsection}[hang]
  {\fontsize{11}{13}\selectfont\bfseries} % 글꼴 크기와 굵기
  {\thesubsubsection.}                     % 번호 (예: 1.1.1.)
  {}                                       % 번호와 제목 사이 간격
  {}                                       % 제목 앞에 넣을 코드 (없음)

  % 각 타이틀의 앞뒤 간격을 설정하는 부분
  \titlespacing{\chapter}{0pt}{-50pt}{18pt} %chapter가 기본 설정하는 50pt를 상쇄하고 최 상단에서 chapter 시작
  \titlespacing{\section}{0pt}{12pt}{6pt}
  \titlespacing{\subsection}{0pt}{9pt}{3pt}
  \titlespacing{\subsubsection}{0pt}{6pt}{3pt}
\fi

% --- 표지 ---
\newcommand{\maketitlepage}{%
  \clearpage
  \thispagestyle{empty}%
  \begingroup
    % --- 표지 전용 마진 (이 블록 안에서만 적용) ---
    \newgeometry{top=40mm,left=20mm,right=20mm,bottom=40mm,includehead=false,includefoot=false}%

    \centering
    {\fontsize{13}{13}\selectfont Thesis for the \@degree\par}
    \vspace{49.5pt} %11 * 3 * 1.5
    {\fontsize{18}{18}\selectfont \@thesistitle\par}
    %\vspace{99pt} % 11 * 6 * 1.5
    \vfill
    {\fontsize{14}{14}\selectfont \@authorname\par}
    %\vspace{63pt} % 14 * 3 * 1.5
    \vfill
    {\fontsize{14}{14}\selectfont \@submissiondate\par}
    \vspace{49.5pt} %11 * 3 * 1.5
    {\fontsize{14}{16}\selectfont \@department\par}
    {\fontsize{14}{16}\selectfont Graduate School of\par}
    {\fontsize{14}{16}\selectfont \@university\par}
    % --- geometry 원복 ---
    \restoregeometry
  \endgroup
  \clearpage
}

% --- 인준지(승인서) ---
\newcommand{\makeapprovalpage}{%
  \clearpage
  \thispagestyle{empty}
    \begingroup
  \newgeometry{top=30mm,left=20mm,right=20mm,bottom=30mm,includehead=false,includefoot=false}%
  % upper block
  {\centering
    {\fontsize{18}{18}\selectfont \@thesistitle\par}
    \vspace{25.2pt} %12 * 1.5
    {\fontsize{12}{14} By\par}
    {\fontsize{14}{16}\selectfont \@authorname\par}
    \vspace{25.2pt} %12 * 1.5
    {\fontsize{12}{14}\selectfont Advised by \@advisor\par}
    \vspace{25.2pt} %12 * 1.5
    {\fontsize{13}{15}A Thesis Submitted to the Graduate School of\\
	Korea Maritime and Ocean University in the Partial Fulfillment\\
of the Requirements for the \@degree \par}
    \vspace{18pt} %12 * 1.5
    {\fontsize{15}{17} \@submissiondate\par}
    \par}

   \vfill

  % lower block
  \noindent {\fontsize{15}{15} Dissertation Committee\par}
  % 1) 열 타입 정의 (cls에 이미 있으면 중복 선언 생략)
  \newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{##1}}
  \newcolumntype{C}[1]{>{\centering\arraybackslash}p{##1}}
  \newcolumntype{R}[1]{>{\raggedright\arraybackslash}p{##1}}
  % 2) 행 높이
  \newlength{\sigrow}\setlength{\sigrow}{1.2cm}
  % 서명 실선 명령: 셀 전체 폭만큼 얇은 선
  \newcommand{\sigline}{\raisebox{-1.5ex}{\rule{\linewidth}{0.4pt}}}
   {\centering
  \begin{tabular}{@{}L{2.3cm} C{5cm} R{5cm}@{}}
    \rule{0pt}{\sigrow} Chairman & \@chairman   & \sigline \\
    \rule{0pt}{\sigrow} Member   & \@committeeA & \sigline \\
    \rule{0pt}{\sigrow} Member   & \@committeeB & \sigline \\
    \rule{0pt}{\sigrow} Member   & \@committeeC & \sigline \\
    \rule{0pt}{\sigrow} Member   & \@committeeD & \sigline \\
  \end{tabular}\par}
  \restoregeometry
  \endgroup
  \clearpage
}

% --- abstract 환경 ---
\newcommand\makeabstract{%
  \clearpage
  \thispagestyle{plain}%
  \begingroup
  \let\oldtitleformat\titleformat
  \titleformat{name=\chapter,numberless}[hang]
    {\fontsize{20}{22}\selectfont\normalfont\centering}{}{1em}{}%
  \chapter*{\textbf{\@thesistitle}}%
  \let\titleformat\oldtitleformat
\endgroup
  \begingroup
    % 상단 타이틀/저자/소속은 중앙 정렬
    \begin{center}
      \vspace{28.8pt} % 16*1.8 = 28.8
      {\fontsize{13}{15}\selectfont\textit{\@authorname}\par}
      \vspace{25.2pt} % 14*1.8 = 25.2
      {\fontsize{13}{15}\selectfont \textit{\@department \\ \@graduateschool} \par}
    \end{center}
    \vspace{16.5pt}

    % "Abstract" 표제
    {\centering {\fontsize{16}{18}\selectfont \textbf{\eabstractname}}\par}
    \addcontentsline{toc}{chapter}{\eabstractname}%
    %\addtocontents{toc}{\protect\vspace{18pt}}% 목차 상 abstract 다음 공란 추가, 12pt*1.5 = 18 

    \vspace{16.5pt}

    % 본문은 사용자가 \begin{abstractbody} ... \end{abstractbody} 로 제공
    % (여기선 아무것도 출력하지 않음)

    % 키워드 라인 (본문 이후 사용자가 호출)
    % 별도 명령 제공:
  \endgroup
}

\newenvironment{abstractbody}{%
  \par\begingroup
  \fontsize{11}{13}\selectfont
  \setstretch{1.5}% 초록은 보통 단일행간(지침 다르면 조정)
  \setlength{\parindent}{0pt}
}{\par\endgroup}

\newcommand\printkeywords{%
  \vspace{19.8pt}% 11 * 1.8 = 19.8
  {\fontsize{11}{13}\selectfont \noindent \textbf{Keywords : } \textbf{\@keywords} \par}
}

% --- 약어 목록 환경 ---
\newenvironment{abbreviations}{%
  \chapter*{\hfill\listofabbreviationsname\hfill}%
  \addcontentsline{toc}{chapter}{\listofabbreviationsname}%
  \vspace{0.5em}
  \begin{description}\setlength{\itemsep}{0.2em}}%
  {\end{description}}

% --- 감사의 글 환경 ---
\newenvironment{acknowledgments}{%
  \chapter*{\acknowledgmentsname}%
}{\par}

% --- Table of contents 환경 ---
\newenvironment{contentslist}{%
	\clearpage
	\thispagestyle{plain}%
	\setcounter{page}{1}%
        \pagenumbering{roman}% 
	\providecommand\phantomsection{}%
	\phantomsection
	\pdfbookmark[1]{\contentsname}{toc} % TOC에서는 생략되더라도, pdf 상 bookmark에는 보이도록 추가.
	\chapter*{\hfill \contentsname \hfill}% ← 표준 Chapter 타이틀 사용
	\@starttoc{toc}%
	}{}
\newcommand{\makecontents}{%
  \begin{contentslist}\end{contentslist}
}

% --- List of Figures 환경 ---
\newenvironment{figureslist}{%
  \clearpage
  \thispagestyle{plain}
  \phantomsection
  \chapter*{\hfill\listfigurename\hfill}
  \addcontentsline{toc}{chapter}{\listfigurename}%
  \@starttoc{lof}%
}{}

\newcommand{\makelistoffigures}{
\begin{figureslist}
\end{figureslist}
}

% --- List of Tables 환경 ---
\newenvironment{tableslist}{%
  \chapter*{\hfill\listtablename\hfill}%
  \addcontentsline{toc}{chapter}{\listtablename}%
  \@starttoc{lot}%
}{}
\newcommand{\makelistoftables}{
\begin{tableslist}
\end{tableslist}
}
