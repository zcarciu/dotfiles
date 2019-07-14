#!/bin/bash

# taken from here:
# https://www.freecodecamp.org/news/dive-into-dotfiles-part-2-6321b4a73608/

for file in $(ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md|\.swp$')
do
    ln -sv "$PWD/$file" "$HOME"
done
