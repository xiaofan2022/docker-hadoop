#!/bin/bash

set -e

TAG=1.16.3_scala_2.12

build() {
    NAME=$1
    IMAGE=flink-$NAME:$TAG
    cd $([ -z "$2" ] && echo "./$NAME" || echo "$2")
    echo '--------------------------' building $IMAGE in $(pwd)
    docker build -t $IMAGE .
    cd -
}

build base
build master
build worker
#build submit
#build maven-template template/maven
#build sbt-template template/sbt
