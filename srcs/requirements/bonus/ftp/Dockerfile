FROM alpine:3.21

RUN apk update && apk add vsftpd bash

COPY tools/scriptFtp.sh /scriptFtp.sh

RUN chmod  +x /scriptFtp.sh

WORKDIR /ftp-data

# Expose FTP ports
EXPOSE 21 21000-21010

# Start the entrypoint script when the container runs
ENTRYPOINT ["/scriptFtp.sh"]