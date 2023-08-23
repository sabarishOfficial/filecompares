#!/bin/bash

file1="/home/ec2-user/first.txt"
file2="/home/ec2-user/second.txt"

while IFS='=' read -r keyfile valuefile; do
        if [[ -n keyfile && -n valuefile ]] ; then
                valuesfile1=$(grep -Po "(?<=^$keyfile=).*" "$file2")

                if [ "$valuefile" = "$valuesfile1" ]; then
                        echo "$keyfile"
                        echo "already upto date"
                else [ "$valuefile" != "$valuesfile1" ]
                        echo "$keyfile"
                        echo "values update"

                fi
        fi
done < $file1
