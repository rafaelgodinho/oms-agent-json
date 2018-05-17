FROM ubuntu:18.04

LABEL Author="Rafael Godinho"
LABEL version="0.1.2"

ENV WSID=
ENV SECRET=
ENV NAME=
ENV URL=

COPY start.sh /

RUN apt-get update && \
 apt-get install -y libc-bin wget openssl curl sudo python-ctypes net-tools rsyslog cron vim dmidecode apt-transport-https gpg

ADD https://github.com/Microsoft/OMS-Agent-for-Linux/releases/download/OMSAgent_v1.6.0-42/omsagent-1.6.0-42.universal.x64.sh /omsagent-1.6.0-42.universal.x64.sh
RUN chmod 755 /omsagent-1.6.0-42.universal.x64.sh

ENTRYPOINT [ "/start.sh" ]