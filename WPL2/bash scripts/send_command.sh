#!/bin/bash
args=("@")
last_index=${#args[@]}
command=${args[last_index-1]}

if [ ${args[0]} == "classroom" ]; then
        for ((i=50;i<62;i++)); do
        echo "ssh student@10.14.1.${i} $command"
        done
else
        for ((i=0;i<$last-index-1;i++)); do
        echo "ssh student@10.14.1.${args[${i}]} $command"
        done
fi
