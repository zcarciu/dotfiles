alias find_large_subdirs="du -sh *  | egrep -v '[0-9]+(\.[0-9]+)?(K|B)' | egrep -v '[^0-9][0-9](\.[0-9]+)?M'"

alias refresh_aliases='. ~/.bash_aliases; echo aliases refreshed'

alias col_to_list="sed 's/$/,/ ' | tr '\n' ' ' | sed 's/^/\[/' | sed 's/$/\]\n/'"
alias str_col_to_list="sed -E \"s/(^|$)/'/g\" | sed 's/$/,/ ' | tr '\n' ' ' | sed 's/^/\[/' | sed 's/$/\]\n/'"

alias h=history

alias branch="git status | head -n 1 | cut -d' ' -f4-"

