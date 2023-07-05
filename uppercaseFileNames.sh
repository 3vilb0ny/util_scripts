#!/bin/bash

# Created by: Ignacio Cabrera - icabrera.alumex@gmail.com - 10/20/2021
# Transform fileNames to uppercase

for f in *; do
	x=$(echo $f | awk 'BEGIN { FS = "." } { print $1 }')
	y=$(echo $f | awk 'BEGIN { FS = "." } { print $2 }')
	mv $f ${x^^}.${y}
done
