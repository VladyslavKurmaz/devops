#!/bin/bash

yum install -y docker
service docker start

yum install docker-registry
systemctl enable docker-registry.service
service docker-registry start

docker run -d -p 5000:5000 --restart=always --name dsm-apps registry:2