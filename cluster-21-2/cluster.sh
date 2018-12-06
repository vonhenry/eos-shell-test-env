#!/bin/bash

#
# This test ensures that connections with the same p2p-server-address
# are not closed as redundant.
#

###############################################################
# Extracts staging directory and launchs cluster.
###############################################################


. ./init.sh
. ./config.sh



cluster_init(){
    killall nodeos 2>/dev/null

    rm -rf staging
    rm -rf etc/eosio/node_*
    rm -rf var/lib

    cName=config.ini
    lName=logging.json
    gName=genesis.json

    path=staging/etc/eosio/node_bios
    mkdir -p $path
    echo "$configbios"  > $path/$cName
    echo "$loggingbios" > $path/$lName
    echo "$genesis"     > $path/$gName

    for i in `seq -w 00 10`; do
        path=staging/etc/eosio/node_$i
        mkdir -p $path
        c=config$i  && echo "${!c}" > $path/$cName
        echo "$config_common" >>  $path/$cName
        l=logging00 && echo "${!l}" > $path/$lName
        echo "$genesis" > $path/$gName
    done

}

pnodes=1
total_nodes=11
delay=1

cluster_begin(){
    $eosio_launcher -i $now -p $pnodes -n $total_nodes --nogen -d $delay

    sleep 5
    res=$(grep "reason = duplicate" var/lib/node_*/stderr.txt | wc -l)
    ret=0

    if [ $res -ne 0 ]; then
        echo FAILURE: got a \"duplicate\" message
        ret=1
    fi

    b5idbios=`$cleos -u http://127.0.0.1:8888 get block 5 | grep "^ *\"id\""`

    for i in `seq -w 00 10`; do
        echo -- check node $i --
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



cluster_start(){


}

cluster_stop(){
    eosio_launcher -k 15
    killall nodeos
    echo stop--
}

cluster_clear(){
    rm *.json *.dot *.ini  2>/dev/null
    rm -rf staging
    rm -rf etc/eosio/node_*
    rm -rf var/lib

    echo -- clear --
}




if [ "$#" -ne 1 ];then
	echo "usage: cluster.sh init|begin|start|stop|clear"
	exit 0
fi

if [ "$1" == "init"  ];then cluster_init;fi
if [ "$1" == "begin" ];then cluster_begin;fi
if [ "$1" == "stop"  ];then cluster_stop;fi
if [ "$1" == "clear" ];then cluster_clear;fi


