FROM lscr.io/linuxserver/webtop:ubuntu-kde

ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install

######### Customize Container Here ###########

RUN mkdir /config/Desktop
RUN apt-get -y update && apt-get -y install wget bzip2 htop qdirstat libgtk-4-dev ffmpeg curl krusader

COPY Czkawka $INST_SCRIPTS/czkawka/
RUN bash $INST_SCRIPTS/czkawka/install.sh && rm -rf $INST_SCRIPTS/czkawka/

COPY PrusaSlicer $INST_SCRIPTS/prusaslicer/
RUN bash $INST_SCRIPTS/prusaslicer/install.sh && rm -rf $INST_SCRIPTS/prusaslicer/

# Set this so that it doesn't complain about the CA cert path on every startup
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
