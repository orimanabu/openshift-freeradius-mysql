#!/bin/bash

oc create -f ./configs/is_radius.yaml
oc create -f ./configs/svc_radius.yaml
oc create -f ./configs/svc_externalip.yaml
oc create -f ./configs/bc_radius.yaml
oc create -f ./configs/dc_radius.yaml

user=${USER}
registry=$(sudo oc get route/docker-registry --template='{{.spec.host}}')

sudo docker pull ubuntu:16.04
sudo docker login -p $(oc whoami -t) -u ${USER} ${registry}
sudo docker tag docker.io/ubuntu:16.04 ${registry}/radius/ubuntu:16.04
sudo docker push ${registry}/radius/ubuntu:16.04
oc start-build radius --follow --from-dir .

sleep 5

