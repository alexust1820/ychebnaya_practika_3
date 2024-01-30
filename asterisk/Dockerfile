FROM alpine:3.19

RUN apk update && \
apk add asterisk \
	asterisk-sample-config \
	samba \
	--no-cache		

WORKDIR /etc/asterisk

COPY ./configfiles/* .

WORKDIR /bin

COPY ./binaries/* .

ADD sounds /var/lib/asterisk/sounds
