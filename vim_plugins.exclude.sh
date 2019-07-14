
# install pathogen
if [ -f .vim/autoload/pathogen.vim ]
    then
    echo "Pathogen is already installed"
else
    mkdir -p .vim/autoload .vim/bundle && \
    curl -LSso .vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi


# install fugitive
if [ -d .vim/bundle/vim-fugitive ]
    then
    echo "vim-fugitive is already installed"
else
    git clone https://github.com/tpope/vim-fugitive.git .vim/bundle/vim-fugitive
    vim -u NONE -c "helptags vim-fugitive/doc" -c q
fi


# install surround
if [ -d .vim/bundle/vim-surround ]
    then
    echo "vim-surround is already installed"
else
    git clone https://github.com/tpope/vim-surround.git .vim/bundle/vim-surround
    vim -u NONE -c "helptags vim-surround/doc" -c q
fi

