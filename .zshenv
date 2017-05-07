export EDITOR=vim
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home"
export SCALA_HOME=$HOME/lang/scala-2.11.8
export SPARK_HOME=$HOME/spark/spark-2.1.0
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss3M  -Duser.timezone=GMT"
export ANDROID_HOME=$HOME/lang/android
export PYTHON_HOME=$HOME/Library/Python/3.5

export PATH=$SCALA_HOME/bin:$SPARK_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PYTHON_HOME/bin:$HOME/.composer/vendor/bin:$HOME/bin:/usr/local/bin:$PATH


export ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh-custom
export PROJECTS_DIR=$HOME/projects
