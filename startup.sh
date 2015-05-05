#!/bin/bash

mkdir -p /config/scripts
cp -u -p /filebot.sh /config/scripts/filebot.sh
cp -u -p /postprocess.sh /config/scripts/postprocess.sh


 inotifywait -m -q -e moved_to,create --format '%f' /watch | while read FILE
 do
   echo "something happened on path $FILE"
   ./config/scripts/filebot.sh $FILE
   ./config/scripts/postprocess.sh $FILE
 done
