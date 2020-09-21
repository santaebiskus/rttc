#!/bin/bash
ARGS=2
E_BADARGS=65

if [ $# -ne $ARGS ]
then
    echo "Порядок использования: `basename $0` больше/меньше(g/l) размер(килобайт)"
    exit $E_BADARGS
fi

for file in ./*
do

if [[ "$0" != "$file" ]]
then
    size=$(stat -c %s $file)
    if [ $1 = "l" ] 
    then
        if [ $2 -gt $size ]
	then
	    echo "$size"
	    rm $file
	fi
    else
	if [ $2 -lt $size ]
	then
	    echo "$size"
	    rm $file
	fi
    fi
fi
done
