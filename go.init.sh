#!/bin/bash

git config --global url."ssh://git@v.src.corp.qihoo.net".insteadOf "https://v.src.corp.qihoo.net"

go env -w GOPRIVATE=*.qihoo.net
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
go env -w GOSUMDB=sum.golang.google.cn





