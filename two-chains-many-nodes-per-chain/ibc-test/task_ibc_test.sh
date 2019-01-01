#!/usr/bin/env bash

. env.sh

echo  -------------------- IBC TEST ------------------------

set_contract(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi
    ${!cleos} set contract ${contract_acnt} ${CONTRACTS_DIR}/${contract_folder} -x 1000 -p ${contract_acnt}
}
set_contract c1
set_contract c2

action_setglobal(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi
    ${!cleos}  push action  ${contract_acnt} setglobal '[{"lib_depth":100}]' -p ${contract_acnt}
}
action_setglobal c1
action_setglobal c2

action_test(){
    echo
}

action_test