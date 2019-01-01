#!/usr/bin/env bash

. env.sh

contract_chain=ibc2chain555
contract_chain_folder=ibc.chain

contract_token=ibc2token555
contract_token_folder=ibc.token


set_contracts(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi
    ${!cleos} set contract ${contract_chain} ${CONTRACTS_DIR}/${contract_chain_folder} -x 1000 -p ${contract_chain}
    sleep .2
    ${!cleos} set contract ${contract_token} ${CONTRACTS_DIR}/${contract_token_folder} -x 1000 -p ${contract_token}
    sleep .2
}
set_contracts c1
set_contracts c2

init_contracts(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi
    ${!cleos}  push action  ${contract_chain} setglobal '[{"lib_depth":100}]' -p ${contract_chain}
    #cleos get table ${contract_chain} ${contract_chain} global

    ${!cleos} push action ${contract_token} setglobal '["ibc2chain555","ibc2token555",1000,1000,10,true]' -p ${contract_token}
    #cleos get table ${contract_token} ${contract_token} globals

}
init_contracts c1
init_contracts c2



action_test(){
    echo
}

action_test