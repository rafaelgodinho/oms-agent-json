FROM ubuntu

LABEL Author="Rafael Godinho"
LABEL version="0.1"

SHELL ["/bin/bash", "-c"]

ENV WSID=<WSID> \
    SECRET=<SECRET> \
    NAME=<NAME> \
    URL=<URL>

RUN apt update --yes \
    && apt install --yes libc-bin wget openssl curl sudo python-ctypes net-tools rsyslog cron vim dmidecode apt-transport-https gpg

ADD https://github.com/Microsoft/OMS-Agent-for-Linux/releases/download/OMSAgent_v1.6.0-42/omsagent-1.6.0-42.universal.x64.sh /omsagent-1.6.0-42.universal.x64.sh
RUN chmod 755 /omsagent-1.6.0-42.universal.x64.sh

COPY start.sh /

ENTRYPOINT [ "/start.sh" ]