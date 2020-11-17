#!/bin/bash
source .nfs_conn

# files=(*.yml)
# echo ${files[@]}

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
