if exists("b:current_syntax")
  finish
endif

" parenthesis sanity checker
syn region xmathZone	matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" transparent contains=ALLBUT,xmathError,xmathBraceError,xmathCurlyError
syn region xmathZone	matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" transparent contains=ALLBUT,xmathError,xmathBraceError,xmathParenError
syn region xmathZone	matchgroup=Delimiter start="\[" matchgroup=Delimiter end="]" transparent contains=ALLBUT,xmathError,xmathCurlyError,xmathParenError
"
"syn region xmathZone	matchgroup=Delimiter start="lbrace" matchgroup=Delimiter end="rbrace" transparent contains=xmathRbraceError
"syn match  Error	"rbrace"
"syn match  xmathRbraceError	"[rbrace]"	contained
"
syn match  xmathError	"[)\]}]"
syn match  xmathBraceError	"[)}]"	contained
syn match  xmathCurlyError	"[)\]]"	contained
syn match  xmathParenError	"[\]}]"	contained
syn match  xmathComma	"[,;:]"
syn match  xmathComma	"\.\.\.$"

" A bunch of useful xmath keywords
syn case ignore

" ###############################################################################################################3
syn keyword xmathFuncCmd	newline	over	color	bold	underline	ital	color
"syn keyword xmathFuncCmd	
"logic operators
syn keyword xmathStatement	and	or	drarrow	dlarrow	dlrarrow 	neg	exists	forall
"nie dziala - interpretuje tylko pierwszy symbol: syn match   xmathCmd	"+"	"="
"dzialania arytmetyczne
syn keyword xmathFunc	cdot	div	plusminus	minusplus	sqrt	nroot	divides	ndivides
"set operations
syn keyword xmathFunc	union	intersection	setminus	slash	in 	ni 	notin	subset	subseteq	supset	supseteq	nsubset	nsubseteq	nsupset	nsupseteq
"zmienne z % na poczatku
syn keyword xmathConditional	emptyset	setn	setz	setc	setq	setr
"syn keyword   xMaciek	
syn match   xmathAlpha             "%[a-zA-Z]*"
"syn match   xmathAlpha             "%DELTA"
syn keyword xMaciek	langle	rangle	lbrace 	rbrace
" ###############################################################################################################3

"syn case match

" Labels (supports xmath's goto)
syn match   xmathLabel	 "^\s*<[a-zA-Z_][a-zA-Z0-9]*>"

" String and Character constants
" Highlight special characters (those which have a backslash) differently
syn match   xmathSpecial	contained "\\\d\d\d\|\\."
syn region  xmathString	start=+"+  skip=+\\\\\|\\"+  end=+"+ contains=xmathSpecial,@Spell
syn match   xmathCharacter	"'[^\\]'"
syn match   xmathSpecialChar	"'\\.'"

syn match   xmathNumber	"-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"

" Comments:
" xmath supports #...  (like Unix shells)
"       and      #{ ... }# comment blocks
syn cluster xmathCommentGroup	contains=xmathString,xmathTodo,@Spell
syn keyword xmathTodo contained	COMBAK	DEBUG	FIXME	Todo	TODO	XXX
syn match   xmathComment	"%%.*$"		contains=@xmathCommentGroup
syn region  xmathCommentBlock	start="#{" end="}#"	contains=@xmathCommentGroup

" synchronizing
syn sync match xmathSyncComment	grouphere xmathCommentBlock "#{"
syn sync match xmathSyncComment	groupthere NONE "}#"

" Define the default highlighting.
if !exists("skip_xmath_syntax_inits")

  hi def link xmathBraceError	xmathError
  hi def link xmathCommentBlock	xmathComment
  hi def link xmathCurlyError	xmathError
  hi def link xmathParenError	xmathError
"  hi def link xmathRbraceError	xmathError
  hi def link xmathFuncCmd	Statement
  hi def link xmathStatement	Underlined
  hi def link xmathCmd	Type
  hi def link xmathFunc	Identifier
  hi def link xmathConditional	Todo
  hi def link xmathAlpha	Todo
  hi def link xmathRepeat	Repeat
  hi def link xMaciek	Special

  " The default methods for highlighting.  Can be overridden later
  hi def link xmathCharacter	Character
  hi def link xmathComma	Delimiter
  hi def link xmathComment	Comment
  hi def link xmathCommentBlock	Comment
  hi def link xmathError	Error
  hi def link xmathLabel	PreProc
  hi def link xmathNumber	Number
  hi def link xmathSpecial	Type
  hi def link xmathSpecialChar	SpecialChar
  hi def link xmathString	String
  hi def link xmathTodo	Todo

endif

let b:current_syntax = "xmath"

" vim: ts=17
