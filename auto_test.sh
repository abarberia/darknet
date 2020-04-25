#!/bin/bash
file=$1
weights=$2
while IFS= read line
do
	set $line
	image=$1
	output=$2
	./darknet detector test obj.data cfg/obj_test.cfg $weights $image -out $output -thresh 0.001
done <"$file"
