#!/usr/bin/env bash


while read -r p; do
    echo "killing pid: $p"
    kill -9 $p
done < ./logs/pids.txt

rm -rf ./logs/*