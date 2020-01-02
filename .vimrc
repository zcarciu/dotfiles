"""""""""""""""""""
" tabbing/indenting
set autoindent
set smarttab
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4

" tabs are just spaces instead of tab characters
set expandtab

" insert-paste mode avoids the extra indents that get added when pasting
" indented text - toggle by pressing F2 in insert mode
" https://stackoverflow.com/a/2514520
set pastetoggle=<F2>

let mapleader = "\\"
inoremap <Leader>] import ipdb; ipdb.set_trace()

""""""""""""""""""
" pathogen
execute pathogen#infect()


"""""""""""""""""""
" display/info

colorscheme koehler

" set search match color scheme
hi Search guibg=peru guifg=wheat

" make it so your cursor is always in the middle of the buffer (if possible)
set scrolloff=9999

" show if you are in insert/visual mode
set showmode

set number


" I forget why these are here
syntax enable
filetype plugin on


set wildmenu

"""""""""""""""""""
"" statusline

"" always show statusline
"set laststatus=2

"" statusline helper functions
"" both of these taken from https://shapeshed.com/vim-statuslines/
"function! GitBranch()
"    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction

"function! StatuslineGit()
"    let l:branchname = GitBranch()
"    return strlen(l:branchname) > 0?''.l:branchname.'':''
"endfunction

"" status line documentation: http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
"set statusline=
"set statusline+=%#MatchParen#        " Set highlight scheme
"set statusline+=(%{StatuslineGit()}) " Print git branch
"set statusline+=%#LineNr#            " Set highlight scheme
"set statusline+=\ %.40F              " Full path to the file (max width of 40 chars)
"set statusline+=%=                   " Switch to the right side
"set statusline+=Buf:%n               " Buffer number
"set statusline+=\ Line:              " Label
"set statusline+=%l                   " Current line
"set statusline+=/                    " Separator
"set statusline+=%L                   " Total lines
"set statusline+=\ Col:%c             " Current column


"""""""""""""""""""
" other stuff

" For finding files (taken from https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim)
" Search down into subfolders
" Provides tab completion for all file related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" netrw (vim's built-in filesystem - ':help netrw')
let g:netrw_liststyle = 3


""""""""""""""""""
" Mappings

" map kj to <Esc
inoremap kj <Esc>

" open vimrc
" can't use ctrl-c in normal mode anyway
nnoremap <C-c> :edit ~/.vimrc <CR>


" Both of below adapted from
" https://vim.fandom.com/wiki/Move_to_next/previous_line_with_same_indentation
 
" Find next char in current column (useful for jumping from if to else in python)
nnoremap <C-n> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>
" Find previous in current column
nnoremap <C-p> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>


" convenient tab movement
nnoremap tn :tabn<cr>
nnoremap tp :tabp<cr>

inoremap <Leader>] import ipdb; ipdb.set_trace()




"""""""""""""""""""
" Functions

" highlight column in csv
" taken from https://vim.fandom.com/wiki/Working_with_CSV_files
function! CSVH(colnr)
    if a:colnr>1
        let n = a:colnr - 1
        execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
        execute 'normal! 0'.n.'f,'
    elseif a:colnr ==1
        match Keyword /^[^,]*/
        normal! 0
    else
        match
    endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)


" Say you have a file named MyScript.py, this ones a file named
" MyScriptTest.py
function! OTest()
    " filename without extension
    let filename = expand('%:t:r') 
    execute 'find ' . filename . 'Test.py'
endfunction

command! OpenTest :call OTest()


" View a csv row vertically
"  - Matches up headers with values
"  - Makes it easy to see what the row consists of
function! VRow()
    let first_line = getbufline(bufnr(bufname('%')), 1)[0]
    let first_line_split = split(first_line, ",")
    let len_first_list_split = len(first_line_split)

    let current_line = getbufline(bufnr(bufname('%')), line('.'))[0]
    let current_line_split = split(current_line, ",")
    
    let total_buffer=''
    let i = len_first_list_split - 1
    while i >= 0
        call append(line('.'), ' * ' . first_line_split[i] . "\t" . current_line_split[i] )
        let i -= 1
    endwhile
endfunction

command! ViewRow :call VRow()


" The below function was taken from https://devel.tech/snippets/n/vIIMz8vZ/load-vim-source-files-only-if-they-exist/
" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" } 

call SourceIfExists("~/.vimrc.local")

nnoremap Y y$
map H ^
map L $
