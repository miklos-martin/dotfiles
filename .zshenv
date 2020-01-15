export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export EDITOR=vim
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss3M  -Duser.timezone=GMT"
export METALS_ENABLED=true
export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"

export PATH=$HOME/.local/bin:$HOME/.nix-profile/bin:$HOME/bin:$PYENV_ROOT/bin:/usr/local/opt/mysql-client/bin:/usr/local/bin:/Applications/MySQLWorkbench.app/Contents/MacOS:$PATH

export ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh-custom
export PROJECTS_DIR=$HOME/projects
export RD_TOOLBOX_DIR=$HOME/projects/rd-toolbox

export GPG_TTY=$(tty)



# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/mmartin/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

