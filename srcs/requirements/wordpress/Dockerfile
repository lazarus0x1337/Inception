FROM alpine:3.21

EXPOSE 9000

#PHP and Dependencies Installation
# Base PHP package
# FastCGI Process Manager
# MySQL/MariaDB connection support
# JSON handling
# Remote HTTP requests
# XML/HTML manipulation
# Multi-byte string handling
# SSL/TLS support
# XML processing
# PHP archive support
# Session handling
# MySQL/MariaDB client tools
# File downloading
# Shell for scripts

RUN apk update && apk add --no-cache \
    php81 \ 
    php81-fpm \
    php81-mysqli \
    php81-json \
    php81-curl \
    php81-dom \
    php81-mbstring \
    php81-openssl \
    php81-xml \
    php81-phar \
    php81-session \
    mariadb-client \
    wget \
    bash

WORKDIR /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    ln -s /usr/bin/php81 /usr/bin/php && \
    mv wp-cli.phar /usr/local/bin/wp

COPY tools/WordpressScript.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/WordpressScript.sh
    
WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/WordpressScript.sh"]

CMD ["php-fpm81", "-F"]