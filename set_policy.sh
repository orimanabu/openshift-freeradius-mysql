#!/bin/bash

if [ x"$#" != x"1" ]; then
        echo "$0 project"
        exit 1
fi
proj=$1; shift

oc adm policy add-scc-to-user anyuid -z default -n ${proj}
