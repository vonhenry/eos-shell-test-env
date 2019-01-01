#!/usr/bin/env bash

read -d '' genesis << EOF
{
  "initial_timestamp": "2018-12-04T12:00:00.000",
  "initial_key": "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV",
  "initial_configuration": {
    "max_block_net_usage": 1048576,
    "target_block_net_usage_pct": 1000,
    "max_transaction_net_usage": 524288,
    "base_per_transaction_net_usage": 12,
    "net_usage_leeway": 500,
    "context_free_discount_net_usage_num": 20,
    "context_free_discount_net_usage_den": 100,
    "max_block_cpu_usage": 200000,
    "target_block_cpu_usage_pct": 1000,
    "max_transaction_cpu_usage": 150000,
    "min_transaction_cpu_usage": 100,
    "max_transaction_lifetime": 3600,
    "deferred_trx_expiration_window": 600,
    "max_transaction_delay": 3888000,
    "max_inline_action_size": 4096,
    "max_inline_action_depth": 4,
    "max_authority_depth": 6
    }
}
EOF

read -d '' configbios << EOF
p2p-server-address = localhost:9976
plugin = eosio::producer_plugin
plugin = eosio::chain_api_plugin
plugin = eosio::net_plugin
plugin = eosio::history_api_plugin
http-server-address = 127.0.0.1:8889
blocks-dir = blocks
p2p-listen-endpoint = 0.0.0.0:9976
allowed-connection = any
signature-provider = EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV=KEY:5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
p2p-max-nodes-per-host = 50
max-clients = 25
enable-stale-production = true
producer-name = eosio
EOF

read -d '' config_common << EOF
enable-stale-production = true
ibc-max-nodes-per-host = 50
ibc-max-clients = 0
p2p-peer-address = localhost:9976
plugin = eosio::chain_api_plugin
plugin = eosio::producer_plugin
EOF


read -d '' config00 << EOF
http-server-address = 127.0.0.1:8900
p2p-listen-endpoint = 0.0.0.0:9900
producer-name = producer211a
signature-provider = EOS7p8HMkhKw5Doncn7GMu9yRhGkHqxtXFMEaXCeJTGQ87DxztSdR=KEY:5JiifZVHiyUHtA51RReAh3fDzCQVQPtEku7y3aEUC4u6MUr83fx

plugin = eosio::ibc::ibc_plugin
ibc-contract = eos222333ibc
ibc-listen-endpoint = 0.0.0.0:6201
ibc-peer-address = 127.0.0.1:6101
ibc-peer-address = 127.0.0.1:6102
ibc-peer-address = 127.0.0.1:6103
ibc-sidechain-id = c10076f206b8fc25a6ed44dbdc66547c36c6c33e3a119ffbeaef943642f0e906
#ibc-peer-private-key = [EOS67ZiLNxJ4tozUeBsgXrMXRAx3BwEEZ1jmfMoG9tnjkiLAt5a1L,5K9s8mu3yXLfEDJQSVN1fYHPzyNBBvQ3MPgeRvK2jvG4KwjW3yu]
EOF

read -d '' config01 << EOF
http-server-address = 127.0.0.1:8901
p2p-listen-endpoint = 0.0.0.0:9901
producer-name = producer211b
signature-provider = EOS7bvJku6JZdbVxLfg9q7LEmqnyTexMTrYJteUoBCHDbF36Ux44s=KEY:5JYA6oj1HAw1xaT31ZR3m9Vzn7UQNaMdG9LRgNfEewrdVAR2z6C

plugin = eosio::ibc::ibc_plugin
ibc-contract = eos222333ibc
ibc-listen-endpoint = 0.0.0.0:6202
ibc-peer-address = 127.0.0.1:6101
ibc-peer-address = 127.0.0.1:6102
ibc-peer-address = 127.0.0.1:6103
ibc-sidechain-id = c10076f206b8fc25a6ed44dbdc66547c36c6c33e3a119ffbeaef943642f0e906
#ibc-peer-private-key = [EOS67ZiLNxJ4tozUeBsgXrMXRAx3BwEEZ1jmfMoG9tnjkiLAt5a1L,5K9s8mu3yXLfEDJQSVN1fYHPzyNBBvQ3MPgeRvK2jvG4KwjW3yu]
EOF

read -d '' config02 << EOF
http-server-address = 127.0.0.1:8902
p2p-listen-endpoint = 0.0.0.0:9902
producer-name = producer211c
signature-provider = EOS6dnV9KGX5zLa6EJS3fRFG1sBqvLCr45UkiJxxG3CxVRBRE2Hjd=KEY:5JL4zsc2CwHDkRCqYDCAVx7Ad7JtuhirbbPA61essr5iMyrjtnd

plugin = eosio::ibc::ibc_plugin
ibc-contract = eos222333ibc
ibc-listen-endpoint = 0.0.0.0:6203
ibc-peer-address = 127.0.0.1:6101
ibc-peer-address = 127.0.0.1:6102
ibc-peer-address = 127.0.0.1:6103
ibc-sidechain-id = c10076f206b8fc25a6ed44dbdc66547c36c6c33e3a119ffbeaef943642f0e906
#ibc-peer-private-key = [EOS67ZiLNxJ4tozUeBsgXrMXRAx3BwEEZ1jmfMoG9tnjkiLAt5a1L,5K9s8mu3yXLfEDJQSVN1fYHPzyNBBvQ3MPgeRvK2jvG4KwjW3yu]
EOF

read -d '' config03 << EOF
http-server-address = 127.0.0.1:8903
p2p-listen-endpoint = 0.0.0.0:9903
producer-name = producer211d
signature-provider = EOS7R6woULngUEGTSZiwU6bVTQ9S3QL7PNWUkHsHzQN4ZK8Sd5Z4S=KEY:5JFhRRFfL95DHEyaLieRz9LBENzrWq9iaK9r83oNfcFdcda7VmH
EOF

read -d '' config04 << EOF
http-server-address = 127.0.0.1:8904
p2p-listen-endpoint = 0.0.0.0:9904
producer-name = producer211e
signature-provider = EOS5jurQAScHY15Dar97ynuafyoYWnZZQwtrDihe72oHJFiEMT9qE=KEY:5KCiYR8Ms2PrXtJ8WF1tQqumFN5EVsaQijcy6SDCmxRWaV8BWgZ
EOF

read -d '' config05 << EOF
http-server-address = 127.0.0.1:8905
p2p-listen-endpoint = 0.0.0.0:9905
producer-name = producer211f
signature-provider = EOS5CcunRbAZHtwJz2DdPqFx7sMMhnZysChYvK5VXw63jXkkTyKx9=KEY:5KJty7z7m7GCv1u7GMr3ZNVAR9gvJcy2jDodsc5ZQKG7axqnR1m
EOF

read -d '' config06 << EOF
http-server-address = 127.0.0.1:8906
p2p-listen-endpoint = 0.0.0.0:9906
producer-name = producer211g
signature-provider = EOS8RtT5pitvw1ohGWEmd8PuUd2WU8r3s1wSayb3JqybEL8qGHVAN=KEY:5J3qSByuxmF82Neuwb737vVK4pLqGyoepMmSCvndBfYwBPpGCVW
EOF

read -d '' config07 << EOF
http-server-address = 127.0.0.1:8907
p2p-listen-endpoint = 0.0.0.0:9907
producer-name = producer211h
signature-provider = EOS7emRzu58rH3c5y9CC5R3yeYMtTZTyzNEmGUkENNr1hmp8CJQSP=KEY:5HwTsadDoXbtvXtqYxJfGSw6jE8xXYrP15xHnMib2QsWvPp8deG
EOF

read -d '' config08 << EOF
http-server-address = 127.0.0.1:8908
p2p-listen-endpoint = 0.0.0.0:9908
producer-name = producer211i
signature-provider = EOS5nEcaoGe6sSTR5XSkt825qMrGhYiZMyYqNnSW45yPC6adGxaBQ=KEY:5JzMW1J6fsfwxSdToJ9B9QDbMFFKWmWWURmUWcxGxfVzJ6pP2Fk
EOF

read -d '' config09 << EOF
http-server-address = 127.0.0.1:8909
p2p-listen-endpoint = 0.0.0.0:9909
producer-name = producer211j
signature-provider = EOS5TDZEjtqfiqiZdDikgQQjc2C3ZeFijyzpSFSLX1AmNGWbKAtpv=KEY:5JC9RHEFoQ3Zdj36FehduiK7DAxyVvWqRaXCZ3nNDUKVXUbDGJh
EOF

read -d '' config10 << EOF
http-server-address = 127.0.0.1:8910
p2p-listen-endpoint = 0.0.0.0:9910
producer-name = producer211k
signature-provider = EOS8Ab17X1unSfw32TizCTqJBmrUHZ5c8YvR6UuYURiKLFeuEySBP=KEY:5JQLTMiEFTvwzNor68c1eoAUHxKzLLSCik9fN1fEsekhKsjXMog
EOF

read -d '' config11 << EOF
http-server-address = 127.0.0.1:8911
p2p-listen-endpoint = 0.0.0.0:9911
producer-name = producer211l
signature-provider = EOS8hAoDAqQLXX7ch5nDJxLeoUiQ2hq2SumW6sLHKW2nwjmcb1iGE=KEY:5Hr5Am9NnKFhNa5G135xwbRzFg6N9tqkBxTecwt51Wu9F9r9nou
EOF
read -d '' config12 << EOF
http-server-address = 127.0.0.1:8912
p2p-listen-endpoint = 0.0.0.0:9912
producer-name = producer211m
signature-provider = EOS8B6qCUS2GxiuAY6cUprhaxrN7JkYsJMC4qfCRhC9TewasU7sHb=KEY:5Jz6WiYj7akvimGZpjfy7pM4h52fr4318ZDZEGeZqm2EYjV6Pxf
EOF
read -d '' config13 << EOF
http-server-address = 127.0.0.1:8913
p2p-listen-endpoint = 0.0.0.0:9913
producer-name = producer211n
signature-provider = EOS88P2JvJzYooCbNs3HriA6FUD5zxj1hPykG8T2i4fXtav3G8PS3=KEY:5HrBcHUXMrfa9LaY5BgnwVYRDacfhqaSReqQ99KvRTRYZ9v3DcB
EOF
read -d '' config14 << EOF
http-server-address = 127.0.0.1:8914
p2p-listen-endpoint = 0.0.0.0:9914
producer-name = producer211o
signature-provider = EOS788n77BLxcsM4sE5Mi42uKmBxC6ALVkyAoyPAmiAJm1bcH1hGR=KEY:5J8if85n9Uzxfp3MdHmLEEgDrN4jvUL164cLKJ6KqjcrdQ2YoTT
EOF
read -d '' config15 << EOF
http-server-address = 127.0.0.1:8915
p2p-listen-endpoint = 0.0.0.0:9915
producer-name = producer211p
signature-provider = EOS84g5TApfPqwLe8LTTDuypyhvi2Cf4ZpVvm4PHTxczMaL8LEVf5=KEY:5JVouLJMLLm3aNZqpYVjbHpbuTifc1b8gfkeWTmB5HFecLNmie1
EOF
read -d '' config16 << EOF
http-server-address = 127.0.0.1:8916
p2p-listen-endpoint = 0.0.0.0:9916
producer-name = producer211q
signature-provider = EOS6HEqdDp9T5To52idjw7cjzEYhRZ1CZxy5DnhNgFY9JH3naBhAc=KEY:5JtKVvxEkfR7pzYJxtnfaNLbwCuK34MrioMch5o2VfxYBd3Prbn
EOF
read -d '' config17 << EOF
http-server-address = 127.0.0.1:8917
p2p-listen-endpoint = 0.0.0.0:9917
producer-name = producer211r
signature-provider = EOS6g73HDDHaW7X8jAbBBiGjkRxdqmfruBY4ST9FKr6z2BxgUGauV=KEY:5KFFpvN3Sc4MCUpQWuiEdsGSCTvckVwCxEU985s9AZVA4gAdBUw
EOF
read -d '' config18 << EOF
http-server-address = 127.0.0.1:8918
p2p-listen-endpoint = 0.0.0.0:9918
producer-name = producer211s
signature-provider = EOS5f3DEYdmQ22cSFMrWKyHhLYKvHEpwppSEf4tKpQWzJx4CrJcKi=KEY:5J2a8k37qBhmZHmvuBqU6mxCtNtdnw3tzyGLpC6WxhV5VVDBzSF
EOF
read -d '' config19 << EOF
http-server-address = 127.0.0.1:8919
p2p-listen-endpoint = 0.0.0.0:9919
producer-name = producer211t
signature-provider = EOS63acPsuJy2Rn1MbXpGz78uuzfF6frj3jWeyykjkpuSBjy1HMtb=KEY:5KhWdLjQFibha1QaMjPZoFL2jyJJSP5HeBEdwDkbJBpFWBMYiUE
EOF
read -d '' config20 << EOF
http-server-address = 127.0.0.1:8920
p2p-listen-endpoint = 0.0.0.0:9920
producer-name = producer211u
signature-provider = EOS6JNYvKigRgQemwW6aTS2qZNHjEHsRsuLTo2TVA935TtcaPD6xU=KEY:5J237MB3QfkEczSR9Kthqe73sQdufi7ZXFcaQJwLXaXCAAG3z9m
EOF
read -d '' config21 << EOF
http-server-address = 127.0.0.1:8921
p2p-listen-endpoint = 0.0.0.0:9921
producer-name = producer211v
signature-provider = EOS78V2E4V4h3txkZ6fQvqXxYez7qzQMTqqdbxS33dBkPbD9kwHfR=KEY:5J4gjCRmFtezLMjR12EmTWLvTUVeTTDM4bi4L1osLTZQiShorMo
EOF
read -d '' config22 << EOF
http-server-address = 127.0.0.1:8922
p2p-listen-endpoint = 0.0.0.0:9922
producer-name = producer211w
signature-provider = EOS7G3KbYdANRcF64rTeyR8j39KaVQ4EGGPK189vHvQazoPF8zgQX=KEY:5HwEp79MKNz81nDDZz4zmFzgm7jBcH2nsCLv5ucLvcV3CMztgLn
EOF
read -d '' config23 << EOF
http-server-address = 127.0.0.1:8923
p2p-listen-endpoint = 0.0.0.0:9923
producer-name = producer211x
signature-provider = EOS7Ckx456UiQNrn9iGbLA4e37ZM7bxuoVtkEcxBza11UcSnL2SyY=KEY:5JnDiMJK3KThbPaDxan1FLmDCXFh6VXcwqdNH1oCVzDYF4mZqjb
EOF
read -d '' config24 << EOF
http-server-address = 127.0.0.1:8924
p2p-listen-endpoint = 0.0.0.0:9924
producer-name = producer211y
signature-provider = EOS7uKfBKEVTuXa2jWLjsrFpVdsfSeJ5cKvfNL5t9thMhFKLNmPNy=KEY:5JkESzQ7FF934VeJazRYjQrE9g6geVVpExEEvpwR7QmXtaHmAUT
EOF
read -d '' config25 << EOF
http-server-address = 127.0.0.1:8925
p2p-listen-endpoint = 0.0.0.0:9925
producer-name = producer211z
signature-provider = EOS5EDycPyDPvEg5VuFn1iBZdRpDhP81dkfPFaXj7RMGk7to945ne=KEY:5KXjyXjkrjJpPMWFRSRmsv5tUA9uB5KeSMPLXLUpNEMd2FvLGc8
EOF
read -d '' config26 << EOF
http-server-address = 127.0.0.1:8926
p2p-listen-endpoint = 0.0.0.0:9926
producer-name = producer212a
signature-provider = EOS6GSCJRSFPBG4nhXFxyE75FNBL18MpxzQc5gAGUjT8ipnfahGeS=KEY:5Ka1ihV29UWkjLUFmjqz85DAD81MZ9LLg8hQpNVNXfF9FA9ZFoM
EOF
read -d '' config27 << EOF
http-server-address = 127.0.0.1:8927
p2p-listen-endpoint = 0.0.0.0:9927
producer-name = producer212b
signature-provider = EOS817hVJSH2zGsTfXP9CynNRYqdntUQTPy5o82NpqzGCooYsx4jP=KEY:5JxowrZcMMJ4iZoJkTnhKt4pSvVQsLacY34AeY7oc6XZ1ZfK5Fi
EOF
read -d '' config28 << EOF
http-server-address = 127.0.0.1:8928
p2p-listen-endpoint = 0.0.0.0:9928
producer-name = producer212c
signature-provider = EOS8fdPxQhHUo1oBPiSjFLRxbKdUmV4gmAjsPHAxPDmHZHk2SgbHd=KEY:5J6u5bqfyfmKUeQvtoorkGPTKmJzfhkpc2Pj15mJvK8qc8aAvAg
EOF
read -d '' config29 << EOF
http-server-address = 127.0.0.1:8929
p2p-listen-endpoint = 0.0.0.0:9929
producer-name = producer212d
signature-provider = EOS5uHCMZbf5f5XxaYA4mNk1eL73VUovcNUWpno63aNLFMD6etqEG=KEY:5KHqh8qeWfbztaB4HJ31gCGATxcDp29ZVMzSpLBbWbA2DGhQPjf
EOF
read -d '' config30 << EOF
http-server-address = 127.0.0.1:8930
p2p-listen-endpoint = 0.0.0.0:9930
producer-name = producer212e
signature-provider = EOS6BeucfYVwJKyNMQC8EEs8PE2pbdGSfqyheV6kFqLt15TWn2xxs=KEY:5JAJ38sS2bqx6awVaPFDRXwW4TXUbV699ENbw8DBjnv5CHb2hmm
EOF
read -d '' config31 << EOF
http-server-address = 127.0.0.1:8931
p2p-listen-endpoint = 0.0.0.0:9931
producer-name = producer212f
signature-provider = EOS6gPndrJ8QX1VzctXCZhBFcP3e9vUuC5GRQesYhxboi52MzqkuG=KEY:5KLJLyHYK22nC7r5j7wN31ARYkA6ZtYAbGzv7RA8skoNw1NDgq7
EOF
read -d '' config32 << EOF
http-server-address = 127.0.0.1:8932
p2p-listen-endpoint = 0.0.0.0:9932
producer-name = producer212g
signature-provider = EOS6E7c8nRub318kgpKdrF8sLKGP3nWqLNH1anDvtVjSoaC9Z5KEf=KEY:5Kb28WjUZaM5HdZQ7n2pRQD5ZfavLGbVjNVZWpvUARcx1vwGnGZ
EOF
read -d '' config33 << EOF
http-server-address = 127.0.0.1:8933
p2p-listen-endpoint = 0.0.0.0:9933
producer-name = producer212h
signature-provider = EOS7zzB82wTCzKhgVLt9dggVsrZxcdMMHcExgQgMFTvBj5UFPg4nP=KEY:5JBSTB5g8wGhjqWSKWEDxqPoHuMpKYthP73Na7PUQf8LkeguHz8
EOF
read -d '' config34 << EOF
http-server-address = 127.0.0.1:8934
p2p-listen-endpoint = 0.0.0.0:9934
producer-name = producer212i
signature-provider = EOS6NY2p3D9Pb7qmY72SXcWssfCHYhZUzZXkNab52yaxrGZYPC8SS=KEY:5Jp2W2heeJjczSm7YgURFLRJTA4SfdPHgQAQAekiWYFKesubv5B
EOF
read -d '' config35 << EOF
http-server-address = 127.0.0.1:8935
p2p-listen-endpoint = 0.0.0.0:9935
producer-name = producer212j
signature-provider = EOS5x8WwLHi76hyjeAjKX7HTPuBRRGtF8NpSXHVyV2VzGagaTdabt=KEY:5HyVmMJrq4bKKqJginUyPVQ6HvPdgJYhyRe2m3jsCFPVnCCiE9e
EOF
read -d '' config36 << EOF
http-server-address = 127.0.0.1:8936
p2p-listen-endpoint = 0.0.0.0:9936
producer-name = producer212k
signature-provider = EOS5wkiVZu85oU3nZB1JtWoitgoMAy7xToZsZuosehjJHb6ATCXqq=KEY:5KKLqabW4oRmyKaVsRBrHQABJRr8kEitXSXdZn7uCJuUHExM5QK
EOF
read -d '' config37 << EOF
http-server-address = 127.0.0.1:8937
p2p-listen-endpoint = 0.0.0.0:9937
producer-name = producer212l
signature-provider = EOS58nMtaqAYRwMrXEauQhhQ3Awbdsvni6Yq8kzr4GAFwEBtS9g2d=KEY:5K7iwycEWaJ6cbMpcsSDBEWTAe7GrkjRomTRH76DmEKwRtj2YZG
EOF
read -d '' config38 << EOF
http-server-address = 127.0.0.1:8938
p2p-listen-endpoint = 0.0.0.0:9938
producer-name = producer212m
signature-provider = EOS89oyVbf2LfbNpfGiy6SHRkqhFdNG2QZREkCxNp72UC7YYHmiAJ=KEY:5KVZiDmUF3G2QFbt69ACLjCS4kKgx5hyR8Aad78QZVQUEvpnyeT
EOF
read -d '' config39 << EOF
http-server-address = 127.0.0.1:8939
p2p-listen-endpoint = 0.0.0.0:9939
producer-name = producer212n
signature-provider = EOS68W7VSEdnhku1YkUu7VXzj5KVhsjyh9QtidUqEmxF6t8Kbacyc=KEY:5KGBYfD4QNhXA81D4vGmM9yZ3fYYQEpeHseGS3q1TBbJqbN8Gpb
EOF
read -d '' config40 << EOF
http-server-address = 127.0.0.1:8940
p2p-listen-endpoint = 0.0.0.0:9940
producer-name = producer212o
signature-provider = EOS6ehCpDHq75YGgqGcuBYLgLPK4NqMGz6moNqcKoteAvR64Cdnqg=KEY:5JBoteqx8Qy4CtxCs9esS1JVrq2QEPbq4E1o5doKD5u3CyieHJW
EOF
read -d '' config41 << EOF
http-server-address = 127.0.0.1:8941
p2p-listen-endpoint = 0.0.0.0:9941
producer-name = producer212p
signature-provider = EOS7MwZArPm7ueyh1L8VMikRCGJxoLFPGWzeZofdiR1S2M7DLbzVH=KEY:5JwCzcAkzJozuDvU85LWWCu18StvEUd8TKcFa8axi846WENopYd
EOF
read -d '' config42 << EOF
http-server-address = 127.0.0.1:8942
p2p-listen-endpoint = 0.0.0.0:9942
producer-name = producer212q
signature-provider = EOS4uEU5tmy3cJEYGkyBpg3qTyfD7Gn7Du6MoFba3xX5MqsASGB8E=KEY:5K4LXUoNLjQSwSX8wsSsLEg9qAQuEtKZ6ydoSmUZBGLhTJQ8MKk
EOF
read -d '' config43 << EOF
http-server-address = 127.0.0.1:8943
p2p-listen-endpoint = 0.0.0.0:9943
producer-name = producer212r
signature-provider = EOS6QPsbpYCW73yYLonkcu5qZ68yc2LracPt1fxVwNyP1hbJzihEW=KEY:5Jx1ebwAx96r7Q4EKJNoRRX3h5iU4u6kGv2Aga14JzcwMEbmKUH
EOF
read -d '' config44 << EOF
http-server-address = 127.0.0.1:8944
p2p-listen-endpoint = 0.0.0.0:9944
producer-name = producer212s
signature-provider = EOS7A56aZnF61Fx4GEnd84iKnsddKmAzS4f95tTn8eatKgqZesAu6=KEY:5J6vdJWVeKHpe7S4qRjYxJNyK5Z7X2HwQhiDZkPpLn7XNBfvmnY
EOF
read -d '' config45 << EOF
http-server-address = 127.0.0.1:8945
p2p-listen-endpoint = 0.0.0.0:9945
producer-name = producer212t
signature-provider = EOS5yWrKB4Pj29NLxmxxvNdwafqu6FLmDmYcshFuGDhX6JEwwxWg5=KEY:5KL9qLkiqRBWSGBSx8z7m5xf9hb4UzDskcG3jNdYUGv3coePf3i
EOF
read -d '' config46 << EOF
http-server-address = 127.0.0.1:8946
p2p-listen-endpoint = 0.0.0.0:9946
producer-name = producer212u
signature-provider = EOS5aHSv2jsMVbGnh7qFAhSYFLdUcDrTmuPjP9zG7r5exa6bAzUXH=KEY:5J9UfCKZ3S8XyLAtEMcSnSggbrARP9TBifxJtRDMkEUh2gnHoJn
EOF
read -d '' config47 << EOF
http-server-address = 127.0.0.1:8947
p2p-listen-endpoint = 0.0.0.0:9947
producer-name = producer212v
signature-provider = EOS7vTUPbcTf7VxC7GmdYaRjgZXbXNc195cWvt6wqRMNMEe2dVRCn=KEY:5KWyehLUxrerzzAZ3vaXLLAzp7SZbTuegwUERQbAgvM6EfpjWqk
EOF
read -d '' config48 << EOF
http-server-address = 127.0.0.1:8948
p2p-listen-endpoint = 0.0.0.0:9948
producer-name = producer212w
signature-provider = EOS7qCe2tqqWSMnb5ibJXsPmV41s6UdjEhc5yDww6xU2ZcnkKTJSY=KEY:5KJgchqG28hMuYJpm8TXhfgMGfBjrFdznRYB1AAPs4ZEdeB9bkn
EOF
read -d '' config49 << EOF
http-server-address = 127.0.0.1:8949
p2p-listen-endpoint = 0.0.0.0:9949
producer-name = producer212x
signature-provider = EOS7u1MPDsS1ZjNjaS8A3qGMdVZpByvsT6uZNXD2k92V2Fme7eB3s=KEY:5J6yJMa6CqmFwFg3LrWHVqMsYxFph75Er5f2DmwZEAn3xfZqwwa
EOF
read -d '' config50 << EOF
http-server-address = 127.0.0.1:8950
p2p-listen-endpoint = 0.0.0.0:9950
producer-name = producer212y
signature-provider = EOS7MDSmN7UfnkZDAfJe3xuMGoeaaYjtUYZpPuaqdF8m9sAv4dVTE=KEY:5K8Ydw3KYCxZiTBwVTkgbuQTuyD5W4qndB7X9RoBMKhQ9ZnhMop
EOF
read -d '' config51 << EOF
http-server-address = 127.0.0.1:8951
p2p-listen-endpoint = 0.0.0.0:9951
producer-name = producer212z
signature-provider = EOS6Pb6yoVcUryVL7TWbisbdDVa64PmxEt33f1F32ghbiVn2ttPRw=KEY:5JhPyuPoDk8gN3uVpLVXRSRyCxnvrnoBoNq8jzeEVXmWY6D7hLw
EOF



#   生成上面配置的脚步
#
#	new_keys(){
#	    str=`cleos create key --to-console`
#	    pri_key=`echo $str | cut -d' ' -f 3`
#	    pub_key=`echo $str | cut -d' ' -f 6`
#	}
#
#    generate(){
#        for i in `seq 10 30`; do
#            new_keys
#            echo "read -d '' config${i} << EOF"
#            echo http-server-address = 127.0.0.1:89${i}
#            echo p2p-listen-endpoint = 0.0.0.0:99${i}
#            echo producer-name = producer211
#            echo signature-provider = $pub_key=KEY:$pri_key
#            echo EOF
#        done
#    }



read -d '' logging << EOF
{
  "includes": [],
  "appenders": [{
      "name": "stderr",
      "type": "console",
      "args": {
        "stream": "std_error",
        "level_colors": [{
            "level": "debug",
            "color": "green"
          },{
            "level": "warn",
            "color": "brown"
          },{
            "level": "error",
            "color": "red"
          }
        ]
      },
      "enabled": true
    },{
      "name": "stdout",
      "type": "console",
      "args": {
        "stream": "std_out",
        "level_colors": [{
            "level": "debug",
            "color": "green"
          },{
            "level": "warn",
            "color": "brown"
          },{
            "level": "error",
            "color": "red"
          }
        ]
      },
      "enabled": true
    }
  ],
  "loggers": [{
      "name": "default",
      "level": "debug",
      "enabled": true,
      "additivity": false,
      "appenders": [
        "stderr"
      ]
    },
    {
      "name": "ibc_plugin_impl",
      "level": "debug",
      "enabled": true,
      "additivity": false,
      "appenders": [
        "stderr"
      ]
    }
  ]
}
EOF
