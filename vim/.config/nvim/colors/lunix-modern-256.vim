" Vim color file
" Name: lunix-modern-256
" Author: Daniel Beecham <daniel@lunix.se>
" Based on the colorscheme "devbox-dark-256" by Dee Sub Wun

set background=dark
set t_Co=256
let g:colors_name="lunix-modern-256"

let python_highlight_all = 1
let c_gnu = 1


""""""
" SYNTAX HIGHLIGHTING
""""""""""""""""""""""""
hi Constant         cterm=NONE         	    ctermfg=3      ctermbg=NONE
hi String           cterm=NONE              ctermfg=230         ctermbg=NONE
hi Character        cterm=NONE              ctermfg=149         ctermbg=NONE
hi Number           cterm=NONE              ctermfg=208         ctermbg=NONE
hi Boolean          cterm=NONE              ctermfg=208         ctermbg=NONE
hi Float            cterm=NONE              ctermfg=208         ctermbg=NONE
hi Comment          cterm=NONE	            ctermfg=246         ctermbg=235

" variable names
hi Identifier       cterm=NONE              ctermfg=45          ctermbg=NONE

" function names
hi Function         cterm=NONE              ctermfg=123          ctermbg=NONE

hi LinuxFunction cterm=none ctermfg=255 ctermbg=NONE

hi Statement        cterm=bold              ctermfg=1         ctermbg=NONE

" if
hi Conditional      cterm=bold              ctermfg=7         ctermbg=NONE
hi Repeat           cterm=bold              ctermfg=4         ctermbg=NONE
hi Label            cterm=bold              ctermfg=149         ctermbg=NONE
hi Operator         cterm=NONE              ctermfg=1         ctermbg=NONE

" global definitions are keywords
hi Keyword          cterm=NONE              ctermfg=253         ctermbg=NONE
hi Exception        cterm=NONE              ctermfg=170         ctermbg=NONE

hi PreProc          cterm=NONE              ctermfg=243         ctermbg=NONE
hi Include          cterm=NONE              ctermfg=243         ctermbg=NONE
hi Define           cterm=NONE              ctermfg=243         ctermbg=NONE

hi Macro            cterm=NONE              ctermfg=245         ctermbg=NONE
hi PreCondit        cterm=NONE              ctermfg=245         ctermbg=NONE

hi NormalType cterm=NONE ctermfg=253 ctermbg=NONE
hi Type             cterm=NONE              ctermfg=12         ctermbg=NONE
hi StorageClass     cterm=NONE              ctermfg=12         ctermbg=NONE

" A structure is a type, so link the two
hi link Structure Type

" typedefs too
hi link Typedef Type

hi Special          cterm=NONE              ctermfg=15          ctermbg=NONE
hi SpecialChar      cterm=NONE              ctermfg=15          ctermbg=NONE
hi Tag              cterm=NONE              ctermfg=1         ctermbg=NONE
hi Delimiter        cterm=NONE              ctermfg=15          ctermbg=NONE
hi SpecialComment   cterm=NONE              ctermfg=15          ctermbg=NONE
hi Debug            cterm=NONE              ctermfg=15          ctermbg=NONE

hi xmlTagName       cterm=NONE			    ctermfg=149			ctermbg=NONE
hi xmlCdata         cterm=NONE			    ctermfg=246			ctermbg=NONE
hi xmlAttrib        cterm=NONE			    ctermfg=110			ctermbg=NONE
hi htmlTagName      cterm=NONE			    ctermfg=149			ctermbg=NONE
hi htmlArg          cterm=NONE			    ctermfg=110			ctermbg=NONE
hi htmlItalic		cterm=NONE				ctermfg=253		    ctermbg=235

hi Underlined       cterm=underline         ctermfg=110         ctermbg=NONE

hi Ignore           cterm=NONE              ctermfg=15          ctermbg=NONE

hi Error            cterm=bold              ctermfg=15          ctermbg=9

hi Todo             cterm=NONE              ctermfg=15          ctermbg=149

"hi LocalVariable cterm=NONE ctermfg=244 ctermbg=NONE
hi link LocalVariable Identifier
hi GlobalVariable cterm=none ctermfg=55 ctermbg=45
hi GlobalConstant cterm=none ctermfg=231 ctermbg=45
hi Member cterm=NONE ctermfg=254 ctermbg=NONE
hi link Union Type

"2        Class           : Class
"2        DefinedName     : Define
"2        Enumerator      : Enumerator
"2        Function        : Function or method
"2        EnumerationName : Enumeration name
"2        Member          : Member (of structure or class)
"2        Structure       : Structure Name
"2        Type            : Typedef
"2        Union           : Union Name
"2        GlobalConstant  : Global Constant
"2        GlobalVariable  : Global Variable
"2        LocalVariable   : Local Variable
 


""""""
" INTERFACE
""""""""""""""""""""""""
hi Cursor           cterm=NONE              ctermfg=white       ctermbg=red
hi CursorLine       cterm=NONE			    ctermfg=NONE		ctermbg=236
hi CursorColumn     cterm=NONE			    ctermfg=NONE		ctermbg=236
hi Directory        cterm=NONE              ctermfg=149         ctermbg=NONE
hi ErrorMsg         cterm=bold              ctermfg=15          ctermbg=9
hi LineNr           cterm=NONE              ctermfg=245         ctermbg=NONE
hi MatchParen       cterm=bold              ctermfg=0           ctermbg=149
hi ModeMsg          cterm=NONE              ctermfg=15          ctermbg=NONE
hi MoreMsg          cterm=NONE              ctermfg=149         ctermbg=NONE
hi NonText          cterm=bold              ctermfg=239         ctermbg=NONE
hi Normal           cterm=NONE              ctermfg=245         ctermbg=NONE
hi Question         cterm=NONE              ctermfg=149         ctermbg=NONE
hi SpecialKey       cterm=NONE              ctermfg=250         ctermbg=NONE
hi Title            cterm=NONE              ctermfg=170         ctermbg=NONE
hi VertSplit        cterm=reverse           ctermfg=0	        ctermbg=240
hi WarningMsg       cterm=NONE              ctermfg=9           ctermbg=NONE
hi WildMenu         cterm=NONE              ctermfg=15          ctermbg=236
hi SignColumn       cterm=NONE              ctermfg=7           ctermbg=NONE


""""""
" TABS
""""""""""""""""""""""""
hi TabLine          cterm=bold,reverse      ctermfg=0	        ctermbg=240
hi TabLineFill      cterm=bold,reverse      ctermfg=0	        ctermbg=240
hi TabLineSel       cterm=bold,reverse      ctermfg=0	        ctermbg=240


""""""
" COMPLETION
""""""""""""""""""""""""
hi Pmenu            cterm=NONE              ctermfg=252 		ctermbg=75
hi PmenuSel         cterm=NONE              ctermfg=NONE	    ctermbg=75


""""""
" STATUS
""""""""""""""""""""""""
hi StatusLine       cterm=reverse      		ctermfg=111         ctermbg=0
hi StatusLineNC     cterm=reverse 	   		ctermfg=238	        ctermbg=245


""""""
" DIFF
""""""""""""""""""""""""
" hi DiffAdd          cterm=NONE              ctermfg=NONE        ctermbg=239
" hi DiffChange       cterm=NONE              ctermfg=NONE        ctermbg=170
" hi DiffDelete       cterm=bold              ctermfg=239         ctermbg=66
" hi DiffText         cterm=bold              ctermfg=15         	ctermbg=NONE
hi DiffAdd          cterm=NONE              ctermfg=2           ctermbg=NONE
hi DiffChange       cterm=NONE              ctermfg=3           ctermbg=NONE
hi DiffDelete       cterm=NONE              ctermfg=1           ctermbg=NONE
hi DiffText         cterm=NONE              ctermfg=NONE      	ctermbg=NONE


""""""
" VISUAL
""""""""""""""""""""""""
hi Visual           cterm=NONE              ctermfg=15         	ctermbg=239
hi VisualNOS        cterm=NONE              ctermfg=15         	ctermbg=239


""""""
" FOLDING
""""""""""""""""""""""""
hi Folded           cterm=NONE              ctermfg=244 		ctermbg=NONE
hi FoldColumn       cterm=NONE              ctermfg=8          ctermbg=NONE


""""""
" SEARCH
""""""""""""""""""""""""
hi IncSearch        cterm=bold              ctermfg=0          ctermbg=11
hi Search           cterm=bold              ctermfg=11         ctermbg=NONE


hi Conceal          cterm=NONE              ctermfg=12         ctermbg=NONE


"vim: sw=4
