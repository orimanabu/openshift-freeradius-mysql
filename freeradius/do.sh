#!/bin/bash

oc create -f ./configs/is_radius.yaml
oc create -f ./configs/svc_radius.yaml
oc create -f ./configs/svc_externalip.yaml
oc create -f ./configs/bc_radius.yaml
oc create -f ./configs/dc_radius.yaml

sudo docker pull ubuntu:16.04
sudo docker login -p $(oc whoami -t) -u test docker-registry-default.app.example.com
sudo docker tag docker.io/ubuntu:16.04 docker-registry-default.app.example.com/radius/ubuntu:16.04
sudo docker push docker-registry-default.app.example.com/radius/ubuntu:16.04
oc start-build radius --follow --from-dir .

sleep 5

