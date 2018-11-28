#!/usr/bin/env bash

contract_acnt=eoscontract1
contract_folder=ibc.token

echo  -------------------- IBC TOKEN TEST ------------------------

create_some_account(){
    create_one ${contract_acnt}
    for i in 1 2 3; do create_one eosaccount1${i}; done
}
create_some_account

set_contract(){
    cleos set contract ${contract_acnt} ${CONTRACTS_DIR}/${contract_folder} -x 1000 -p ${contract_acnt}
}
set_contract

action_test(){
#    action_ps_test
    echo
}


action_transfer_test(){
    cleos transfer eosio eoscontract1 "1.0000 EOS" memo
}















action_ps_test(){

    cleos push action ${contract_acnt} ps '{"params":{"version":1,"producers":[{"producer_name":"111111111111","block_signing_key":"EOS7oddAcr4iyUvBHdhEaXjFra2sGypyVMekXJp2YuTd4gc7LUsUz"}]}}' -p ${contract_acnt}
    cleos get table ${contract_acnt} ${contract_acnt} producers


    cleos push action ${contract_acnt} header '{"header":{"timestamp":123,"producer":"store","confirmed":1,"previous":"00000001405147477ab2f5f51cda427b638191c66d2c59aa392d5c2c98076cb0","transaction_mroot":"00000001405147477ab2f5f51cda427b638191c66d2c59aa392d5c2c98076cb0","action_mroot":"00000001405147477ab2f5f51cda427b638191c66d2c59aa392d5c2c98076cb0","schedule_version":1,"new_producers":"","header_extensions":[]}}' -p ${contract_acnt}

}

action_merkle_test(){
    cleos push action  ${contract_acnt} merkle '{"params":{ "node_count":0,"active_nodes":[]}}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"5209329302892569182278441589045987214553276121327238411040043610"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"2002830094190670678012698709261028169396178961481040015178815798"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"1370738826195036721363136108356902215481066218711631203411993254"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"1830665860100289845111512065420975494784225275941840335376309696"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"3938607621073226880100902100720851879379680217662057114902091824"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"4965864261006609540210367714892086236171002874567946941416718899"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"1294600846521073181741849297764058775173110601259029412818464438"}' -p ${contract_acnt}

    cleos push action  ${contract_acnt} merkle '{"params":{ "node_count":1,"active_nodes":["00001e3bf0fc6e665ed48bb39967af815742ffe55a095069319d883e65d2bd95","00001e3bf0fc6e665ed48bb39967af815742ffe55a095069319d883e65d2bd96"]}}' -p ${contract_acnt}
    cleos get table ${contract_acnt} ${contract_acnt} incrmerkle
}










action_test