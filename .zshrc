##
# Env
##
export JAVA_HOME=/opt/java/jdk1.8.0_25
export JDK_HOME=/usr/lib/jvm/java-7-oracle
export ANDROID_HOME=$HOME/Programs/android-studio/sdk
export CATALINA_HOME=/usr/share/tomcat7
export SCALA_HOME=/usr/local/share/scala
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$ANDROID_HOME/platform-tools:/usr/local/heroku/bin:$SCALA_HOME/bin:/usr/local/packer
export EDITOR=vim

##
# oh my zsh
##
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mikka"
COMPLETION_WAITING_DOTS="true"

##
# Plugins
##
SAMBA_DEFAULT_USERNAME="martin.miklos"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

plugins=(git svn debian symfony2 node nginx php-fpm lesscss zsh-syntax-highlighting bower memcached samba docker)

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
alias fuck="sudo $(tail -n1 $HISTFILE | cut -d ";" -f 2)"

##
# Fuzzy
##
if [ -f ~/.fzf.zsh ];then
   source ~/.fzf.zsh
   source ~/dotfiles/functions/fuzzy.zsh
fi

##
# Other utility stuff
##
source ~/dotfiles/functions/projects.zsh
