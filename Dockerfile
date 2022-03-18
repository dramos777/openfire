FROM alpine

LABEL MANTAINER=emanuel.dramos2@gmail.com

ENV OPENFIRE_VERSION=4_7_1 \
    JDK_VERSION=11

ARG OPENFIRE_VERSION=4_7_1 \
    JDK_VERSION=11    

RUN wget https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_${OPENFIRE_VERSION}.tar.gz -O openfire_${OPENFIRE_VERSION}.tar.gz && \
    tar -xvf openfire_${OPENFIRE_VERSION}.tar.gz -C /opt && \
    rm -rf *openfire* && \
    mkdir -p /openfire/var/ && \
    mkdir -p /openfire/usr/lib/jvm && \
    mkdir -p /openfire/var/log && \
    mv -f /opt/openfire/conf /openfire/ && \
    mv -f /opt/openfire/lib /openfire/var/ && \
    ln -s /openfire/conf /opt/openfire/conf && \
    ln -s /openfire/var/lib /opt/openfire/lib && \
    ln -s /openfire/var/log /opt/openfire/logs && \
    ln -s /openfire/usr/lib/jvm /usr/lib/jvm && \
    ln -s /opt/openfire/bin/openfire /usr/local/bin/openfire && \
    adduser -S openfire && \
    chown -R openfire /opt/openfire && \
    chmod +x /opt/openfire/bin/openfire

RUN apk update && \
    apk add openjdk${JDK_VERSION} && \
    rm -rf /var/cache/apk/*


VOLUME /openfire


WORKDIR	/opt/openfire/

EXPOSE 5222/tcp 5269/tcp 7443/tcp 9090/tcp 9091/tcp
EXPOSE 53/tcp 1024-65535/tcp 53/udp 1024-65535/udp

ENTRYPOINT ["/usr/local/bin/openfire","run"]
