FROM frolvlad/alpine-glibc:latest

ENV TELEPORT_VERSION 2.3.5
ENV TELEPORT_NAME teleport
ENV TELEPORT_FILE $TELEPORT_NAME-v$TELEPORT_VERSION-linux-amd64-bin.tar.gz
ENV TELEPORT_URL https://github.com/gravitational/teleport/releases/download/v$TELEPORT_VERSION/$TELEPORT_FILE
ENV TELEPORT_HOME /usr/local/teleport

ENV TELEPORT_NODENAME node

RUN apk --no-cache add curl \
 && cd "/tmp" \
 && curl -LO -s $TELEPORT_URL \
 && tar -xf $TELEPORT_FILE \
 && mv $TELEPORT_NAME $TELEPORT_HOME \
 && cd $TELEPORT_HOME \
 && ./install

WORKDIR $TELEPORT_HOME

VOLUME /var/lib/teleport

CMD [ "teleport","start","--nodename=$TELEPORT_NODENAME" ]
