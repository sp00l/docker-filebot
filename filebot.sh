echo "Running filebot rebuild...$0 $1 $2"

/usr/bin/filebot -script fn:amc --output "/media" --log-file /config/amc.log --action duplicate --conflict auto -non-strict --def reportError=y "ut_dir=/downloads" "ut_kind=multi" --def clean=y