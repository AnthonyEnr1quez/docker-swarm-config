#!/bin/bash

# files=(*.yml)
# echo ${files[@]}

args=( "$@" )
ds="env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy"
for i in "${args[@]}"
do
    ds+=" -c $i"
done

docker stack ls
echo "What stack to update?"
read stackName
ds+=" ${stackName}"
eval $ds
