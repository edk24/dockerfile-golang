Write the `dockerfile` for the first time

第一次编写`dockerfile`。


# Version

- ubuntu：18.04 / centos:7

- go1.12.7.linux-amd64


# Use

`cd ubuntu` or `cd centos`

**build**

`docker build -t awsl:1.0 .`

**run**

`docker run -it -p 82:80 awsl:1.0 /bin/bash`

**Work directory**

`/app`

**GOPATH**

`/root/package`