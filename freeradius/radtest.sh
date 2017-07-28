#!/bin/bash
oc get svc
svc_addr=$(oc get svc radius --template='{{.spec.clusterIP}}')
echo ${svc_addr}

cmd="radtest test test $(oc get svc radius --template='{{.spec.clusterIP}}') 1812 secret"
echo "=> ${cmd}"
${cmd}
cmd="radtest test test $(oc get svc radius-external --template='{{.spec.externalIPs}}'):11812 1812 secret"
echo "=> ${cmd}"
${cmd}
