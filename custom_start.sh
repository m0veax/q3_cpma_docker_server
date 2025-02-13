#!/bin/sh

cd /opt/q3

./cnq3-server-x64 \
+set dedicated 2 \
+set sv_master1 master.quake3arena.com:27950 \
+set sv_master2 master.ioquake3.org:27950 \
+set sv_master3 master.maverickservers.com:27950 \
+set sv_master4 master.quakeservers.net:27950 \
+set sv_master5 master.qtracker.com:27900 \
+set fs_game cpma \
+set net_port 27960 \
+set ttycon 1 \
+set developer 0 \
+exec server.cfg \
+map q3dm6 &

tail -f /proc/1/fd/1


