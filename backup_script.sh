#!/bin/bash

SOURCE=/home/$USER
DEST=/tmp/backup
LOG=/home/$USER/backup.log

mkdir -p $DEST

rsync -avh --delete --exclude='.*' --checksum $SOURCE/ $DEST/ >> $LOG 2>&1


if [ $? -eq 0 ]; then
    echo "$(date) - OK" >> $LOG
else
    echo "$(date) - ERROR" >> $LOG
fi

