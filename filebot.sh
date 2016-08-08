echo "Running filebot ...$0 $1 $2"

PROCESS_PATH=$(cat "/watch/$1")
if [ "$PROCESS_PATH" = "" ]; then PATH="/downloads"; fi

echo "Path is $PROCESS_PATH"

/usr/bin/filebot -script fn:amc -no-xattr --output "/media" --log-file /config/amc.log --action duplicate --conflict auto -non-strict --def reportError=y "ut_dir=$PROCESS_PATH" "ut_kind=multi" --def clean=y --def excludeList=amc.txt --def "exec=chmod 777 -R '{folder}'"

echo "Done..."
