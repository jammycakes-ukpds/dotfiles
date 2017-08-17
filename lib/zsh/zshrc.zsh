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


# ====== From http://askubuntu.com/questions/1577/moving-from-bash-to-zsh ====== #

# This gives you more extensive tab completion.
autoload -Uz compinit
compinit

# Tab completion from both ends.
setopt completeinword

# Tab completion should be case-insensitive.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Better completion for killall.
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# Changes the definition of "word", e.g. with ^W.

autoload select-word-style
select-word-style shell

# Colours for ls

alias ls='ls -G'

# Shortcuts for ls
alias ll='ls -l'
alias la='ls -a'

# One history for all open shells; store 10,000 entries. This makes this into a
# useful memory aid to find the commands you used last time for ./configure etc.
# Use Alt-P (find command that starts like this) and ^R (search in history)
# liberally.
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

# Enables all sorts of extended globbing, such as ls **/*.txt (find all text
# files), ls -d *(D) (show all files including those starting with "."). To find
# out more, go to man zshexpn, section "FILENAME GENERATION".
setopt extendedglob
unsetopt caseglob

# This is useful to remember commands in your history without executing them.
setopt interactivecomments # pound sign in interactive prompt

# Type ".." instead of "cd ..", "/usr/include" instead of "cd /usr/include".
setopt auto_cd

# Display CPU usage stats for commands taking more than 10 seconds
REPORTTIME=10


# ====== Further customisations by me ====== #

#So we can insert the Git status
setopt PROMPT_SUBST

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


export GOPATH=~/go
mkdir -p $GOPATH

PATH=$PATH:~/.bin:~/.bin/dotfiles:$GOPATH/bin

git-cd() {
    if $1; then
        chdir "$(git root)/$1"
    else
        chdir "$(git root)"
    fi
}

if [ "$TARGET_OS" = "osx" ]; then
    export LSCOLORS=gxfxcxdxbxegedabagacad
fi


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Define pbcopy and pbpaste

if ! which pbcopy > /dev/null; then
    if which xclip > /dev/null; then
        alias pbcopy='xclip -selection clipboard'
        alias pbpaste='xclip -selection clipboard -o'
    fi
fi
