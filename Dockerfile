FROM lscr.io/linuxserver/webtop:ubuntu-kde

ENV INST_SCRIPTS /dockerstartup/install

######### Customize Container Here ###########

RUN mkdir /config/Desktop && \
    apt-get -y update && \
    apt-get -y install wget bzip2 htop qdirstat libgtk-4-dev ffmpeg curl krusader kdiff3 kompare xxdiff krename zip p7zip nano

COPY scripts $INST_SCRIPTS/
RUN run-parts --regex '.*\.sh' --exit-on-error $INST_SCRIPTS && rm -rf $INST_SCRIPTS/

# Set this so that it doesn't complain about the CA cert path on every startup
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
