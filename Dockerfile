FROM lscr.io/linuxserver/webtop:ubuntu-kde

ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install

######### Customize Container Here ###########

RUN apt-get -y update && apt-get -y install wget bzip2 htop

COPY PrusaSlicer $INST_SCRIPTS/prusaslicer/
RUN bash $INST_SCRIPTS/prusaslicer/install.sh && rm -rf $INST_SCRIPTS/prusaslicer/

# Set this so that it doesn't complain about the CA cert path on every startup
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
