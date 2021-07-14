FROM rednoah/filebot:latest

ADD startup.sh /
ADD filebot.sh /
ADD postprocess.sh /

ENTRYPOINT ["/startup.sh"]
