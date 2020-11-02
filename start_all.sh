#!/bin/bash
# run this only on master node rn

## todo check if running
docker network create -d overlay --attachable proxy # attachable for qbittorrent until swarmable
docker-compose -f nfs_server.yml up -d

# echo all ymls
# TODO filter caddy and nfs_server from options'
files=(*.yml)
echo ${files[@]}

args=( "$@" )
ds="docker stack deploy -c caddy.yml"
for i in "${args[@]}"
do
    ds+=" -c $i"
done
ds+=" caddy"
echo $ds
eval $ds

# valid=()
# for i in "${files[@]}"
#     if
# do
#done
