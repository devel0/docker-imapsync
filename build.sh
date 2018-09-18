#!/bin/bash

source /scripts/constants
source /scripts/utils.sh
exdir=`executing_dir`

container_image=searchathing/imapsync

docker build --network=build -t $container_image "$exdir"
