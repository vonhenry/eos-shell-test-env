#!/usr/bin/env bash

. env.sh
#. chains_init.sh



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

    # --- ibc.chain ---
    ${!cleos}  push action  ${contract_chain} setglobal '[{"lib_depth":50}]' -p ${contract_chain}
    ${!cleos}  push action  ${contract_chain} relay '["add","ibc2relay555"]' -p ${contract_chain}
    #cleos get table ${contract_chain} ${contract_chain} global

    # --- ibc.token ---
    ${!cleos} push action ${contract_token} setglobal '["ibc2chain555","ibc2token555",1000,1000,10,true]' -p ${contract_token}

    ${!cleos} push action ${contract_token} regacpttoken \
    '["eosio.token","1000000000.0000 EOS","ibc2token555","1.0000 EOS","100.0000 EOS",
    "1000.0000 EOS",100,"org","websit","fixed","0.0100 EOS",0.01,true,"4,EOS"]' -p ${contract_token}



    ${!cleos} push action ${contract_token} regpegtoken \
    '["1000000000.0000 EOS","1.0000 EOS","100.0000 EOS","1000.0000 EOS",100,
    "ibc2token555","eosio.token","4,EOS",true]' -p ${contract_token}



    #cleos get table ${contract_token} ${contract_token} globals

}
init_contracts c1
init_contracts c2




test(){
    $cleos1 get table ${contract_chain} ${contract_chain} sections # prodsches chaindb

}





transfer(){
    $cleos1 transfer firstaccount ibc2token555 "1.0000 EOS" "ibc receiver=chengsong111" -p firstaccount
    $cleos2 transfer firstaccount ibc2token555 "1.0000 EOS" "ibc receiver=chengsong111" -p firstaccount
}




















action_test(){
    echo
}

action_test