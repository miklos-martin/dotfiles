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

plugins=(fuzzy git docker jump tmux)

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

##
# Project aliases
##
alias dots="cd ~/dotfiles"
alias ss="p segmentation/segmentation-service"
alias gcs="p segmentation/gcs-segmentation"
alias es="p segmentation/event-segmentation-service"
alias rds="p rds/relational-data-service"
alias rdb="p rds/rds-db-router"

##
# Fuzzy
##
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##
# Other utility stuff
##
source ~/dotfiles/functions/projects.zsh
source ~/dotfiles/functions/scalapr.zsh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by travis gem
[ -f /Users/mmartin/.travis/travis.sh ] && source /Users/mmartin/.travis/travis.sh

source ~/.nix-profile/etc/profile.d/nix.sh
