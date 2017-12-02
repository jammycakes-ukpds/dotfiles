#!/bin/bash

# Detect the OS

case "$OSTYPE" in
    darwin*)
        TARGET_OS=osx
        ;;
    linux*)
        TARGET_OS=linux

        # enable programmable completion features (you don't need to enable
        # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
        # sources /etc/bash.bashrc).
        if ! shopt -oq posix; then
            if [ -f /usr/share/bash-completion/bash_completion ]; then
                . /usr/share/bash-completion/bash_completion
            elif [ -f /etc/bash_completion ]; then
                . /etc/bash_completion
            fi
        fi

        ;;
    *)
        TARGET_OS=""
        ;;
esac

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\e[92m\]\[\e[1m\]\u\[\e(B\e[m\]\[\e[96m\] \w\[\e[91m\]\$(parse_git_branch)\n\[\e[90m\]\!\[\e[97m\] $ "

alias ls="ls -G"

PATH=$PATH:~/.bin:~/.bin/dotfiles

cd-git-root() {
    chdir "$(git root)"
}

if [ "$TARGET_OS" = "osx" ]; then
    export LSCOLORS=gxfxcxdxbxegedabagacad
fi

# Define pbcopy and pbpaste

if ! which pbcopy > /dev/null; then
    if which xclip > /dev/null; then
        alias pbcopy='xclip -selection clipboard'
        alias pbpaste='xclip -selection clipboard -o'
    fi
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
