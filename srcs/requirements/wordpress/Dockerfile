FROM alpine:3.21

EXPOSE 9000

RUN apk update && apk add --no-cache php php-fpm php-mysqli php-json php-curl php-mbstring php-openssl php-xml php-phar php-session mariadb-client wget bash

WORKDIR /var/www/html

COPY tools/WordpressScript.sh /

RUN chmod +x /WordpressScript.sh

ENTRYPOINT ["/WordpressScript.sh"]