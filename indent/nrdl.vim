" Vim indent file
" Language: NRDL
" Maintainer: Daniel Jay Haskin <me@djha.skin>
" Last Change: 2023-04-23
" Version: 0.1.0
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=NrdlIndent(v:lnum)

if exists("*NrdlIndent")
    finish
endif

function! s:NrdlIndent( line_number )
  if a:line_number == 0
      return 0
  endif

  let line = getline(a:line_number)
  let previous_num = prevnonblank(a:line_number - 1)
  let previous = getline(previous_num)
  let prev_prev_num = prevnonblank(previous_num - 1)
  let prev_prev = getline(prev_prev_num)

  if previous =~ "{[[:blank:]]*$" || previous =~ "\\[[[:blank:]]*$"
    return indent(previous_num) + &shiftwidth
  elseif line =~ "^[[:blank:]]*}" || line =~ "^[[:blank:]]*\\]"
    return indent(previous_num) - &shiftwidth
  else
    return indent(previous_num)
endfunction