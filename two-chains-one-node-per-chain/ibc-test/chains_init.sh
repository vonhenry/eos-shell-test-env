#!/usr/bin/env bash

. init_system_contracts.sh

receiver=111111111111
create_one c1 ${receiver}
create_one c2 ${receiver}

contract_chain=ibc2chain555
contract_chain_folder=ibc.chain

contract_token=ibc2token555
contract_token_folder=ibc.token

new_account(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi
    create_one $1 $2
}
new_account c1 ${contract_chain}
new_account c1 ${contract_token}
new_account c2 ${contract_chain}
new_account c2 ${contract_token}
new_account c1 chengsong111
new_account c2 chengsong111

create_account_by_pub_key c1 ibc2relay555 EOS5jLHvXsFPvUAawjc6qodxUbkBjWcU1j6GUghsNvsGPRdFV5ZWi
create_account_by_pub_key c2 ibc2relay555 EOS5jLHvXsFPvUAawjc6qodxUbkBjWcU1j6GUghsNvsGPRdFV5ZWi







