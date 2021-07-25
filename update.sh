#!/bin/bash
source .nfs_conn

# files=(*.yml)
# echo ${files[@]}

# todo, add step to clean up nfs docker volumes somehow on each node?????
# todo, need pihole dns var for whoogle?

args=( "$@" )
ds="NFS_CONN=${NFS_CONN} docker stack deploy"
for i in "${args[@]}"
do
    ds+=" -c $i"
done

docker stack ls
echo "What stack to update?"
read stackName
ds+=" ${stackName}"
eval $ds
