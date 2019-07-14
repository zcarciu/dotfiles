
install_packages() {
    if [ -f "/etc/debian_version" ];
    then
        echo "This will install useful utilities using apt"
        echo "Proceed? (y/n)"
        read resp
        if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
            echo "Installing packages using apt"
            sh apt.exclude.sh
            echo "Done installing stuff"
        else
            echo "apt installation cancelled by user"
        fi
    else
        echo "Skipping apt installations using apt because debian was not detected"
    fi
}

link() {
    echo "This utility will symlink the files in this repo to the home directory"
    echo "Proceed? (y/n)"
    read resp
    if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
        for file in $(ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md|\.swp$')
        do
            ln -sv "$PWD/$file" "$HOME"
        done
    else
        echo "Symlinking cancelled by user"
    fi
}

install_packages
link
