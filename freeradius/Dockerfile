FROM ubuntu:16.04

RUN apt -y update; apt install -y freeradius freeradius-mysql freeradius-postgresql freeradius-utils curl gettext-base vim mysql-client-core-5.7
RUN apt install -y bash less tcpdump netcat strace lsof iputils-ping net-tools

USER root
EXPOSE 1812 1813

ADD templates/default.template default.template
ADD templates/inner-tunnel.template inner-tunnel.template
ADD templates/radiusd.conf.template radiusd.conf.template
ADD templates/proxy.conf.template proxy.conf.template
ADD templates/clients.conf.template clients.conf.template
ADD templates/sql.conf.template sql.conf.template
ADD templates/files.template files.template
ADD docker-entrypoint.sh docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD /usr/sbin/freeradius -X
