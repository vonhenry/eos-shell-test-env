#!/usr/bin/env bash


while read -r p; do
    kill -9 $p
done < ./logs/pids.txt

rm -rf ./logs/*