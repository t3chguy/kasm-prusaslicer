FROM lscr.io/linuxserver/webtop:latest
USER root

ENV HOME /home/abc
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

COPY PrusaSlicer $INST_SCRIPTS/prusaslicer/
RUN bash $INST_SCRIPTS/prusaslicer/install.sh && rm -rf $INST_SCRIPTS/prusaslicer/

# Set this so that it doesn't complain about the CA cert path on every startup
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

USER 1000
