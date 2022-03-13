if exists("b:current_syntax")
  finish
endif

" parenthesis sanity checker
syn region lmZone	matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" transparent contains=ALLBUT,lmError,lmBraceError,lmCurlyError
syn region lmZone	matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" transparent contains=ALLBUT,lmError,lmBraceError,lmParenError
syn region lmZone	matchgroup=Delimiter start="\[" matchgroup=Delimiter end="]" transparent contains=ALLBUT,lmError,lmCurlyError,lmParenError
"
"syn region lmZone	matchgroup=Delimiter start="lbrace" matchgroup=Delimiter end="rbrace" transparent contains=lmRbraceError
"syn match  Error	"rbrace"
"syn match  lmRbraceError	"[rbrace]"	contained
"
syn match  lmError	"[)\]}]"
syn match  lmBraceError	"[)}]"	contained
syn match  lmCurlyError	"[)\]]"	contained
syn match  lmParenError	"[\]}]"	contained
syn match  lmComma	"[,;:]"
syn match  lmComma	"\.\.\.$"

" A bunch of useful lm keywords
syn case ignore

" ###############################################################################################################3
syn keyword lmFuncCmd	newline	over	color	bold	underline	ital	color
"syn keyword lmFuncCmd	
"logic operators
syn keyword lmStatement	and	or	drarrow	dlarrow	dlrarrow 	neg	exists	forall
"nie dziala - interpretuje tylko pierwszy symbol: syn match   lmCmd	"+"	"="
"dzialania arytmetyczne
syn keyword lmFunc	cdot	div	plusminus	minusplus	sqrt	nroot	divides	ndivides
"set operations
syn keyword lmFunc	union	intersection	setminus	slash	in 	ni 	notin	subset	subseteq	supset	supseteq	nsubset	nsubseteq	nsupset	nsupseteq
"zmienne z % na poczatku
syn keyword lmConditional	emptyset	setn	setz	setc	setq	setr
"syn keyword   xMaciek	
syn match   lmAlpha             "%[a-zA-Z]*"
"syn match   lmAlpha             "%DELTA"
syn keyword xMaciek	langle	rangle	lbrace 	rbrace
" ###############################################################################################################3

"syn case match

" Labels (supports lm's goto)
syn match   lmLabel	 "^\s*<[a-zA-Z_][a-zA-Z0-9]*>"

" String and Character constants
" Highlight special characters (those which have a backslash) differently
syn match   lmSpecial	contained "\\\d\d\d\|\\."
syn region  lmString	start=+"+  skip=+\\\\\|\\"+  end=+"+ contains=lmSpecial,@Spell
syn match   lmCharacter	"'[^\\]'"
syn match   lmSpecialChar	"'\\.'"

syn match   lmNumber	"-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"

" Comments:
" lm supports #...  (like Unix shells)
"       and      #{ ... }# comment blocks
syn cluster lmCommentGroup	contains=lmString,lmTodo,@Spell
syn keyword lmTodo contained	COMBAK	DEBUG	FIXME	Todo	TODO	XXX
syn match   lmComment	"%%.*$"		contains=@lmCommentGroup
syn region  lmCommentBlock	start="#{" end="}#"	contains=@lmCommentGroup

" synchronizing
syn sync match lmSyncComment	grouphere lmCommentBlock "#{"
syn sync match lmSyncComment	groupthere NONE "}#"

" Define the default highlighting.
if !exists("skip_lm_syntax_inits")

  hi def link lmBraceError	lmError
  hi def link lmCommentBlock	lmComment
  hi def link lmCurlyError	lmError
  hi def link lmParenError	lmError
"  hi def link lmRbraceError	lmError
  hi def link lmFuncCmd	Statement
  hi def link lmStatement	Underlined
  hi def link lmCmd	Type
  hi def link lmFunc	Identifier
  hi def link lmConditional	Todo
  hi def link lmAlpha	Todo
  hi def link lmRepeat	Repeat
  hi def link xMaciek	Special

  " The default methods for highlighting.  Can be overridden later
  hi def link lmCharacter	Character
  hi def link lmComma	Delimiter
  hi def link lmComment	Comment
  hi def link lmCommentBlock	Comment
  hi def link lmError	Error
  hi def link lmLabel	PreProc
  hi def link lmNumber	Number
  hi def link lmSpecial	Type
  hi def link lmSpecialChar	SpecialChar
  hi def link lmString	String
  hi def link lmTodo	Todo

endif

let b:current_syntax = "lm"

" vim: ts=17
