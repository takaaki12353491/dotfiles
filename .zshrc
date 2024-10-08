# terminal
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

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

# dienv
eval "$(direnv hook zsh)"

# go
export PATH=$PATH:$(go env GOPATH)/bin
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
export PATH=$GOENV_ROOT/shims:$PATH #通常のターミナルとVSCodeの参照先を合わせる

# yarn
export PATH="$PATH:/path/to/yarn/bin"

# mysql
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"
