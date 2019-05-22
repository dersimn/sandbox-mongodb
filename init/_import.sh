#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for d in $(find $DIR -mindepth 1 -type d); do
    db=$(basename $d)

    for f in $d/*.json; do
        collection=$(basename -- "$f")
        collection="${collection%.*}"

        echo "Importing into $db/$collection (file $f)"
        mongoimport --db $db --collection $collection --jsonArray --file $f
    done
done
