#!/bin/bash

mkdir -p /data/scripts
mkdir -p /watch/processed

cp -u -p /filebot.sh /data/scripts/filebot.sh
cp -u -p /postprocess.sh /data/scripts/postprocess.sh

chmod u+x  /data/scripts/filebot.sh
chmod u+x /data/scripts/postprocess.sh

 inotifywait -m -q -e moved_to,create --format '%f' /watch | while read FILE
 do
   echo "New file detected $FILE"
   ./data/scripts/filebot.sh $FILE
   ./data/scripts/postprocess.sh $FILE

   echo "Moving file $FILE to /watch/processed"
   mv "/watch/$FILE" /watch/processed
 done
