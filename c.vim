"========================================================
" Highlight All Function
"========================================================
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match   cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunction        gui=NONE guifg=#B73838 ctermfg=darkblue cterm=bold


"========================================================
" Highlight All Math Operator
"========================================================
" C math operators
syn match       cMathOperator     display "[-+\*%=]"
"" C pointer operators
syn match       cPointerOperator  display "->\|\.\|\:\:"
" C logical   operators - boolean results
syn match       cLogicalOperator  display "[!<>]=\="
syn match       cLogicalOperator  display "=="
" C bit operators
syn match       cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
syn match       cBinaryOperator   display "\~"
syn match       cBinaryOperatorError display "\~="
" More C logical operators - highlight in preference to binary
syn match       cLogicalOperator  display "&&\|||"
syn match       cLogicalOperatorError display "\(&&\|||\)="

" More C priority operators - highlight in preference to binary
syn match       cpriorityperator  display "(\|)\|\[\|\]\|{\|}"

" Math Operator
hi cMathOperator            guifg=#9AC0CD ctermfg=grey
"hi cPointerOperator         guifg=#EEAEEE ctermfg=grey
hi cBinaryOperator          guifg=#BBFFFF ctermfg=darkgreen
hi cBinaryOperatorError     guifg=#C0FF3E ctermfg=yellow
hi cLogicalOperator         guifg=#C0FF3E ctermfg=white
"hi cLogicalOperatorError    guifg=#C0FF3E ctermfg=red
"hi cpriorityperator     guifg=#CDAD00 ctermfg=red


