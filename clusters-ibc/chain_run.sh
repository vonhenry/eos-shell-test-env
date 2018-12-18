#!/usr/bin/env bash

. ./init_system_contracts.sh

contract_acnt=eos222333ibc

create_some_account(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi

    create_one $1 ${contract_acnt}
    create_one $1 eosvoterbig1
    ${!cleos} transfer eosio eosvoterbig1 "200000100.0000 EOS"
    ${!cleos} system delegatebw eosvoterbig1 eosvoterbig1 "100000000.0000 EOS"  "100000000.0000 EOS"

    for i in a b c d e f g h i j; do
        name=eosvoter111${i}
        create_one $1 ${name}
        ${!cleos} transfer eosio ${name} "10000100.0000 EOS"
        ${!cleos} system delegatebw ${name}  ${name}  "5000000.0000 EOS"  "5000000.0000 EOS"
    done
}
create_some_account c1
create_some_account c2

. ./cluster-one/bp_keys.sh

create_register_producers(){
    cleos=cleos1 && base=1 && if [ "$1" == "c2" ];then cleos=cleos2 && base=2;fi
    bunch=$2 # 1 or 2

    for i in a b c d e f g h i j k l m n o p q r s t u v w x y z; do
        sfx=${bunch}${i}
        bpname=producer${base}1${sfx} && create_one $1 ${bpname}
        var=p${sfx}_pri && import_key ${!var}
        var=p${sfx}_pub && ${!cleos} system regproducer ${bpname} ${!var} http://${bpname}.io
    done
}
create_register_producers c1 1
create_register_producers c1 2
create_register_producers c2 1
create_register_producers c2 2


update_schedule(){
    p=producer11
    if [ "$1" == "c2" ];then p=producer21 ;fi

    schedule1="${p}1w ${p}1a ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t"

    schedule2="${p}1x ${p}1a ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t"

    schedule3="${p}1y ${p}1a ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t"

    schedule4="${p}1z ${p}1a ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
               ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t"
}

update_schedule c1
$cleos1 system voteproducer prods eosvoterbig1 ${schedule1}

update_schedule c2
$cleos2 system voteproducer prods eosvoterbig1 ${schedule1}


rotate(){
    while true; do
        sleep  $(( $RANDOM % 500 + 300 ))
        update_schedule c1
        num=$(( $RANDOM % 4 + 1 ))
        schedule=schedule${num}
        $cleos1 system voteproducer prods eosvoterbig1 ${!schedule}

        sleep  $(( $RANDOM % 200 ))
        update_schedule c2
        num=$(( $RANDOM % 4 + 1 ))
        schedule=schedule${num}
        $cleos2 system voteproducer prods eosvoterbig1 ${!schedule}
    done
}

rotate &

send_trxs(){
    cleos=cleos1 && if [ "$1" == "c2" ];then cleos=cleos2 ;fi
    for i in `seq 100 999`;do ${!cleos} transfer firstaccount ${contract_acnt} "0.0${i} EOS" -p firstaccount && sleep .1 ; done
}

send_trxs c1 &
send_trxs c2 &









