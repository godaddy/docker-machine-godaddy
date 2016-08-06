package main

import (
	"github.com/aka-bo/docker-machine-godaddy"
	"github.com/docker/machine/libmachine/drivers/plugin"
)

func main() {
	plugin.RegisterDriver(godaddy.NewDriver("", ""))
}
