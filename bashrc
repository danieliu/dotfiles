#!/bin/bash
# dliu .bashrc
# https://dotfiles.github.io/
# <https://raw.github.com/rtomayko/dotfiles/rtomayko/.bashrc>

# the basics
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# complete hostnames from this file
: ${HOSTFILE=~/.ssh/known_hosts}

# readline config
: ${INPUTRC=~/.inputrc}

# ----------------------------------------------------------------------
#  SHELL OPTIONS
# ----------------------------------------------------------------------

test -r /etc/bashrc &&
      . /etc/bashrc

# notify bg job completion immediately
set -o notify

# shell opts
shopt -s histappend >/dev/null 2>&1

# etc
export IGNOREEOF=1

# Command history
HISTCONTROL=ignoreboth
HISTFILESIZE=
HISTSIZE=
HISTTIMEFORMAT="%F %T: "

# ----------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------

test -d "$HOME/bin" &&
   PATH="$HOME/bin:$PATH"

PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# ----------------------------------------------------------------------
# EDITOR
# ----------------------------------------------------------------------

# See what we have to work with ...
HAVE_VIM=$(command -v vim)

# EDITOR
test -n "$HAVE_VIM" &&
    EDITOR=vim ||
    EDITOR=vi
export EDITOR

# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------

RED="\[\033[0;31m\]"
BROWN="\[\033[0;33m\]"
GREY="\[\033[0;97m\]"
DGREEN="\[\033[0;32m\]"
GREEN="\[\033[1;32m\]"
YELLOW="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
LAVENDER="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
PURPLEALT="\[\033[1;35m\]"
CYAN="\[\033[1;36m\]"
WHITE="\[\033[0;1m\]"
ENDCOLOR="\033[0;39m\]"
PS_CLEAR="\[\033[0m\]"
SCREEN_ESC="\[\033k\033\134\]"

if [ "$PS1" ]; then
    if [[ $UID -eq 0 ]]; then
        PS1="$LAVENDER[\t] $RED\u@\h:$BLUE\w$PS_CLEAR\n# "
    else
        PS1="$LAVENDER[\t] $CYAN\u@\h:$BLUE\w$DGREEN\$(__git_ps1)$PS_CLEAR\n$ "
    fi
    # export PS1=" "$PS1"\[\e]30;\u@\h\a\]"
fi

# ----------------------------------------------------------------------
# ALIASES / FUNCTIONS
# ----------------------------------------------------------------------

alias grep='grep --color'
alias rg='rg --type-add "web:*.{html,css,scss,js,jsx}" --smart-case --max-columns=150'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files'

# git
alias gitb='git branch'
alias gitco='git checkout'
alias gitcob='git checkout -b'
alias gitd='git diff'
alias gitf='git fetch'
alias gitl='git log'
alias gitmf='git merge --ff-only'
alias gitp='git pull'
alias gits='git status'

# npm
alias npmls='npm list --depth=0 2>/dev/null'
alias npmlsg='npm list -g --depth=0 2>/dev/null'
alias npmlsd='npm list --dev --depth=0 2>/dev/null'

# etc
alias bprofile='$EDITOR $HOME/.bash_profile.local'

# ----------------------------------------------------------------------
# BASH COMPLETION
# ----------------------------------------------------------------------

test -z "$BASH_COMPLETION" && {
    bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
    test -n "$PS1" && test $bmajor -gt 1 && {
        # search for a bash_completion file to source
        for f in /usr/local/etc/bash_completion \
                 /usr/pkg/etc/bash_completion \
                 /opt/local/etc/bash_completion \
                 /etc/bash_completion
        do
            test -f $f && {
                . $f
                break
            }
        done
    }
    unset bash bmajor bminor
}
test -r "/usr/local/git/contrib/completion/git-completion.bash" &&
      . "/usr/local/git/contrib/completion/git-completion.bash"
test -r "/usr/local/git/contrib/completion/git-prompt.sh" &&
      . "/usr/local/git/contrib/completion/git-prompt.sh"

# ----------------------------------------------------------------------
# LS AND DIRCOLORS
# ----------------------------------------------------------------------

# we always pass these to ls(1)
LS_COMMON='-hBG'

# if the dircolors utility is available, set that up to
dircolors="$(type -P gdircolors dircolors | head -1)"
test -n "$dircolors" && {
    COLORS=/etc/DIR_COLORS
    test -e "/etc/DIR_COLORS.$TERM"   && COLORS="/etc/DIR_COLORS.$TERM"
    test -e "$HOME/.dircolors"        && COLORS="$HOME/.dircolors"
    test ! -e "$COLORS"               && COLORS=
    eval `$dircolors --sh $COLORS`
}
unset dircolors

# setup the main ls alias if we've established common args
test -n "$LS_COMMON" &&
    alias ls="command ls $LS_COMMON"

# these use the ls aliases above
alias ll='ls -l'
alias la='ls -al'

