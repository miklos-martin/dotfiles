##
# Env
##
export PATH=$HOME/anaconda2/bin:$HOME/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$ANDROID_HOME/platform-tools:/usr/local/heroku/bin:$SCALA_HOME/bin:/usr/local/packer:$$HOME/.rvm/bin:PATH
export EDITOR=vim
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss2M  -Duser.timezone=GMT"

##
# oh my zsh
##
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lambda"
COMPLETION_WAITING_DOTS="true"

##
# Plugins
##
SAMBA_DEFAULT_USERNAME="martin.miklos"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_TMUX_AUTOSTART=true

plugins=(fuzzy git svn debian memcached samba docker jump scala sbt tmux)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

##
# Aliases
##
alias glg="git log --pretty=format:'%C(yellow)%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias glgmy="glg --author=miklos"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias zshconfig="vim ~/.zshrc"
alias clipboard="xclip -selection clipboard"
alias svnst="svn st | egrep -v '^Perf|X|!' | egrep --color=never '\w'"
alias fuck='sudo $(fc -ln -1)'
alias dmd="docker run --rm -v $PWD:/app miklosmartin/compiled -de -w -unittest"
alias html="lynx -stdin"

if [[ `uname` -eq "Darwin" ]]; then
    alias docs="bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
else
    alias docs="/etc/init.d/docker status > /dev/null || sudo /etc/init.d/docker start"
fi
alias REPLesent='scala -Dscala.color -language:_ -nowarn -i ~/.replesent/REPLesent.scala'
alias vpnon='sudo openvpn /etc/openvpn/client.conf'


##
# Fuzzy
##
if [ -f ~/.fzf.zsh ];then
   source ~/.fzf.zsh
fi

##
# Other utility stuff
##
source ~/dotfiles/functions/projects.zsh
