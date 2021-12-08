#!/usr/bin/env bash

root_folder=$1
sudo /usr/bin/python3 create_honeyfiles.py --root $root_folder

case $root_folder in
    /*)
        ;;
    ./*)
        cwd_variable=$(pwd)
        root_folder=${root_folder:2}
        root_folder="${cwd_variable}/${root_folder}"
        ;;
    *)
        cwd_variable=$(pwd)
        root_folder="${cwd_variable}/${root_folder}"
        ;;
esac

case $root_folder in
    */)
        honey_fname="${root_folder}.honey1.pdf"
        ;;
    *)
        honey_fname="${root_folder}/.honey1.pdf"
        ;;
esac

sudo chmod 777 $honey_fname

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


while inotifywait -q -e access,attrib,open,modify $honey_fname; do
    echo "IN LOOP"
    pid_this=$(lsof $honey_fname | awk 'NR==2 {print $2}')
    echo ${pid_this}
    
    if [ "$pid_this" ]; then
        echo ${pid_this}
        inotifywait -q -e close $honey_fname
        kill -STOP ${pid_this}
        echo "CRITICAL: A program tried to access a honey file and was suspended. Running checks."
        file_found=$(find $root_folder | grep $honey_fname)
        echo ${file_found}
        if [ "$file_found" == "" ]; then
            kill -9 ${pid_this}
            echo "CRITICAL: The program overwrote the honey file and was killed"
        fi
        kill -CONT ${pid_this}
    fi
done




