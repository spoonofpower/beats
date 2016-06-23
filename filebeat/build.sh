#!/bin/bash

VERSION=$(git rev-parse --short HEAD)

docker run --rm -it -v $GOPATH/src/github.com/elastic/beats:/go/src/github.com/elastic/beats -w /go/src/github.com/elastic/beats/filebeat -e "CGO_ENABLED=0" golang:1.6.2 go build -v -o runtime/filebeat

docker build -f Dockerfile -t filebeat:runtime-$VERSION .
docker tag filebeat:runtime-$VERSION 127.0.0.1:5000/filebeat:runtime-$VERSION
docker save 127.0.0.1:5000/filebeat:runtime-$VERSION | ssh -C 172.31.1.105 docker load
ssh 172.31.1.105 docker push 127.0.0.1:5000/filebeat:runtime-$VERSION

sed "s/\${BUILD_VERSION}/$VERSION/" templates/filebeat-ds.yml > filebeat-ds.yml
