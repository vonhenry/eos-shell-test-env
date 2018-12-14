#!/usr/bin/env bash

. ./task_ibc_test.sh

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

    cleos get table eos222333ibc eos222333ibc ibctrxs

    cleos push action eos222333ibc ibctrxinfo "[]" -p eos222333ibc

}

action_srcibctrx_test(){
    packed_trx="00a901000011010020569b05aa71b7e6d5c1c060d0206ae4bc4a7ec38eafb4fe01a69cb34245235ad46d8e4b3afdc5b77e7983b12c3b50e2c9fefea5d2136293288408b87c9e8866830000574c05115c2d0029035843000000000100a6823403ea3055000000572d3ccdcd010000000000ea305500000000a8ed3232250000000000ea3055103232374f8a3055102700000000000004454f5300000000046d656d6f00"
    seq=1
    src_block_num=2
    src_trx_id=c30fd22237abab1313da6ee4c4e41343053e86851279e74d50d803c0fdd47071
    src_packed_trx=${packed_trx_c30fd22237abab1313da6ee4c4e41343053e86851279e74d50d803c0fdd47071}
    relay=hhhh

    cleos push action eos222333ibc srcibctrx "[$seq, $src_block_num, $src_trx_id, $packed_trx,[], $relay]" -p eos222333ibc
}




pressure(){
    for i in `seq 100`; do cleos transfer eosio eoscontract1 "${i}.0000 EOS" memo; done

}









action_test