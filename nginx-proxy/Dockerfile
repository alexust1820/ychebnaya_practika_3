FROM alpine:3.19

RUN apk update && apk add nginx --no-cache

COPY ./configfiles/* /etc/nginx/

COPY ./binaries/* /bin/

ENTRYPOINT "/bin/startup.sh"
