package config

import (
	"list"
)

#ociGateway: {
    ...
	gateways: [...#gateways]

	_checks: {
		#names: [ for n in gateways {n.name}]
		uniqueNames: [ for i, x in #names if !list.Contains(list.Drop(#names, i+1), x) {x}]
		isUniqe: len(uniqueNames) == len(#names)
		isUniqe: true
	}
}

ociGateway: #ociGateway & {}

#gateway: {
	name: string
	type: string
	...
}

#fileGateway: #gateway & {
	type:    "file"
	rootDir: string
}

#httpGateway: #gateway & {
	type:     "http"
	baseURL:  string
	username: string
	password: string
	insecure: bool
}

#s3Gateway: #gateway & {
	type:            "s3"
	endpoint:        string
	accessKeyID:     string
	secretAccessKey: string
	useSSL:          bool
}

#dockerGateway: #gateway & {
	type: "docker"
}

#gitGateway: #gateway & {
	type:     "git"
	repoURL:  string
	username: string
	password: string
	insecure: bool | *false
}

#ftpGateway: #gateway & {
	type:     "ftp"
	host:     string
	port:     number
	username: string
	password: string
	insecure: bool | *false
	basePath: string | *""
}

#nfsGateway: #gateway & {
	type:     "nfs"
	host:     string
	username: string
	password: string
	insecure: bool
	basePath: string
}
#sftpGateway: #gateway & {
	type:       "sftp"
	host:       string
	port:       number
	username:   string
	insecure:   bool
	sshKeyFile: string
	basePath:   string
}

#smbGateway: #gateway & {
	type:     "smb"
	host:     string
	port:     number
	username: string
	password: string
}

#vaultGateway: #gateway & {
	type:     "vault"
	endpoint: string
	token:    string
	basePath: string
}

#gateways:  #fileGateway | #httpGateway | #s3Gateway | #dockerGateway | #gitGateway | #ftpGateway | #nfsGateway | #sftpGateway | #smbGateway | #vaultGateway