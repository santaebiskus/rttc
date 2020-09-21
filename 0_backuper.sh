#!/bin/bash
cdate=$(date +%d-%m-%y)
ctime=$(date +%d-%m-%y_%H:%M:%S)
path=/home/ebiskus/bash/$cdate
mkdir -pm 777 $cdate
cp -r /home/ebiskus/project $path
cp -r /home/ebiskus/project2 $path
tar -czf $cdate.tar.gz $cdate
rm -r $path
if [[ -n $(ls | grep 'backup_journal.txt') ]]
then
    echo "$ctime   $(ls | grep $cdate)" >> backup_journal.txt
else
    touch backup_journal.txt
    echo "Журнал создан $cdate" > backup_journal.txt
    echo "" >> backup_journal.txt
    echo "    Дата/Вермя            Файл" >> backup_journal.txt
    echo "$ctime   $(ls | grep $cdate)" >> backup_journal.txt
fi
