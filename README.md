This image wraps filebot into inotify and watch a folder /watch.
===============================================
How does it work:
---------------------
The image will listen for single file with inotify on a /watch folder. and then proceed to run filebot on a separate /downloads folder.

**Why a separate folder**

Some downloads will contains many files so I wanted to only start the script once.

Volumes:
-----------

* **/watch**: in this path inotify will wait for any text file and will execute filebot  on the /downloads folder.
* **/downloads**: This is where filebot will look for new content
* **/media** : This is where filebot will place the file
* **/data** : This is where filebot will place the his config files file.
  * amc-excludes.txt
  * amc.log
  * scripts/filebot.sh : The filebot script that will be executed. It can be modified, is so it won't be replaced.
 *  scripts/postprocess.sh : A post process script, where you can add any script to be executed after filebot is done. (cleanup, move downloded file, etc.)

Why:
-----
I needed a way for many services [deluge, pyLoad, amule] to use filebot as a post process script but did not want to implement multiple filebot scripts.
