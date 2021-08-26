if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

##
# oh my zsh
##
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lambda"
COMPLETION_WAITING_DOTS="true"

##
# Plugins
##
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_AUTOCONNECT=false

plugins=(fzf git docker jump tmux terraform)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

##
# Aliases
##
alias zshrc="$EDITOR ~/.zshrc"
alias glg="git log --pretty=format:'%C(yellow)%ad %Cblue%an %Cgreen%h %Creset%s' --date=short"
alias glgmy="glg --author='Miklos Martin'"
alias fuck='sudo $(fc -ln -1)'
alias html="lynx -stdin"
alias json="jq -C '.' | less -R"
alias terminal-notifier="reattach-to-user-namespace terminal-notifier"
alias REPLesent='scala -Dscala.color -language:_ -nowarn -i ~/.replesent/REPLesent.scala'
alias nix-shell="nix-shell --run /bin/zsh"

##
# Project aliases
##
alias dots="cd ~/dotfiles"
alias rds="p rds/relational-data-service"
alias rdb="p rds/rds-db-router"

##
# Other utility stuff
##
source ~/dotfiles/functions/safesource.zsh
source ~/dotfiles/functions/projects.zsh
source ~/dotfiles/functions/scalapr.zsh

##
# Fuzzy
##
ssource ~/.fzf.zsh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by travis gem
ssource /Users/mmartin/.travis/travis.sh

ssource ~/.nix-profile/etc/profile.d/nix.sh

ssource "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
ssource "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi


alias btlr="bin/run"
