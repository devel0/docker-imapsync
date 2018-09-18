#!/bin/bash

source /scripts/constants
source /scripts/utils.sh
exdir=`executing_dir`

container=imapsync
container_image=searchathing/imapsync
container_data=/nas/data/imapsync
net=imapsync
ip="$ip_imapsync_srv"
cpus="2"
memory="256m"

dk-rm-if-exists $container

docker run \
        -d \
	-ti \
        --name "$container" \
	--network="$net" \
        --ip=$ip \
        --restart="unless-stopped" \
        --cpus="$cpus" \
        --memory="$memory" \
	--volume="/security/mail_srv0:/security/mail_srv0:ro" \
        "$container_image" \
	/bin/bash
