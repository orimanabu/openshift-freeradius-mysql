#docker run -itd \
#  --name freeradius \
#  --link freeradiusdb:mysql \
#  -e RADIUS_LISTEN_IP=* \
#  -e RADIUS_CLIENTS=secret@127.0.0.1 \
#  -p 1812:1812/udp -p 1813:1813/udp \
#  -e RADIUS_SQL=true \
#  -e RADIUS_DB_NAME=mysql \
#  -e RADIUS_DB_NAME=freeradius \
#  -e RADIUS_DB_USERNAME=freeradius \
#  -e RADIUS_DB_PASSWORD=freeradius \
#  tpdock/freeradius

sudo oadm policy add-scc-to-user anyuid -z default -n radius

oc new-app --template=mysql-ephemeral --name=database --param MYSQL_USER=freeradius --param MYSQL_PASSWORD=freeradius --param MYSQL_DATABASE=freeradius --param MYSQL_ROOT_PASSWORD=root --param DATABASE_SERVICE_NAME=radius-db
#oc delete svc/mysql dc/mysql

