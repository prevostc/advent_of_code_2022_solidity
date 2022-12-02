#!/bin/sh

NUM=$1
TANS=$2
echo "Generating day $NUM with answer type $TANS"

find ./generators/* -type d | sed 's/\/generators//' | sed 's/{NUM}/'$NUM'/g' | xargs -I {} mkdir -p {}
TEMPLATES=$(find ./generators/* -type f)

for TEMPLATE in $TEMPLATES
do
    SRC=$TEMPLATE
    DST=$(echo $TEMPLATE | sed 's/\/generators//' | sed 's/{NUM}/'$NUM'/g')

    cp $SRC $DST

    sed -i "" 's/{NUM}/'$NUM'/g' $DST
    sed -i "" 's/{TANS}/'$TANS'/g' $DST
done