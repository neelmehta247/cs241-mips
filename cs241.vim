" Vim syntax file
" Language: MIPS
" Maintainer:   Alex Brick <alex@alexrbrick.com>
" Last Change:  2007 Oct 18

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=-
syntax case match

syntax match mipsComment /;.*/
syntax match mipsNumber /\<[-]\?\d\+\>/ " Decimal numbers
syntax match mipsNumber /\<-\?0\(x\|X\)[0-9a-fA-F]\+\>/ " Hex numbers
syntax match mipsLabel /\w\+:/

let i = 0
while i < 32
    " Registers
    execute 'syntax match mipsRegister "\$' . i . '\(\d\+\)\@!"'
    let i = i + 1
endwhile

" Directives
syntax match mipsDirective "\.word"

" Arithmetic and Logical Instructions
syntax keyword mipsInstruction add
syntax keyword mipsInstruction sub
syntax keyword mipsInstruction div divu 
syntax keyword mipsInstruction mult multu

" Constant-Manipulating Instructions
syntax keyword mipsInstruction slt sltu

" Branch Instructions
syntax keyword mipsInstruction beq
syntax keyword mipsInstruction bne

" Jump Instructions
syntax keyword mipsInstruction jalr jr

" Load Instructions
syntax keyword mipsInstruction lw
syntax keyword mipsInstruction lis

" Store Instructions
syntax keyword mipsInstruction sw

" Data Movement Instructions
syntax keyword mipsInstruction mfhi mflo

hi def link mipsComment        Comment
hi def link mipsNumber         Number
hi def link mipsString         String
hi def link mipsLabel          PreProc
hi def link mipsRegister       Type
hi def link mipsDirective      PreProc
hi def link mipsInstruction    Statement

let b:current_syntax = "mips"
