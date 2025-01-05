" Vim syntax file
" Language: NRDL
" Maintainer: Daniel Jay Haskin <me@djha.skin>
" Last Change: 2023-04-23
" Version: 0.1.0

if !exists("main_syntax")
    " Quit if already loaded
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = "nrdl"
endif
" Case sensitive
syntax case match

setlocal iskeyword+=',-

syntax region nrdlComment start=/#/ end=/$/

syntax keyword nrdlBoolean true 'true' false 'false'
syntax keyword nrdlNull null 'null'
syntax match nrdlBarewordSymbol /[^-.0-9\%x5D\%x5B{}>|[:blank:]#][^[:blank:]]*/
syntax region nrdlQuotedSymbol start=/'/ skip=/\\'/ end=/'/
syntax cluster nrdlSymbol contains=nrdlQuotedSymnbol,nrdlBarewordSymbol

syntax match nrdlNumber /\(0\|[1-9-.][0-9-.eE]*\)/

syntax region nrdlQuotedString start=/"/ skip=/\\"/ end=/"/

syntax match nrdlEndMultiline /^[:,[:blank:]]*\^/
syntax region nrdlVerbatim start=/[:,[:blank:]]*|/ end=/$/ nextgroup=nrdlVerbatim,nrdlEndMultiline 
syntax region nrdlProse start=/[:,[:blank:]]*>/ end=/$/ nextgroup=nrdlProse,nrdlEndMultiline
syntax cluster nrdlString contains=nrdlQuotedString,ndrlVerbatim,nrdlProse,nrdlEndMultiline

syntax region nrdlObject matchgroup=nrdlBraces start=/{/ end=/}/ contains=ALL
syntax region nrdlArray matchgroup=nrdlBrackets start=/\[/ end=/\]/ contains=ALL
syntax cluster nrdlDelimiter contains=nrdlBraces,nrdlBrackets

hi def link nrdlComment        Comment
hi def link nrdlQuotedString   String
hi def link nrdlVerbatim       String
hi def link nrdlProse          String
hi def link nrdlEndMultiline   String
hi def link nrdlBarewordSymbol Label
hi def link nrdlQuotedSymbol   Label
hi def link nrdlBraces         Delimiter
hi def link nrdlBrackets       Delimiter
hi def link nrdlNumber         Number
hi def link nrdlNull           Function
hi def link nrdlBoolean        Boolean

let b:current_syntax = "nrdl"
if main_syntax == 'nrdl'
  unlet main_syntax
endif
