% Copyright (c) 2012 Cies Breijs
%
% The MIT License
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in
% all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{resume_structure}%
	[2014/03/05 v1.0 Resume Template, by cbchoi]

\LoadClass[10pt,a4paper]{article}

\usepackage[margin=0.75in]{geometry} % Adjusts the margins

\usepackage{multicol} % Required for multiple columns of text

\usepackage{mdwlist} % Required to fine tune lists with a inline headings and indented content

\usepackage{relsize} % Required for the \textscale command for custom small caps text

\usepackage[pdftex]{hyperref} % Required for customizing links
\usepackage{xcolor} % Required for specifying custom colors
\definecolor{dark-blue}{rgb}{0.15,0.15,0.4} % Defines the dark blue color used for links
\hypersetup{colorlinks,linkcolor={dark-blue},citecolor={dark-blue},urlcolor={dark-blue}} % Assigns the dark blue color to all links in the template

\usepackage{tgpagella} % Use the TeX Gyre Pagella font throughout the document
\usepackage[T1]{fontenc}
\usepackage{microtype} % Slightly tweaks character and word spacings for better typography
\usepackage{kotex}

\pagestyle{empty} % Stop page numbering

\hyphenation{Some-long-word} % Specify custom hyphenation points in words with dashes where you would like hyphenation to occur, or alternatively, don't put any dashes in a word to stop hyphenation altogether

%----------------------------------------------------------------------------------------
%	DEFINE OPTIONS
%----------------------------------------------------------------------------------------

%% 옵션 설정을 위한 boolean 변수선언
\newif\if@isKorean
\newif\if@isFull

%% 국문/영문이력서 옵션
\DeclareOption{korean} {\@isKoreantrue}
\DeclareOption{english}{\@isKoreanfalse}

%% 요약 이력서/전체 이력서 옵션
\DeclareOption{full}  {\@isFulltrue}
\DeclareOption{representative}  {\@isFullfalse}

\ExecuteOptions{korean,full}         % doctor,korean,final이 기본값
\ProcessOptions

\RequirePackage{ifthen}       % 추가 패키지 설정

%----------------------------------------------------------------------------------------
%   Fancy Icons
%----------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
%                required packages
%-------------------------------------------------------------------------------
% MarVoSym font
\RequirePackage{marvosym}
\newcommand*{\marvosymbol}[1]{}
%\ifxetexorluatex
%  \renewcommand*{\marvosymbol}[1]{{\fontspec{MarVoSym}\char#1}}
%\else
  \renewcommand*{\marvosymbol}[1]{{\fontfamily{mvs}\fontencoding{U}\fontseries{m}\fontshape{n}\selectfont\char#1}}
%\fi

%----------------------------------------------------------------------------------------
%	DEFINE INFORMATION COMMANDS
%----------------------------------------------------------------------------------------
% @command ResumeName 이력서에 들어갈 이름
% @param 한글, 한자, 영어, 생년월일
% @options [default: (none)]
\newcommand{\ResumeName}[3] {%
    \newcommand{\@KoreanName}{#1}
    \newcommand{\@ChineseName}{#2}
    \newcommand{\@EnglishName}{#3}
    }{}%

% @command ResumeBirth 이력서에 들어갈 생년월일
% @param 생년월일
% @options [default: (none)]
\newcommand{\ResumeBirth}[1] {%
    \newcommand{\@Birth}{#1}
    }{}%

% @command ResumeBirth 이력서에 들어갈 이메일 정보
% @param e-mail
% @options [default: (none)]
\newcommand{\ResumeEmail}[1] {%
    \newcommand{\@Email}{#1}
    }{}% 

% @command ResumeMobile 이력서에 들어갈 휴대폰 정보
% @param #Phone
% @options [default: (none)]
\newcommand{\ResumeMobile}[1] {%
    \newcommand{\@Mobile}{#1}
    }{}%   

% @command ResumeHompage 이력서에 들어갈 홈페이지
% @param Homepage
% @options [default: (none)]
\newcommand{\ResumeHomepage}[1] {%
    \newcommand{\@Homepage}{#1}
    }{}% 

% @command ResumeAddress 이력서에 들어갈 상세 주소
% @param 한글 상세주소, 영어 상세주소
% @options [default: (none)]
\newcommand{\ResumeAddress}[2] {%
    \newcommand{\@KoreanAddress}{#1}
    \newcommand{\@EnglishAddress}{#2}
    }{}%

% @command ResumeCity 이력서에 들어갈 도시 정보
% @param 한글 도시, 영어 도시
% @options [default: (none)]
\newcommand{\ResumeCity}[2] {%
    \newcommand{\@KoreanCity}{#1}
    \newcommand{\@EnglishCity}{#2}
    }{}%

% @command ResumeNation 이력서에 들어갈 나라 정보
% @param 한글 나라 정보, 영어 나라 정보
% @options [default: (none)]
\newcommand{\ResumeNation}[2] {%
    \newcommand{\@KoreanNation}{#1}
    \newcommand{\@EnglishNation}{#2}
    }{}%         

\newcommand*\makeheader{
	\if@isKorean
		\noindent{\LARGE \textbf{\@KoreanName (\@ChineseName)}}\ \ \ \emph{\@Birth}\vspace{0.3em}
	\else
		\noindent{\LARGE \textbf{\@EnglishName}}\ \ \ \emph{\@Birth}\vspace{0.3em}
	\fi \\
	\noindent\href{mailto:\@Email}{\marvosymbol{66}~\@Email}\bull % Your email address
	\marvosymbol{72}~\textsmaller{+}\@Mobile %\bull smith01 %\textit{(Skype)}\bull % Your phone number(s) and Skype username
	\bull \href{\@Homepage}{{\Large\marvosymbol{205}}~\@Homepage}\\ % Your URL
	\if@isKorean
		\@KoreanCity \bull \@KoreanAddress \bull \@KoreanNation % Your address
	\else
		\@EnglishAddress \bull \@EnglishCity \bull \@EnglishNation % Your address
	\fi
	\spacedhrule{0.9em}{-0.4em} % Horizontal rule - the first bracket is whitespace before and the second is after
} % Main title (name) with date of birth or subtitle

%%% LOAD AND SETUP PACKAGES

%----------------------------------------------------------------------------------------
%	DEFINE EDUCATION COMMANDS
%----------------------------------------------------------------------------------------
\newenvironment{Education}{%              % 요약문 생성 환경
    \if@isKorean
    	\roottitle{학\ 력\ 사\ 항} % Top level section
    \else
    	\roottitle{Education} % Top level section
    \fi
}{\spacedhrule{0.5em}{-0.4em} } % Horizontal rule - the first bracket is whitespace before and the second is after 

%----------------------------------------------------------------------------------------
%   DEFINE OTHERS COMMANDS
%----------------------------------------------------------------------------------------
\newenvironment{Others}{%              % 요약문 생성 환경
    \if@isKorean
        \roottitle{기\ 타\ 사\ 항} % Top level section
    \else
        \roottitle{Honors, Awards, and Patent} % Top level section
    \fi
}{\spacedhrule{0.5em}{-0.4em} } % Horizontal rule - the first bracket is whitespace before and the second is after 

%----------------------------------------------------------------------------------------
%	DEFINE WORK EXPERIENCE COMMANDS
%----------------------------------------------------------------------------------------
\newenvironment{Work}{%              % 요약문 생성 환경
    \if@isKorean
    	\roottitle{경\ 력\ 사\ 항} % Top level section
    \else
    	\roottitle{Work Experience} % Top level section
    \fi
}{\spacedhrule{0.5em}{-0.4em}} % Horizontal rule - the first bracket is whitespace before and the second is after 

%----------------------------------------------------------------------------------------
%   DEFINE WORK EXPERIENCE COMMANDS
%----------------------------------------------------------------------------------------
\newenvironment{Reference}{%              % 요약문 생성 환경
    \if@isKorean
        \roottitle{레퍼런스} % Top level section
    \else
        \roottitle{Reference} % Top level section
    \fi
}{\spacedhrule{0.5em}{-0.4em}} % Horizontal rule - the first bracket is whitespace before and the second is after 

%----------------------------------------------------------------------------------------
%	DEFINE PROJECT COMMANDS
%----------------------------------------------------------------------------------------
\newenvironment{Project}{%              % 요약문 생성 환경
    \if@isKorean
    	\if@isFull
    		\roottitle{과\ 제\ 수\ 행\ 경\ 험} % Top level section
    	\else
    		\roottitle{대\ 표\ 과\ 제\ 수\ 행\ 경\ 험} % Top level section
    	\fi
    \else
    	\if@isFull
    		\roottitle{Project Experience} % Top level section
    	\else
    		\roottitle{Representative Project Experience} % Top level section
    	\fi
    \fi
}
{
\if@isKorean
    	\if@isFull
    		
    	\else
    		\begin{center}
			\textit{현재까지 수행한 모든 프로젝트 목록은 \href{http://smslab.kaist.ac.kr/~cbchoi}{홈페이지}를 참조 부탁드립니다..}
			\end{center}
		\fi
    \else
    	\if@isFull
    		
    	\else
    		\begin{center}
			\textit{Please refer to \href{http://smslab.kaist.ac.kr/~cbchoi}{my homepage} for the complete list of project 	experiences.}
			\end{center}
		\fi
    \fi	
\spacedhrule{0.5em}{-0.4em}} % Horizontal rule - the first bracket is whitespace before and the second is after 

%----------------------------------------------------------------------------------------
%   DEFINE PUBLICATION EXPERIENCE COMMANDS
%----------------------------------------------------------------------------------------
\newenvironment{Publication}{%              % 요약문 생성 환경
    \if@isKorean
        \if@isFull
            \roottitle{논\ 문} % Top level section
        \else
            \roottitle{대\ 표\ 논\ 문} % Top level section
        \fi
    \else
        \if@isFull
            \roottitle{Publications} % Top level section
        \else
            \roottitle{Representative Publications} % Top level section
        \fi
    \fi
}
{
\if@isKorean
        \if@isFull
            
        \else
            \begin{center}
            \textit{현재까지의 논문 목록은 \href{http://smslab.kaist.ac.kr/~cbchoi}{홈페이지}를 참조 부탁드립니다..}
            \end{center}
        \fi
    \else
        \if@isFull
            
        \else
            \begin{center}
            \textit{Please refer to \href{http://smslab.kaist.ac.kr/~cbchoi}{my homepage} for the complete list of publications.}
            \end{center}
        \fi
    \fi 
\spacedhrule{0.5em}{-0.4em}} % Horizontal rule - the first bracket is whitespace before and the second is after


%----------------------------------------------------------------------------------------
%	DEFINE STRUCTURAL COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\ResumeEducationSection}[6]{
	\if@isKorean
    	\headedsection{#1}{\textsc{#3}}{#5}
    \else
    	\headedsection{#2}{\textsc{#4}}{#6}
    \fi
}

\newcommand{\ResumeSectionWithSubSection}[5]{
	\if@isKorean
    	\headedsection{#1}{\textsc{#3}}{#5}
    \else
    	\headedsection{#2}{\textsc{#4}}{#5}
    \fi
}

\newcommand{\ResumeSubSection}[5]{
	\if@isKorean
    	\headedsubsection{#1}{#3}{#4}
    \else
    	\headedsubsection{#2}{#3}{#5}
    \fi
}

\newcommand{\TypeItem}[2]{
    \if@isFull
        \item #2
    \else
        \ifthenelse{\equal{#1}{rep}}{
            \item #2
        }
        {}
    \fi 
}

\newcommand{\TypeSectionWithSubSection}[6]{
	\if@isFull
		\if@isKorean
	    	\headedsection{#2}{\textsc{\textsmaller{#4}}}{#6}
	    \else
	    	\headedsection{#3}{\textsc{\textsmaller{#5}}}{#6}
	    \fi
	\else
		\ifthenelse{\equal{#1}{rep}}{
			\if@isKorean
		    	\headedsection{#2}{\textsc{\textsmaller{#4}}}{#6}
		    \else
		    	\headedsection{#3}{\textsc{\textsmaller{#5}}}{#6}
		    \fi
		}
		{}
	\fi	
}

\newenvironment{indentsection} % Defines the indentsection environment which indents text in sections titles
{\begin{list}{}{\setlength{\leftmargin}{\newparindent}\setlength{\parsep}{0pt}\setlength{\parskip}{0pt}\setlength{\itemsep}{0pt}\setlength{\topsep}{0pt}}}{\end{list}}

\newcommand*\roottitle[1]{\subsection*{#1}\vspace{-0.3em}\nopagebreak[4]} % Top level sections in the template

\newcommand{\headedsection}[3]{\nopagebreak[4]\begin{indentsection}\item[]\textscale{1.1}{#1}\hfill#2#3\end{indentsection}\nopagebreak[4]} % Section title used for a new employer

\newcommand{\headedsubsection}[3]{\nopagebreak[4]\begin{indentsection}\item[]\textbf{#1}\hfill\emph{#2}#3\end{indentsection}\nopagebreak[4]} % Section title used for a new position

\newcommand{\bodytext}[1]{\nopagebreak[4]\begin{indentsection}\item[]#1\end{indentsection}\pagebreak[2]} % Body text (indented)

\newcommand{\headedsubpublication}[2]{\nopagebreak[4]\begin{indentsection}\item[]\textbf{#1}#2\end{indentsection}\nopagebreak[4]} % Section title used for a new publication

\newcommand{\inlineheadsection}[2]{\begin{basedescript}{\setlength{\leftmargin}{\doubleparindent}}\item[\hspace{\newparindent}\textbf{#1}]#2\end{basedescript}\vspace{-1.7em}} % Section title where body text starts immediately after the title

\newcommand*\acr[1]{\textscale{.85}{#1}} % Custom acronyms command

\newcommand*\bull{\ \ \raisebox{-0.365em}[-1em][-1em]{\textscale{4}{$\cdot$}} \ } % Custom bullet point for separating content

\newlength{\newparindent} % It seems not to work when simply using \parindent...
\addtolength{\newparindent}{\parindent}

\newlength{\doubleparindent} % A double \parindent...
\addtolength{\doubleparindent}{\parindent}

\newcommand{\breakvspace}[1]{\pagebreak[2]\vspace{#1}\pagebreak[2]} % A custom vspace command with custom before and after spacing lengths
\newcommand{\nobreakvspace}[1]{\nopagebreak[4]\vspace{#1}\nopagebreak[4]} % A custom vspace command with custom before and after spacing lengths that do not break the page

\newcommand{\spacedhrule}[2]{\breakvspace{#1}\hrule\nobreakvspace{#2}} % Defines a horizontal line with some vertical space before and after it