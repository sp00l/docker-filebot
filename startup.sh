#!/bin/bash

filebot \
-script fn:amc \
--output "/media" \
--log-file /config/amc.log \
--def excludeList=/config/amc.txt \
--action duplicate \
-non-strict \
--conflict auto \
--def subtitles=en \
--def reportError=y \
--def clean=y \
--lang en
"ut_dir=/watch" "ut_kind=multi"