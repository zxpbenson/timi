# 
# 需要git和go环境
# git环境做如下配置
# git config --global url."ssh://git@your-git-server-domain".insteadOf "https://your-git-server-domain"
# go mod init github.com/zxpbenson/timi
# 

default: clean fmt get update build test

GOMOD    := GO111MODULE=on
#GOPRIVATE=github.com/zxpbenson
GOPRI    := GOPRIVATE=*.qihoo.net
GOPXY    := GOPROXY=https://goproxy.cn,direct
GOSUB    := GOSUMDB=sum.golang.google.cn

GO       := $(GOMOD) $(GOPRI) $(GOPXY) $(GOSUB) go
GO_BLD   := $(GO) build -trimpath -ldflags "-s -w "
GOTEST   := $(GO) test -gcflags='-l' -p 3 -v -race -timeout 6m -coverprofile=profile.out -covermode=atomic

FILES    := $(shell find . -name '*.go' -type f -not -name '*.pb.go' -not -name '*_generated.go' -not -name '*_test.go')
TESTS    := $(shell find . -name '*.go' -type f -not -name '*.pb.go' -not -name '*_generated.go' -name '*_test.go')

version:
	$(GO) version

clean:
	$(GO) clean

fmt:
	gofmt -s -l -w $(FILES) $(TESTS)

get:
	$(GO) get ./...
	$(GO) mod verify
	$(GO) mod tidy

update:
	$(GO) get -u -v all
	$(GO) mod verify
	$(GO) mod tidy

build: 
	$(GO_BLD) -o bin/main main/main.go
	$(GO_BLD) -o bin/http.server http.server/main.go

test:
	$(GOTEST) ./...

	

