# Docker Machine GoDaddy Driver

A [Docker Machine](https://docs.docker.com/machine/) driver plugin for [GoDaddy Cloud Servers](https://www.godaddy.com/pro/cloud-servers).

## Requirements

  * [Docker Machine](https://docs.docker.com/machine/install-machine/) 0.5.1 or a newer version

## Installation

### Releases

For a simple single-line install, run the following:

```bash
$ curl https://git.io/v63cR | sudo bash
```

Not a fan of `curl | bash`? No problem.

Download the latest version of `docker-machine-driver-godaddy` from [GitHub Releases](https://github.com/1and1/docker-machine-driver-oneandone/releases),
ensure the plugin is executable, and copy to a directory included in your environment's PATH variable:

```bash
$ curl -L https://github.com/aka-bo/docker-machine-godaddy/releases/download/v1.0.0/docker-machine-driver-godaddy-$(uname -s) > docker-machine-driver-godaddy
$ chmod +x docker-machine-driver-godaddy
$ mv docker-machine-driver-godaddy /usr/local/lib/  # use sudo if necessary
```

### From Source

Ensure [Go](http://www.golang.org) and [Godep](https://github.com/tools/godep) are properly installed and your $GOPATH variable is set.

```bash
$ go get -u github.com/aka-bo/docker-machine-godaddy
$ cd $GOPATH/src/github.com/aka-bo/docker-machine-godaddy
$ make build
$ make install
```

## Usage

Official documentation for Docker Machine [is available here](https://docs.docker.com/machine/).

To create machines on [GoDaddy Cloud Servers](https://www.godaddy.com/pro/cloud-servers)
you will need an API key associated with your GoDaddy account. API keys can be obtained
on the [GoDaddy Developer Portal](https://developer.godaddy.com/keys/).

With an API key in hand, you can create a new server with:

```bash
$ docker-machine create --driver godaddy --godaddy-api-key=${APIKEY} myhost
```

Alternatively, you can use environment variables:

```bash
$ export GODADDY_API_KEY=${APIKEY}
$ docker-machine create -d godaddy myhost
```

Options:

-   `--godaddy-api-key`: Your GoDaddy API key.
-   `--godaddy-base-api-url`: The GoDaddy API endpoint.
-   `--godaddy-boot-timeout`: Amount of time (in seconds) to wait for the initial boot.
-   `--godaddy-image`: The image to use for the new server.
-   `--godaddy-spec`: The server spec to use for the new server.
-   `--godaddy-ssh-key`: Private keyfile to use for SSH (absolute path).
-   `--godaddy-ssh-key-id`: Id of the existing GoDaddy SSH Key to associate with this new server.
-   `--godaddy-data-center`: The GoDaddy data center to launch the server in.
-   `--godaddy-zone`: The data center zone to launch the server in.
-   `--godaddy-ssh-user`: Name of the user to be used for SSH.



Environment variables and default values:

| CLI option                      | Environment variable         | Default                           |
| ------------------------------- | ---------------------------- | --------------------------------- |
| `--godaddy-api-key`             | `GODADDY_API_KEY`            | -                                 |
| `--godaddy-base-api-url`        | `GODADDY_API_URL`            | `https://api.godaddy.com`         |
| `--godaddy-boot-timeout`        | `GODADDY_BOOT_TIMEOUT`       | `120`                             |
| `--godaddy-image`               | `GODADDY_IMAGE`              | `ubuntu-1604`                     |
| `--godaddy-spec`                | `GODADDY_SPEC`               | `tiny`                            |
| `--godaddy-ssh-key`             | `GODADDY_SSH_KEY`            | -                                 |
| `--godaddy-ssh-key-id`          | `GODADDY_SSH_KEY_ID`         | -                                 |
| `--godaddy-data-center`         | `GODADDY_DATA_CENTER`        | `phx`                             |
| `--godaddy-zone`                | `GODADDY_ZONE`               | `phx-1`                           |
| `--godaddy-ssh-user`            | `GODADDY_SSH_USER`           | `machine`                         |
