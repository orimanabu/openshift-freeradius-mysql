#!/bin/bash

oc exec $(oc get pod | grep Running | grep -v build | grep radius | awk '{print $1}') -- mysql -u freeradius -pfreeradius -h $(oc get svc mysql --template='{{.spec.clusterIP}}') -e "show tables" -t freeradius
oc exec $(oc get pod | grep Running | grep -v build | grep radius | awk '{print $1}') -- mysql -u freeradius -pfreeradius -h $(oc get svc mysql --template='{{.spec.clusterIP}}') -e "source /etc/freeradius/sql/mysql/schema.sql" -t freeradius
oc exec $(oc get pod | grep Running | grep -v build | grep radius | awk '{print $1}') -- mysql -u freeradius -pfreeradius -h $(oc get svc mysql --template='{{.spec.clusterIP}}') -e "show tables" -t freeradius
oc exec $(oc get pod | grep Running | grep -v build | grep radius | awk '{print $1}') -- mysql -u freeradius -pfreeradius -h $(oc get svc mysql --template='{{.spec.clusterIP}}') -e "insert into radcheck (username, attribute, op, value) values ('test', 'Cleartext-Password', ':=', 'test');" -t freeradius
oc exec $(oc get pod | grep Running | grep -v build | grep radius | awk '{print $1}') -- mysql -u freeradius -pfreeradius -h $(oc get svc mysql --template='{{.spec.clusterIP}}') -e "select * from radcheck" -t freeradius
