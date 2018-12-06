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

pnodes=1
total_nodes=2
topo=star
delay=1

cluster_init(){
    killall nodeos
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

    path=staging/etc/eosio/node_00
    mkdir -p $path
    echo "$config00"    > $path/$cName
    echo "$logging00"   > $path/$lName
    echo "$genesis"     > $path/$gName

    path=staging/etc/eosio/node_01
    mkdir -p $path
    echo "$config01"    > $path/$cName
    echo "$logging01"   > $path/$lName
    echo "$genesis"     > $path/$gName
}

cluster_start_and_check(){
    $eosio_launcher -i $now -p $pnodes -n $total_nodes --nogen -d $delay

    sleep 5
    res=$(grep "reason = duplicate" var/lib/node_*/stderr.txt | wc -l)
    ret=0

    if [ $res -ne 0 ]; then
        echo FAILURE: got a \"duplicate\" message
        ret=1
    fi

    b5idbios=`$cleos -u http://127.0.0.1:8888 get block 5 | grep "^ *\"id\""`
    b5id00=`$cleos -u http://127.0.0.1:8889 get block 5 | grep "^ *\"id\""`
    b5id01=`$cleos -u http://127.0.0.1:8890 get block 5 | grep "^ *\"id\""`

    if [ "$b5idbios" != "$b5id00" ]; then
        echo FAILURE: nodes are not in sync
        ret=1
    fi

    if [ "$b5idbios" != "$b5id01" ]; then
        echo FAILURE: nodes are not in sync
        ret=1
    fi

    if [ $ret  -eq 0 ]; then
        echo SUCCESS
    fi
}

cluster_stop(){

    killall nodeos
    echo stop--
}

cluster_clear(){

    echo clear--

}




if [ "$#" -ne 1 ];then
	echo "usage: cluster.sh init|start|stop|clear"
	exit 0
fi

if [ "$1" == "init"  ];then cluster_init;fi
if [ "$1" == "start" ];then cluster_start_and_check;fi
if [ "$1" == "stop"  ];then cluster_stop;fi
if [ "$1" == "clear" ];then cluster_clear;fi


# === launchs cluster ===



#$eosio_launcher -k 15
#rm -rf staging
#rm -rf var/lib/node_*
#rm -rf etc/eosio/node_*
#exit $ret


