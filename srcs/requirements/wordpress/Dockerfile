FROM alpine:3.21

EXPOSE 9000

RUN apk update && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-curl \
    php83-json \
    php83-session \
    php83-mbstring \
    php83-openssl \
    php83-tokenizer \
    php83-xml \
    php83-ctype \
    php83-zlib \
    php83-gd \
    php83-fileinfo \
    php83-phar \
    php83-simplexml \
    php83-dom \
    php83-pdo \
    php83-pdo_mysql \
    mariadb-client \
    curl bash

RUN cd /usr/local/bin && \
    curl -o wp -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp

WORKDIR /var/www/html

COPY tools/WordpressScript.sh /

RUN chmod +x /WordpressScript.sh

ENTRYPOINT ["/WordpressScript.sh"]