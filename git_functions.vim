" both of these taken from https://shapeshed.com/vim-statuslines/
function! GitBranch()
    return system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'")
endfunction
" return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

