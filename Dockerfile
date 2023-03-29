from ubuntu:18.04

RUN apt-get update && apt-get -y install git wget libpcap-dev build-essential pkg-config

RUN git clone https://github.com/mongodb-labs/mongoreplay.git
RUN wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
ENV PATH="${PATH}:/usr/local/go/bin"
ENV GOROOT="/usr/local/go"

WORKDIR mongoreplay
RUN ./build.sh

#docker cp 4756e9e8b69a:/mongoreplay/mongoreplay mongoreplay
