#!/bin/bash
source .nfs_conn

files=(*.yml)
echo ${files[@]}

args=( "$@" )
ds="NFS_CONN=${NFS_CONN} docker stack deploy"
for i in "${args[@]}"
do
    ds+=" -c $i"
done
ds+=" caddy"
echo $ds
eval $ds

#https://github.com/moby/moby/issues/29133
