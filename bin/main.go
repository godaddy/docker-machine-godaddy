package main

import (
	"github.com/docker/machine/libmachine/drivers/plugin"
	"github.com/godaddy/docker-machine-godaddy"
)

func main() {
	plugin.RegisterDriver(godaddy.NewDriver("", ""))
}
