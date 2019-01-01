#!/usr/bin/env bash

. init_system_contracts.sh

receiver=111111111111

create_some_account(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi
    create_one $1 ${receiver}
}
create_some_account c1
create_some_account c2


send_trxs_c1(){
    echo $! >> logs/pids.txt

    for rr in `seq 1000000`; do
        for ii in `seq 100 999`;do $cleos1 transfer firstaccount ${receiver} "0.0${ii} EOS" -p firstaccount && sleep .3 ; done
    done
}
send_trxs_c1 > logs/send_trxs_c1.log 2>&1 &

send_trxs_c2(){
    echo $! >> logs/pids.txt

    for ss in `seq 1000000`; do
        for jj in `seq 100 999`;do $cleos2 transfer firstaccount ${receiver} "0.0${jj} EOS" -p firstaccount && sleep .3 ; done
    done
}
send_trxs_c2 > logs/send_trxs_c2.log 2>&1 &









