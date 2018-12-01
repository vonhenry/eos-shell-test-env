#!/usr/bin/env bash

#. ./task_ibc_test.sh

contract_acnt=eoscontract1
contract_folder=ibc.token

echo  -------------------- IBC TOKEN TEST ------------------------

create_some_account(){
    create_one ${contract_acnt}
    cleos set account permission ${contract_acnt} active '{"threshold": 1, "keys":[{"key":"'${pub_key}'", "weight":1}], "accounts":[{"permission":{"actor":"'${contract_acnt}'","permission":"eosio.code"},"weight":1}], "waits":[] }' owner -p ${contract_acnt}
    for i in 1 2 3; do create_one eosaccount2${i}; done
}
create_some_account

set_contract(){
    cleos set contract ${contract_acnt} ${CONTRACTS_DIR}/${contract_folder} -x 1000 -p ${contract_acnt}
}
set_contract

action_test(){
#    action_ps_test
    echo
}


action_transfer_test(){
    cleos transfer eosio eoscontract1 "1.0000 EOS" memo

     cleos push action eos222333ibc ibctrxinfo "[]" -p eos222333ibc

}


pressure(){
    for i in `seq 100`; do cleos transfer eosio eoscontract1 "${i}.0000 EOS" memo; done

}









action_test