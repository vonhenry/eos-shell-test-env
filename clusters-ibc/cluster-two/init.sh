#!/usr/bin/env bash

base_dir=/Code/github.com

repo_dir=${base_dir}/vonhenry/eos
#repo_dir=${base_dir}/boscore/bos

build=build
#build=cmake-build-debug

nodeos=${repo_dir}/${build}/programs/nodeos/nodeos
eosio_launcher=${repo_dir}/${build}/programs/eosio-launcher/eosio-launcher
cleos=${repo_dir}/${build}/programs/cleos/cleos

now=`date -u +%Y-%m-%dT%H:%M:%S.000`

program_dir=./programs
if [ -d ${program_dir} ]; then
    rm -rf ${program_dir}
fi

mkdir -p ${program_dir}/nodeos
cp ${nodeos} ${program_dir}/nodeos/





