#!/usr/bin/env bash

if [ "$1" == "re" ];then
    rm -rf /Users/song/tmp/eosio/data/*
fi

killall nodeos

nodeos -e -p eosio -d /Users/song/tmp/eosio/data --config-dir /Users/song/tmp/eosio/config  \
    --plugin eosio::chain_api_plugin --plugin eosio::producer_plugin  \
    --plugin eosio::producer_api_plugin --plugin eosio::history_api_plugin  \
    --contracts-console  --max-transaction-time 1000