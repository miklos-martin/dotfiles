export EDITOR=vim
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home"
export SCALA_HOME=$HOME/lang/scala-2.11.8
export SPARK_HOME=$HOME/spark/spark-2.1.0
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss3M  -Duser.timezone=GMT"
export ANDROID_HOME=$HOME/lang/android
export PYTHON_HOME=$HOME/Library/Python/3.5

export PATH=$SCALA_HOME/bin:$SPARK_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PYTHON_HOME/bin:$HOME/.composer/vendor/bin:$HOME/bin:$PATH

export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_CERT_PATH=/Users/martin.miklos/.docker/machine/machines/dinghy
export DOCKER_TLS_VERIFY=1
export DOCKER_MACHINE_NAME=dinghy

export ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh-custom
