FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client supervisor \
    openrc mariadb mariadb-common mariadb-client

RUN mkdir -p /run/mysqld/
COPY supervisor.conf /etc/supervisord.conf
COPY wordpress.sql /
COPY my.cnf /etc/
COPY start.sh /tmp/
RUN chmod -R 755 /var/lib/mysql/
RUN chmod +x tmp/start.sh

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD tmp/start.sh