#!/bin/bash

set -x

PRJ_ROOT=`dirname $0`
PRJ_ROOT=`cd $PRJ_ROOT../; pwd`

cd $PRJ_ROOT

#go env -w GO111MODULE=on
#go env -w GOPROXY=https://goproxy.cn,direct

#export GOPATH=$PRJ_ROOT
#export GOBIN=$PRJ_ROOT/bin

go clean
rm -r ./bin/*
rm -r ./pkg/*
rm -r ./log/*
#exit 0

#gofmt -w -l ./src/sylvanas/

#go get github.com/gorilla/websocket
#go get github.com/satori/go.uuid
#go get github.com/Shopify/sarama

go install timi
