#!/usr/bin/env bash

# sudo /usr/bin/python create_honeyfiles.py

# sudo /sbin/auditctl -w $HOME/.aa.pdf -p war

while inotifywait -e access,attrib,close,open,modify -o ./logs.txt ./root_folder/test1.txt; do 
	echo test
done

