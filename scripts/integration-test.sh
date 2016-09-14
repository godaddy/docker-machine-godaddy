#!/bin/bash -x

# Install BATS
cd $HOME
if [ ! -d 'bats' ]; then
  echo "Installing BATS - bash automated testing system"
  git clone https://github.com/sstephenson/bats.git $HOME/bats
  cd $HOME/bats
  sudo ./install.sh /usr/local/
fi

echo "Initializing go projects"
/usr/local/go/bin/go get github.com/docker/machine
/usr/local/go/bin/go get -u github.com/golang/lint/golint
/usr/local/go/bin/go get -u github.com/dghubble/sling
cd $GOPATH/src/github.com/docker/machine
make build
make test

if [ $? -ne 0 ]; then
    echo "Docker machine 'make test' failed"
    exit 1;
fi

go get -u github.com/godaddy/docker-machine-godaddy
cd $GOPATH/src/github.com/godaddy/docker-machine-godaddy
make build
make install

cd $GOPATH/src/github.com/docker/machine
DRIVER=godaddy make test-integration test/integration/core/core-commands.bats
if [ $? -ne 0 ]; then
    echo "Docker machine 'make test-integration' failed.  See ./bats.log"
    exit 1;
fi
