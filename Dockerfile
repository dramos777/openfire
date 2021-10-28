FROM alpine

LABEL MANTAINER=emanuel.dramos2@gmail.com

ENV OPENFIRE_VERSION=4_6_4 \
    JDK_VERSION=11

ARG OPENFIRE_VERSION=4_6_4 \
    JDK_VERSION=11    

RUN apk update && \
    apk add openjdk${JDK_VERSION}

RUN wget https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_${OPENFIRE_VERSION}.tar.gz -O openfire_${OPENFIRE_VERSION}.tar.gz && \
    tar -xvf openfire_${OPENFIRE_VERSION}.tar.gz -C /opt/ && \
    chmod +x /opt/openfire/bin/openfire && \
    mkdir -p /var/lib/openfire/embedded-db/ && \
    ln -s /opt/openfire/bin/openfire /usr/local/bin/openfire && \
    ln -s /opt/openfire/conf /etc/openfire && \
    ln -s /opt/openfire/plugins /var/lib/openfire/plugins && \
    rm -rf openfire* && \
    rm -rf /var/cache/apk/* && \
    adduser -S openfire && \
    chown -R openfire /opt/openfire/*

VOLUME /etc/openfire
VOLUME /var/lib/openfire
VOLUME /var/log
VOLUME /opt/openfire


WORKDIR	/opt/openfire/

EXPOSE 5222/tcp 5269/tcp 7443/tcp 9090/tcp 9091/tcp

ENTRYPOINT ["/usr/local/bin/openfire","run"]
