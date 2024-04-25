# zmodload zsh/zprof

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/danielliu/.oh-my-zsh"

ZSH_THEME="robbyrussell"
DISABLE_MAGIC_FUNCTIONS=true

# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"

# plugins=(git)

source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8
export EDITOR='vim'
export MANPAGER="vim -M +MANPAGER -"

export LESS='-Ri --incsearch'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias zshconf="vim ~/.zshrc"
alias zshhist="vim ~/.zsh_history"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshlocal="vim $HOME/.zshrc.local"
alias zshwork="vim $HOME/.zshrc.work"
alias vimrc="vim $HOME/.vimrc"
alias gitconf="vim $HOME/.gitconfig"

alias grep='grep --color'
alias rg='rg --type-add "web:*.{html,css,scss,js,jsx}" --smart-case --max-columns=10000'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fzfo() {
    local file
    file=$(fzf)
    [[ -n "$file" ]] && vim "$file"
}
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules" --glob "!.yalc"'
export FZF_DEFAULT_OPTS="
--bind 'ctrl-y:execute-silent(echo {} | pbcopy)'
--bind 'ctrl-alt-y:execute(readlink -f {} | pbcopy)'
"

# git
alias gitb='git branch'
alias gitd='git diff'
alias gitds='git diff --staged'
alias gitf='git fetch'
alias gitl='git log'
alias gitp='git pull'
alias gits='git status'
alias gitsu='git status -uno'
alias gitup='git pull && git rpo && git prune'

git-https() {
    git remote set-url origin https://github.com/$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')
}
git-ssh() {
    git remote set-url origin git@github.com:$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')
}

# npm
alias npmls='npm list --depth=0 2>/dev/null'
alias npmlsg='npm list -g --depth=0 2>/dev/null'
alias npmlsd='npm list --dev --depth=0 2>/dev/null'

# python, pip
alias pipuninstall='pip freeze | grep -v "^-e" | xargs pip uninstall -y'
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
alias da='deactivate'
alias venv3='virtualenv --python=`which python3` .venv3'
alias venv2='virtualenv --python=`which python2` .venv2'

# tmux
alias tmi='. $HOME/dotfiles/tmux/tmux-init.sh'
alias tmux="tmux -2"
alias tls="tmux ls"
alias tma="tmux a -t"
alias tmn="tmux new -s"

# docker
alias dps="docker ps"
alias di="docker inspect"
alias dco="docker-compose"
alias dcoup="docker-compose up -d"
alias dcostop="docker-compose stop"
alias dcops="docker-compose ps"
alias dcodown="docker-compose down"
alias dils="docker image ls -a"
alias dcls="docker container ls -a"
alias dvls="docker volume ls"
dstop() {
    docker stop `docker ps -q`
}

# cd
alias cdc='cd $HOME/code'
alias cddf='cd $HOME/dotfiles'
alias cdgo='cd $GOPATH/src'
alias sshconf='vim $HOME/.ssh/config'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias showhidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

# opts
# setopt -s HISTAPPEND >/dev/null 2>&1  # from bash
setopt CORRECT
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt IGNORE_EOF
# setopt INC_APPEND_HISTORY
unsetopt INC_APPEND_HISTORY
setopt APPEND_HISTORY
setopt NO_CASE_GLOB

DISABLE_UNTRACKED_FILES_DIRTY="true"

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=900000000
SAVEHIST=$HISTSIZE

HYPHEN_INSENSITIVE="true"

autoload bashcompinit && bashcompinit

NEWLINE=$'\n'
PROMPT='%{$fg[blue]%}[%*]%{$reset_color%} %{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt_info)$NEWLINE'
PROMPT+="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# load local configs
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# zprof

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Created by `pipx` on 2023-08-09 22:39:24
export PATH="$PATH:/Users/danielliu/.local/bin"

# Created by `pipx` on 2023-10-31 21:43:52
export PATH="$PATH:/Users/danielliu/Library/Python/3.11/bin"
