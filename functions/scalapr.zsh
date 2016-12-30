#!/bin/zsh

usage() {
  echo "scalapr PROJECTNAME"
}

scalapr() {
  if [ ! $1 ]; then
    usage
    return 1
  fi

  mkdir -p $1/src/{test,main}/scala/$1
  cat > $1/build.sbt <<EOL
name := "$1"
version := "0.0.1"
scalaVersion := "2.12.1"

libraryDependencies += "org.scalatest" % "scalatest_2.12" % "3.0.1" % "test"
EOL
  cd $1
}
