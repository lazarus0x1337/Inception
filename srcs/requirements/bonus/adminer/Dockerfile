FROM alpine:3.21

EXPOSE 8080

# Set the working directory
WORKDIR /var/www/html

RUN apk --no-cache add \
    php \
    php-session \
    php-json \
    php-mysqli \
    php-pdo \
    php-pdo_mysql \
    php-zlib \
    php-openssl \
    php-curl \
    php-ctype \
    php-iconv \
    php-fpm \
    php-dom \
    php-xml \
    php-mbstring wget bash
# Download the Adminer PHP file
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php

ENTRYPOINT ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]