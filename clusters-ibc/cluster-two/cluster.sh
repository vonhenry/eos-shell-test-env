#!/bin/bash

. init.sh
. config.sh

cluster_init(){
    cluster_clear

    cName=config.ini
    lName=logging.json
    gName=genesis.json

    path=staging/etc/eosio/node_bios
    mkdir -p $path
    echo "$configbios"  > $path/$cName
    echo "$logging" > $path/$lName
    echo "$genesis"     > $path/$gName

    for i in `seq -w 00 25`; do
        path=staging/etc/eosio/node_$i
        mkdir -p $path
        c=config$i  && echo "${!c}" > $path/$cName
        echo "$config_common" >>  $path/$cName
        l=logging && echo "${!l}" > $path/$lName
        echo "$genesis" > $path/$gName
    done
}

pnodes=1
total_nodes=25
delay=0

cluster_dump(){
    $eosio_launcher -p $pnodes -n $total_nodes --nogen -o topology
}

cluster_start(){
    $eosio_launcher -i $now -p $pnodes -n $total_nodes --nogen -d $delay

    sleep 5
    res=$(grep "reason = duplicate" var/lib/node_*/stderr.txt | wc -l)
    ret=0

    if [ $res -ne 0 ]; then
        echo FAILURE: got a \"duplicate\" message
        ret=1
    fi

    b5idbios=`$cleos -u http://127.0.0.1:8888 get block 5 | grep "^ *\"id\""`

    for i in `seq -w 00 24`; do
        echo -- check node $i --
        sleep .3
        b5id=`$cleos -u http://127.0.0.1:88${i} get block 5 | grep "^ *\"id\""`
        if [ "$b5idbios" != "$b5id" ]; then
            echo FAILURE: nodes are not in sync
            ret=1
        fi
    done

    if [ $ret  -eq 0 ]; then
        echo SUCCESS
    fi

    echo "tail -f ./var/lib/node_01/stderr.txt"
}


cluster_down(){
    $eosio_launcher -k 15
}


cluster_bounce(){
    echo
}

cluster_clear(){
    $eosio_launcher -k 15 2>/dev/null
    rm *.json *.dot *.ini *.log topology* 2>/dev/null
    rm -rf staging
    rm -rf etc/eosio/node_*
    rm -rf var/lib
}


if [ "$#" -ne 1 ];then
	echo "usage: cluster.sh init|start|down|bounce|clear"
	exit 0
fi


case "$1"
in
    "init"  )   cluster_init;;
    "start" )   cluster_start;;
    "down"  )   cluster_down;;
    "bounce")   cluster_bounce;;
    "clear" )   cluster_clear;;
    "dump"  )   cluster_dump;;
    *) echo "usage: cluster.sh init|start|down|bounce|clear|dump" ;;
esac


