FROM java:8
MAINTAINER Francis Belanger "francis.belanger@gmail.com"

# Get filebot and install
RUN wget -O /tmp/filebot.deb "https://www.filebot.net/download.php?mode=s&type=deb&arch=amd64"; \
    dpkg -i /tmp/filebot.deb; \
    rm /tmp/filebot.deb;

ADD startup.sh /

VOLUME /config
VOLUME /media
VOLUME /watch

# Set up unprivileged user
RUN useradd -u 1000 -s /bin/bash docker
USER docker
ENV HOME /config


ENTRYPOINT ["/startup.sh"]
