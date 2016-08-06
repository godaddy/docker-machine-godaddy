GODEP_BIN := $(GOPATH)/bin/godep
GODEP := $(shell [ -x $(GODEP_BIN) ] && echo $(GODEP_BIN) || echo '')
GO_LDFLAGS := -X $(shell go list ./).GitCommit=$(shell git rev-parse --short HEAD 2>/dev/null)

version := "v1.0.0"
name := "docker-machine-driver-godaddy"
default: build

clean:
	rm -f ./bin/$(name)*
	rm -f $(GOPATH)/bin/$(name)*

compile:
	go build -ldflags "$(GO_LDFLAGS)" -i -o ./bin/$(name) ./bin

print-success:
	@echo
	@echo "Plugin compiled successfully."
	@echo "To install it, run 'make install'"

build: compile print-success

install:
	cp bin/$(name) $(GOPATH)/bin/

release:
	rm -rf release
	mkdir release
	GOOS=linux GOARCH=amd64 go build -ldflags "$(GO_LDFLAGS)" -o release/$(name)-Linux ./bin
	GOOS=darwin GOARCH=amd64 go build -ldflags "$(GO_LDFLAGS)" -o release/$(name)-Darwin ./bin

dep-save:
	$(if $(GODEP), , \
		$(error Please install godep: go get github.com/tools/godep))
	$(GODEP) save $(shell go list ./... | grep -v vendor/)

dep-restore:
	$(if $(GODEP), , \
		$(error Please install godep: go get github.com/tools/godep))
	$(GODEP) restore -v

.PHONY : build install release
