#!/bin/zsh

usage() {
  cat <<EOF
Usage:
  scalapr PROJECTNAME

This creates the directory structure for an empty scala project, adds a basic build.sbt including scalatest and initializes a git repo.
E.g.

$ scalapr foo

creates

foo
  |
  +- .git
  +- project
  |  |
  |  +- build.properties
  +- src
  |  |
  |  +- main
  |  |  |
  |  |  +- scala
  |  |     |
  |  |     +- foo
  |  +- test
  |     |
  |     +- scala
  |        |
  |        +- foo
  +- build.sbt

EOF
}

scalapr() {
  if [ ! $1 ]; then
    usage
    return 1
  fi

  mkdir -p $1/src/{test,main}/scala/$1
  mkdir -p $1/project
  cat > $1/build.sbt <<EOL
name := "$1"
version := "0.0.1"
scalaVersion := "2.13.1"

libraryDependencies += "org.scalatest" %% "scalatest" % "3.1.0" % "test"
EOL
  cat > $1/project/build.properties <<EOL
sbt.version=1.3.6
EOL
  cd $1
  git init
  git add . && git commit -m "init"
}
