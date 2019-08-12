FROM ubuntu:18.04
MAINTAINER edk24

# 踩坑， dockerfile构建中无法使用source。 用ENV添加环境变量
ENV PATH=$PATH:/usr/local/go/bin
ENV GOROOT=/usr/local/go
ENV GOPATH=/root/package

# 使用阿里云源
COPY --chown=root:root ./conf/sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y wget git && \
    wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.12.7.linux-amd64.tar.gz && \
    mkdir /root/package && \
    mkdir /app && \
    rm -rf /go1.12.7.linux-amd64.tar.gz && \
    go get -u github.com/gpmgo/gopm && \
    ln -s /root/package/bin/gopm /usr/local/bin/gopm


VOLUME ["/app"]
WORKDIR /
EXPOSE 80
CMD /bin/bash