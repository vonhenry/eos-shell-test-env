#!/usr/bin/env bash

. init_system_contracts.sh

receiver=111111111111
create_one c1 ${receiver}
create_one c2 ${receiver}

contract_chain=ibc2chain555
contract_chain_folder=ibc.chain

contract_token=ibc2token555
contract_token_folder=ibc.token

create_some_account(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi
    create_one $1 ${contract_chain}
    create_one $1 ${contract_token}
}
create_some_account c1
create_some_account c2







