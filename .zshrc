# terminal
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# git completion
#fpath=(~/.zsh/completion $fpath)
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

# zsh-autosuggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# 配下の.DS_Storeと._xxx を削除
function removegomi () {
  find . \( -name '.DS_Store' -or -name '._*' \) -delete -print;
}
alias rmgomi=removegomi

# grep
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

# direnv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(direnv hook zsh)"

# anyenv
eval "$(anyenv init -)"

# go
export GOPATH="$HOME/go"
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$GOENV_ROOT/shims:$PATH

# yarn
export PATH="$PATH:/path/to/yarn/bin"

# mysql
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"

# Remove unnecessary PATH entries
typeset -U PATH
export PATH=$(echo $PATH | tr ':' '\n' | while read path; do [ -d "$path" ] && echo -n "$path:"; done | sed 's/:$//')
