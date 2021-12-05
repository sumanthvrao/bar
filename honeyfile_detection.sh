#!/usr/bin/env bash

root_folder=$1
echo $root_folder

sudo /usr/bin/python3 create_honeyfiles.py --root $root_folder

# sudo /sbin/auditctl -w $HOME/.aa.pdf -p war

# while inotifywait -e access,attrib,close,open,modify -o ./logs.txt ./root_folder/test1.txt; do 
# 	echo test
# done




