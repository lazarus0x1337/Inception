FROM alpine:3.21

EXPOSE 9000

WORKDIR /app

RUN apk update && apk add --no-cache curl tar

RUN curl -L "https://github.com/portainer/portainer/releases/download/2.19.1/portainer-2.19.1-linux-amd64.tar.gz" | tar xvz

ENTRYPOINT ["/app/portainer/portainer"]