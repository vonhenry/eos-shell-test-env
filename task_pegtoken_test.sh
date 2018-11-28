#!/usr/bin/env bash

create_some(){
    for i in 1a 1b 1c 1d 1e 1f 1g 1h 1i; do create_one eosstoreff${i}; done
    for i in btcissuerhb1 btcissuerzb1 ; do create_one ${i}; done
}
create_some

eosio_mtoken_test(){

    cleos set contract eosio.btc ${CONTRACTS_DIR}/eosio.mtoken -x 1000 -p eosio.btc


    cleos push action eosio.btc init '["8,BTC","non-repeatable"]' -p eosio.btc
    cleos get table eosio.btc eosio.btc global

    cleos push action eosio.btc create '["btcissuerhb1","100000.00000000 BTCHB","火币集团","https://www.huobi.io","每个交易0.1 EOS","我是火币","huobidizhi","active"]' -p eosio.btc
    cleos push action eosio.btc create '["btcissuerzb1","100000.00000000 BTCZB","中币集团","https://www.zhongbi.io","每个交易0.2 EOS","我是中币","zhongbidizhi","active"]' -p eosio.btc
    cleos get table eosio.btc BTCHB stat
    cleos get table eosio.btc BTCZB stat
    cleos get table eosio.btc eosio.btc symcodes


    cleos push action eosio.btc setmaxsupply '["2000000.00000000 BTCHB"]' -p eosio.btc
    cleos get table eosio.btc eosio.btc global

    cleos push action eosio.btc update '["BTCHB","organization","火币集团2"]' -p btcissuerhb1
    cleos push action eosio.btc update '["BTCHB","website","https://www.abc.io2"]' -p btcissuerhb1
    cleos push action eosio.btc update '["BTCHB","miner_fee","每个交易0.1 EOS -2"]' -p btcissuerhb1
    cleos push action eosio.btc update '["BTCHB","service_fee","哈哈-2"]' -p btcissuerhb1
    cleos push action eosio.btc update '["BTCHB","unified_recharge_address","lkjlkljjl-2"]' -p btcissuerhb1
    cleos push action eosio.btc update '["BTCHB","state","active-2"]' -p btcissuerhb1

    cleos push action eosio.btc assignaddr '["BTCHB","eosstoreff1a","--address-11--"]'  -p btcissuerhb1
    cleos push action eosio.btc assignaddr '["BTCHB","eosstoreff1b","--address-2--"]'  -p btcissuerhb1
    cleos push action eosio.btc assignaddr '["BTCZB","eosstoreff1a","--address-3--"]'  -p btcissuerzb1
    cleos push action eosio.btc assignaddr '["BTCZB","eosstoreff1b","--address-4--"]'  -p btcissuerzb1

    cleos get table eosio.btc BTCHB rchrgaddr
    cleos get table eosio.btc BTCZB rchrgaddr


    cleos push action eosio.btc issue  '["eosstoreff1a","1000.00000000 BTCHB","memo"]'  -p btcissuerhb1
    cleos push action eosio.btc issue  '["eosstoreff1a","1000.00000000 BTCZB","memo"]'  -p btcissuerzb1

    cleos push action eosio.btc withdraw '["eosstoreff1a","ddddddddzzzzzzhhhhhhhiiiiii","100.00000000 BTCHB","memo"]'  -p eosstoreff1a
    cleos push action eosio.btc withdraw '["eosstoreff1a","ddddddddzzzzzzhhhhhhhizzzzz","100.00000000 BTCZB","memo"]'  -p eosstoreff1a

    cleos get table eosio.btc BTCHB withdraws
    cleos get table eosio.btc BTCZB withdraws

    cleos get account eosstoreff1a
    cleos get currency balance eosio.btc eosstoreff1a BTCHB
    cleos get currency stats eosio.btc BTCHB

#    cleos push action eosio.btc feedback '["BTCHB",1,3,"memo"]' -p btcissuerhb1
#    cleos push action eosio.btc rollback '["BTCHB",2,"memo"]' -p btcissuerhb1

}
#eosio_mtoken_test




ibc_token_test(){

    a=eostest12345
    create_one ${a}
    cleos set contract ${a} ${CONTRACTS_DIR}/ibc.token -x 1000 -p ${a}

    cleos transfer eosfirstacnt ${a}  "12.0000 EOS" -p eosfirstacnt

#    cleos push action ${a} transfer '["eosfirstacnt","eostest12345","1.2356 EOS","memo"]' -p eosfirstacnt

#    cleos push action ${a} transfer '["eosfirstacnt","eostest12345","1.2356 EOS","memo"]' -p eosfirstacnt
}




#  cleos transfer eosfirstacnt eostest12345  "12.0000 EOS" hhh  -p eosfirstacnt

#  cleos transfer eosfirstacnt eostest12345  "12.0000 EOS" -p eosfirstacnt



