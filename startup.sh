#!/bin/bash
mkdir /var/run/sshd

#if [ `java -version` < 8] 
#then
add-apt-repository ppa:webupd8team/java -y
apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get install -y --force-yes oracle-java8-installer
#fi

if [ `uname -m` = "i686" ]
then
   wget -O filebot-i386.deb 'http://filebot.sourceforge.net/download.php?type=deb&arch=i386'
else
   wget -O filebot-amd64.deb 'http://filebot.sourceforge.net/download.php?type=deb&arch=amd64'
fi
sudo dpkg --force-depends -i filebot-*.deb && rm filebot-*.deb

filebot \
-script fn:amc \
-extract \
--log-file /data/amc.log \
--action move \
-non-strict \
/input \
--def \
"seriesFormat=/output/Serien/{n.ascii()}/{'S'}{s.pad(2)}/{n.ascii()} - {s00e00} - {t.ascii()}" \
"movieFormat=/output/Filme/{n.ascii()} [{vf}] [{rating}] ({y})/{n.ascii()} [{vf}] [{rating}] ({y}){' CD'+pi}{'.'+lang}" \
--conflict auto \
--def subtitles=en,de \
--def artwork=y \
--def reportError=y \
--def clean=y \
--lang de
