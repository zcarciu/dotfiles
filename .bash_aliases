# the first grep filters out bytes and KB, the second filters out M under 100M
alias find_large_subdirs="du -sh *  | egrep -v '[0-9]+(\.[0-9]+)?(K|B)' | egrep -v '[^0-9][0-9](\.[0-9]+)?M'"

alias refresh_aliases='. ~/.bash_aliases; echo aliases refreshed'

# run echo " <paste-column-here> " | col_to_list
alias col_to_list="sed 's/$/,/ ' | tr '\n' ' ' | sed 's/^/\[/' | sed 's/$/\]\n/'"
alias str_col_to_list="sed -E \"s/(^|$)/'/g\" | sed 's/$/,/ ' | tr '\n' ' ' | sed 's/^/\[/' | sed 's/$/\]\n/'"

alias h=history

alias branch="git status | head -n 1 | cut -d' ' -f4-"

alias ll="ls -lrth"
alias lla="ls -lrthA"

alias nose="nosetests -s"
if [ -f $HOME/.bash_aliases.local ]
    then
    source $HOME/.bash_aliases.local
fi

