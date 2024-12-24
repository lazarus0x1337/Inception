FROM alpine:3.21

# build-time workdir
WORKDIR /usr/src/nginx

# build-base	Provides the essential build tools like make and gcc.
# openssl-dev	Enables HTTPS support by providing OpenSSL libraries and headers.
# pcre-dev	Allows Nginx to process regular expressions in configuration files.
# zlib-dev	Adds Gzip compression support for optimized content delivery. 
RUN apk update && \
    apk add nginx openssl bash && \
    

apk add --no-cache build-base openssl-dev pcre-dev zlib-dev curl 