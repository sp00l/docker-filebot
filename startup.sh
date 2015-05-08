#!/bin/bash

mkdir -p /config/scripts
mkdir -p /watch/processed

cp -u -p /filebot.sh /config/scripts/filebot.sh
cp -u -p /postprocess.sh /config/scripts/postprocess.sh

chmod u+x  /config/scripts/filebot.sh
chmod u+x /config/scripts/postprocess.sh

 inotifywait -m -q -e moved_to,create --format '%f' /watch | while read FILE
 do
   echo "New file detected $FILE"
   ./config/scripts/filebot.sh $FILE
   ./config/scripts/postprocess.sh $FILE

   echo "Moving file $FILE to /watch/processed"
   mv "/watch/$FILE" /watch/processed
 done