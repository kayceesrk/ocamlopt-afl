#!/bin/bash

files="$(find out -name "id*" | grep "crashes")"
prefix=$RANDOM
temp_dir=/tmp/${prefix}

mkdir ${temp_dir}

num=0
for f in ${files}
do
	cp $f ${temp_dir}/crash_${prefix}_${num}.ml
	num=$((num+1))
done

tar cvzf crashes_${prefix}.tar.gz -C ${temp_dir} .
rm -rf ${temp_dir}
