#!/bin/bash

#Created by Ignacio Cabrera - 11/16/2020

clear
echo -e "Change Encoding \n"

source=$1
if [ -z "$source" ];then
    echo "The shource can not be empty"
   exit 0
fi

extension=$2
if [ -z "$extension" ];then
    echo "The extension can not be empty"
    exit 0
fi

input_encoding=$3
if [ -z "$input_encoding" ];then
    echo "The input encoding can not be empty"
   exit 0
fi
output_encoding=$4
if [ -z "$output_encoding" ];then
    echo "The output encoding can not be empty"
    exit 0
fi

echo -e "Finding files...\n"
list=$(find $source -type f -name "*.$extension")

if [ -z "$list" ];then
    echo "No file found"
else
    echo -e "Changing encoding...\n"

    for item in $list;do
        echo "Item: $item"

        iconv -f $input_encoding -t $output_encoding $item > ${item}.x
        cp ${item}.x ${item}
        rm ${item}.x
    done
    echo "Done!"
fi
