#!/usr/bin/env bash

root_folder=$1
sudo /usr/bin/python3 create_honeyfiles.py --root $root_folder

case $root_folder in
    */)
        honey_fname="${root_folder}.honey1.pdf"
        ;;
    *)
        honey_fname="${root_folder}/.honey1.pdf"
        ;;
esac

for d in $(find $root_folder -type d)
do
    if [ "$d" == "$root_folder" ]; then
        continue
    fi
    case $d in 
    */)
        sudo ln -s $honey_fname "${d}.honey1.pdf"
        ;;
    *)
        sudo ln -s $honey_fname "${d}/.honey1.pdf"
        ;;
    esac 
done

sudo /sbin/auditctl -w $honey_fname -p war

while inotifywait -q -e access,attrib,close,open,modify $honey_fname; do
	# pid_this = $(sudo /sbin/ausearch -f $honey_fname | more | grep -o ' pid=[0-9]* ' | grep -v 'grep' | sed 's/\ pid=//' | tr '\n' ' ' | xargs sudo kill -9 > /dev/null 2>&1)
	# pid_this=$(sudo /sbin/ausearch -f $honey_fname | more | grep -o ' pid=[0-9]* ')
	# echo ${pid_this}
	# echo "CRITICAL: A program tried to access a honey file and was killed."
done




