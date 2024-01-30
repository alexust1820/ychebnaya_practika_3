FROM alpine:3.19

RUN apk update && \
	apk add samba \
	bash \
	--no-cache

COPY ./configfiles/* /etc/samba/

COPY ./binaries/* /bin/
