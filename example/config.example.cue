package ocigatewayexample

import (
	cfg "github.com/mheers/ocigateway/config"
)

version: "2.0"
log: {}
storage: ""

http: {
  addr: ":5000"
}

cacheDir: "/tmp/demo/cache"

logLevel: "debug"
logFormat: "json"

cfg.#ociGateway & {
	gateways: [
		cfg.#ftpGateway & {
			name:     "my-ftp"
			username: "Marcel"
			password: "1234"
			host:     "ftp.myhost.com"
			port:     21
		},
		cfg.#ftpGateway & {
			name:     "my-ftps"
			username: "Marcel"
			password: "1234"
			host:     "ftp.myhost.com"
			port:     21
		},
		cfg.#gitGateway & {
			name:     "my-git"
			username: "Marcel"
			password: "1234"
			host:     "ftp.myhost.com"
			port:     21
			repoURL:  "my-repo"
			sshKey:   "my-ssh-key"
		},
	]
}
