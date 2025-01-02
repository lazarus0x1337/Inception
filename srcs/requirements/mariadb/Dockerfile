FROM alpine:3.21

EXPOSE 3306

RUN apk update && apk upgrade && apk add mariadb mariadb-client bash

RUN mkdir -p /run/mysqld && \
    mkdir -p /var/lib/mysql && \
    mkdir -p /var/log/mysql && \
    chown -R mysql:mysql /run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql && \
    chown -R mysql:mysql /var/log/mysql

COPY tools/mariadbScript.sh /

RUN chmod +x /mariadbScript.sh

ENTRYPOINT [ "/mariadbScript.sh" ]