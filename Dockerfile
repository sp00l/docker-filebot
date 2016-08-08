FROM java:8
MAINTAINER Francis Belanger "francis.belanger@gmail.com"

RUN apt-get update && apt-get install -y inotify-tools

# Get filebot and install
RUN wget -O /tmp/filebot.deb "https://www.filebot.net/download.php?mode=s&type=deb&arch=amd64"; \
    dpkg -i /tmp/filebot.deb; \
    rm /tmp/filebot.deb;

ADD startup.sh /
ADD filebot.sh /
ADD postprocess.sh /

VOLUME /config
VOLUME /media
VOLUME /watch
VOLUME /downloads

RUN mkdir -p /root/.java/.systemPrefs
RUN mkdir /root/.java/.userPrefs
RUN export JAVA_OPTS="-Djava.util.prefs.systemRoot=/root/.java Djava.util.prefs.userRoot=/root/.java/.userPrefs"


ENTRYPOINT ["/startup.sh"]
