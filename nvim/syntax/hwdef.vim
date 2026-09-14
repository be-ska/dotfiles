" Basic syntax for ArduPilot hwdef files (hwdef.dat / hwdef.inc)
if exists("b:current_syntax")
  finish
endif

syn match  hwdefNumber  "\<\d\+\>"
syn match  hwdefNumber  "\<0x\x\+\>"
syn match  hwdefKeyword "^\s*\(include\|define\|undef\|env\)\>"
syn region hwdefString  start=+"+ end=+"+
syn match  hwdefComment "#.*$"

hi def link hwdefKeyword Keyword
hi def link hwdefNumber  Number
hi def link hwdefString  String
hi def link hwdefComment Comment

let b:current_syntax = "hwdef"
