# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/dliu/.oh-my-zsh"

ZSH_THEME="robbyrussell"
DISABLE_MAGIC_FUNCTIONS=true

# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"

# plugins=(git)

source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias zshconf="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshlocal='$EDITOR $HOME/.zshrc.local'

alias grep='grep --color'
alias rg='rg --type-add "web:*.{html,css,scss,js,jsx}" --smart-case --max-columns=1000'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fzfo() {
    local file
    file=$(fzf)
    [[ -n "$file" ]] && vim "$file"
}
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules" --glob "!.yalc"'

# git
alias gitb='git branch'
alias gitd='git diff'
alias gitf='git fetch'
alias gitl='git log'
alias gitp='git pull'
alias gits='git status'

# npm
alias npmls='npm list --depth=0 2>/dev/null'
alias npmlsg='npm list -g --depth=0 2>/dev/null'
alias npmlsd='npm list --dev --depth=0 2>/dev/null'

# pip
alias pipuninstall='pip freeze | grep -v "^-e" | xargs pip uninstall -y'

# tmux
alias tmux="tmux -2"
alias tls="tmux ls"
alias tma="tmux a -t"
alias tmn="tmux new -s"

# cd
alias cdc='cd $HOME/code'
alias cdgo='cd $GOPATH/src'
alias sshconf='$EDITOR $HOME/.ssh/config'
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

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE

HYPHEN_INSENSITIVE="true"

autoload bashcompinit && bashcompinit

NEWLINE=$'\n'
PROMPT='%{$fg[blue]%}[%*]%{$reset_color%} %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)$NEWLINE'
PROMPT+="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# load local configs
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
