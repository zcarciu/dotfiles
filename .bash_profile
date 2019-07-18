source ~/.bash_aliases

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[35m\]\w\[\033[33m\]\[\033[1m\]\$(parse_git_branch)\[\033[00m\] $ "
