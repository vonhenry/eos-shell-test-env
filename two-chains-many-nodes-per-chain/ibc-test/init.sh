#!/bin/bash

. env.sh

start_keosd(){
    killall keosd 2>/dev/null
    rm -rf ${WALLET_DIR}
    mkdir ${WALLET_DIR}
    nohup keosd --wallet-dir ${WALLET_DIR} --unlock-timeout 90000 1>/dev/null  2>/dev/null &
}
start_keosd


create_wallet(){
    rm -rf ~/eosio-wallet/
    cleos wallet create -f ${WALLET_DIR}/password.txt
    cleos wallet import --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
}
create_wallet

new_keys(){
    str=`cleos create key --to-console`
    pri_key=`echo $str | cut -d' ' -f 3`
    pub_key=`echo $str | cut -d' ' -f 6`
}

import_key(){
    cleos wallet import --private-key $1
}

#create_system_account(){
#    new_keys && cleos create account eosio $1 $pub_key -p eosio && import_key ${pri_key}
#}

