FROM alpine:3.21

WORKDIR /app

RUN apk update && apk add --no-cache nodejs

COPY tools/index.js /app/index.js

EXPOSE 8000

ENTRYPOINT ["node", "/app/index.js"]