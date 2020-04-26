#!/bin/bash

usage()
{
    echo "usage: sysinfo_page [[[-f file ] [-w weights] [-i]] | [-h]]"
}
file="predictions.txt"
weights="weights/size_360.weights"
while [ "$#" != 0 ]; do
	case $1 in
		-f | --file)	file=$2
				shift 2
				;;
		-w | --weights)	weights=$2
				shift 2
				;;
		-h | --help)	usage
				exit
				;;
		* )		usage
				exit
	esac
done
#file=$1
#file="${image:-predictions.txt}"
#weights=$2
#weights="${weights:-weights/size_360.weights}"
echo $file
echo $weights
while IFS= read line
do
	set $line
	image=$1
	output=$2
	#image="${image:-predictions.txt}"
	#output="${output:-weights/size_360.weights}"
	#echo $image
	#echo $output
	#if [$image=='']
	#then
	#	image='predictions.txt'
	#fi
	#if [$output=='']
	#then
	#	output='weights/size_360.weights'
	#fi
	./darknet detector test obj.data cfg/obj_test.cfg $weights $image -out $output -thresh 0.001
done <"$file"
