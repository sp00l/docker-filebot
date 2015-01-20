FROM ubuntu:14.04
MAINTAINER Sven Hartmann <sid@sh87.net>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-mark hold initscripts udev plymouth mountall
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -sf /bin/true /sbin/initctl

RUN apt-get update \
    && apt-get install -y --force-yes software-properties-common \
        openssh-server sudo \
        net-tools \
#        lxde-core lxde-icon-theme x11vnc xvfb screen openbox \
        nodejs \
#        firefox \
	htop bmon nano wget \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*



ADD startup.sh /
EXPOSE 22
WORKDIR /
ENTRYPOINT ["/startup.sh"]
