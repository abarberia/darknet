#!/bin/bash

usage()
{
    echo "usage: sysinfo_page [[[-f file ] [-w weights] [-i]] | [-h]]"
}

weights="weights/size_360.weights"
while [ "$#" != 0 ]; do
        case $1 in
                -w | --weights) weights=$2
                                shift 2
                                ;;
                -h | --help)    usage
                                exit
                                ;;
                * )             usage
                                exit
        esac
done

echo $weights
./darknet detector train obj.data cfg/obj_train.cfg $weigths 
