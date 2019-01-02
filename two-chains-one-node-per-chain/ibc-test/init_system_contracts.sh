#!/usr/bin/env bash

. init.sh

setup_system_contracts_and_issue_token(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi

    # step 1: set contract eosio.bios
    ${!cleos} set contract eosio ${CONTRACTS_DIR}/eosio.bios -p eosio

    # step 2: create system accounts
    sleep .5
    for account in eosio.aaa \
                   eosio.bpay eosio.msig eosio.names eosio.ram eosio.ramfee \
                   eosio.saving eosio.stake eosio.token eosio.vpay \
                   eosio.btc eosio.eth eosio.eos eosio.test
    do
        echo -e "\n creating $account \n";
        ${!cleos} create account eosio ${account} EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV -p eosio -x 1000
        sleep .2
    done

    # step 3: set contract
    echo step 3
    ${!cleos} set contract eosio.token ${CONTRACTS_DIR}/eosio.token -p eosio.token
    ${!cleos} set contract eosio.msig ${CONTRACTS_DIR}/eosio.msig -p eosio.msig

    # step 4: create and issue token
    echo step 4
    ${!cleos} push action eosio.token create '["eosio", "10000000000.0000 EOS"]' -p eosio.token
    ${!cleos} push action eosio.token issue '["eosio",  "1000000000.0000 EOS", "memo"]' -p eosio

    #setp 5: setting privileged account for eosio.msig
    ${!cleos} push action eosio setpriv '{"account": "eosio.msig", "is_priv": 1}' -p eosio

    # step 6: set contract eosio.system
    sleep .5
    ${!cleos} set contract eosio ${CONTRACTS_DIR}/eosio.system -x 1000 -p eosio
    ${!cleos} push action eosio init '[0, "4,EOS"]' -p eosio

}
setup_system_contracts_and_issue_token c1
setup_system_contracts_and_issue_token c2

sleep .2
create_firstaccount(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi
    echo "create first user account."
    new_keys
    ${!cleos} system newaccount \
         --stake-net "10000.0000 EOS" --stake-cpu "10000.0000 EOS" --buy-ram "10000.0000 EOS" \
         eosio firstaccount $pub_key $pub_key -p eosio --transfer
    ${!cleos} transfer eosio firstaccount "1000000.0000 EOS"
    import_key $pri_key
}
create_firstaccount c1
create_firstaccount c2

create_one(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi
    name=$2
    new_keys
    ${!cleos} system newaccount \
        --stake-net "1000.0000 EOS" --stake-cpu "1000.0000 EOS" --buy-ram "1000.0000 EOS" \
        firstaccount $name $pub_key $pub_key -p firstaccount
    ${!cleos} transfer firstaccount $name "100.0000 EOS"
    import_key $pri_key
}

create_account_by_pub_key(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi
    name=$2
    pub_key=$3
    ${!cleos} system newaccount \
        --stake-net "1000.0000 EOS" --stake-cpu "1000.0000 EOS" --buy-ram "1000.0000 EOS" \
        firstaccount $name $pub_key $pub_key -p firstaccount
    ${!cleos} transfer firstaccount $name "100.0000 EOS"
}