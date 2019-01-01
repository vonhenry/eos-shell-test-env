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
p2p-server-address = localhost:9876
plugin = eosio::producer_plugin
plugin = eosio::chain_api_plugin
plugin = eosio::net_plugin
plugin = eosio::history_api_plugin
http-server-address = 127.0.0.1:8888
blocks-dir = blocks
p2p-listen-endpoint = 0.0.0.0:9876
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
p2p-peer-address = localhost:9876
plugin = eosio::chain_api_plugin
plugin = eosio::producer_plugin
EOF


read -d '' config00 << EOF
http-server-address = 127.0.0.1:8800
p2p-listen-endpoint = 0.0.0.0:9800
producer-name = producer111a
signature-provider = EOS7p8HMkhKw5Doncn7GMu9yRhGkHqxtXFMEaXCeJTGQ87DxztSdR=KEY:5JiifZVHiyUHtA51RReAh3fDzCQVQPtEku7y3aEUC4u6MUr83fx

plugin = eosio::ibc::ibc_plugin
ibc-contract = eos222333ibc
ibc-listen-endpoint = 0.0.0.0:6101
ibc-peer-address = 127.0.0.1:6201
ibc-peer-address = 127.0.0.1:6202
ibc-peer-address = 127.0.0.1:6203
ibc-sidechain-id = c20076f206b8fc25a6ed44dbdc66547c36c6c33e3a119ffbeaef943642f0e906
#ibc-peer-private-key = [EOS67ZiLNxJ4tozUeBsgXrMXRAx3BwEEZ1jmfMoG9tnjkiLAt5a1L,5K9s8mu3yXLfEDJQSVN1fYHPzyNBBvQ3MPgeRvK2jvG4KwjW3yu]
EOF

read -d '' config01 << EOF
http-server-address = 127.0.0.1:8801
p2p-listen-endpoint = 0.0.0.0:9801
producer-name = producer111b
signature-provider = EOS7bvJku6JZdbVxLfg9q7LEmqnyTexMTrYJteUoBCHDbF36Ux44s=KEY:5JYA6oj1HAw1xaT31ZR3m9Vzn7UQNaMdG9LRgNfEewrdVAR2z6C

plugin = eosio::ibc::ibc_plugin
ibc-contract = eos222333ibc
ibc-listen-endpoint = 0.0.0.0:6102
ibc-peer-address = 127.0.0.1:6201
ibc-peer-address = 127.0.0.1:6202
ibc-peer-address = 127.0.0.1:6203
ibc-sidechain-id = c20076f206b8fc25a6ed44dbdc66547c36c6c33e3a119ffbeaef943642f0e906
#ibc-peer-private-key = [EOS67ZiLNxJ4tozUeBsgXrMXRAx3BwEEZ1jmfMoG9tnjkiLAt5a1L,5K9s8mu3yXLfEDJQSVN1fYHPzyNBBvQ3MPgeRvK2jvG4KwjW3yu]
EOF

read -d '' config02 << EOF
http-server-address = 127.0.0.1:8802
p2p-listen-endpoint = 0.0.0.0:9802
producer-name = producer111c
signature-provider = EOS6dnV9KGX5zLa6EJS3fRFG1sBqvLCr45UkiJxxG3CxVRBRE2Hjd=KEY:5JL4zsc2CwHDkRCqYDCAVx7Ad7JtuhirbbPA61essr5iMyrjtnd

plugin = eosio::ibc::ibc_plugin
ibc-contract = eos222333ibc
ibc-listen-endpoint = 0.0.0.0:6103
ibc-peer-address = 127.0.0.1:6201
ibc-peer-address = 127.0.0.1:6202
ibc-peer-address = 127.0.0.1:6203
ibc-sidechain-id = c20076f206b8fc25a6ed44dbdc66547c36c6c33e3a119ffbeaef943642f0e906
#ibc-peer-private-key = [EOS67ZiLNxJ4tozUeBsgXrMXRAx3BwEEZ1jmfMoG9tnjkiLAt5a1L,5K9s8mu3yXLfEDJQSVN1fYHPzyNBBvQ3MPgeRvK2jvG4KwjW3yu]
EOF

read -d '' config03 << EOF
http-server-address = 127.0.0.1:8803
p2p-listen-endpoint = 0.0.0.0:9803
producer-name = producer111d
signature-provider = EOS7R6woULngUEGTSZiwU6bVTQ9S3QL7PNWUkHsHzQN4ZK8Sd5Z4S=KEY:5JFhRRFfL95DHEyaLieRz9LBENzrWq9iaK9r83oNfcFdcda7VmH
EOF

read -d '' config04 << EOF
http-server-address = 127.0.0.1:8804
p2p-listen-endpoint = 0.0.0.0:9804
producer-name = producer111e
signature-provider = EOS5jurQAScHY15Dar97ynuafyoYWnZZQwtrDihe72oHJFiEMT9qE=KEY:5KCiYR8Ms2PrXtJ8WF1tQqumFN5EVsaQijcy6SDCmxRWaV8BWgZ
EOF

read -d '' config05 << EOF
http-server-address = 127.0.0.1:8805
p2p-listen-endpoint = 0.0.0.0:9805
producer-name = producer111f
signature-provider = EOS5CcunRbAZHtwJz2DdPqFx7sMMhnZysChYvK5VXw63jXkkTyKx9=KEY:5KJty7z7m7GCv1u7GMr3ZNVAR9gvJcy2jDodsc5ZQKG7axqnR1m
EOF

read -d '' config06 << EOF
http-server-address = 127.0.0.1:8806
p2p-listen-endpoint = 0.0.0.0:9806
producer-name = producer111g
signature-provider = EOS8RtT5pitvw1ohGWEmd8PuUd2WU8r3s1wSayb3JqybEL8qGHVAN=KEY:5J3qSByuxmF82Neuwb737vVK4pLqGyoepMmSCvndBfYwBPpGCVW
EOF

read -d '' config07 << EOF
http-server-address = 127.0.0.1:8807
p2p-listen-endpoint = 0.0.0.0:9807
producer-name = producer111h
signature-provider = EOS7emRzu58rH3c5y9CC5R3yeYMtTZTyzNEmGUkENNr1hmp8CJQSP=KEY:5HwTsadDoXbtvXtqYxJfGSw6jE8xXYrP15xHnMib2QsWvPp8deG
EOF

read -d '' config08 << EOF
http-server-address = 127.0.0.1:8808
p2p-listen-endpoint = 0.0.0.0:9808
producer-name = producer111i
signature-provider = EOS5nEcaoGe6sSTR5XSkt825qMrGhYiZMyYqNnSW45yPC6adGxaBQ=KEY:5JzMW1J6fsfwxSdToJ9B9QDbMFFKWmWWURmUWcxGxfVzJ6pP2Fk
EOF

read -d '' config09 << EOF
http-server-address = 127.0.0.1:8809
p2p-listen-endpoint = 0.0.0.0:9809
producer-name = producer111j
signature-provider = EOS5TDZEjtqfiqiZdDikgQQjc2C3ZeFijyzpSFSLX1AmNGWbKAtpv=KEY:5JC9RHEFoQ3Zdj36FehduiK7DAxyVvWqRaXCZ3nNDUKVXUbDGJh
EOF

read -d '' config10 << EOF
http-server-address = 127.0.0.1:8810
p2p-listen-endpoint = 0.0.0.0:9810
producer-name = producer111k
signature-provider = EOS8Ab17X1unSfw32TizCTqJBmrUHZ5c8YvR6UuYURiKLFeuEySBP=KEY:5JQLTMiEFTvwzNor68c1eoAUHxKzLLSCik9fN1fEsekhKsjXMog
EOF

read -d '' config11 << EOF
http-server-address = 127.0.0.1:8811
p2p-listen-endpoint = 0.0.0.0:9811
producer-name = producer111l
signature-provider = EOS8hAoDAqQLXX7ch5nDJxLeoUiQ2hq2SumW6sLHKW2nwjmcb1iGE=KEY:5Hr5Am9NnKFhNa5G135xwbRzFg6N9tqkBxTecwt51Wu9F9r9nou
EOF
read -d '' config12 << EOF
http-server-address = 127.0.0.1:8812
p2p-listen-endpoint = 0.0.0.0:9812
producer-name = producer111m
signature-provider = EOS8B6qCUS2GxiuAY6cUprhaxrN7JkYsJMC4qfCRhC9TewasU7sHb=KEY:5Jz6WiYj7akvimGZpjfy7pM4h52fr4318ZDZEGeZqm2EYjV6Pxf
EOF
read -d '' config13 << EOF
http-server-address = 127.0.0.1:8813
p2p-listen-endpoint = 0.0.0.0:9813
producer-name = producer111n
signature-provider = EOS88P2JvJzYooCbNs3HriA6FUD5zxj1hPykG8T2i4fXtav3G8PS3=KEY:5HrBcHUXMrfa9LaY5BgnwVYRDacfhqaSReqQ99KvRTRYZ9v3DcB
EOF
read -d '' config14 << EOF
http-server-address = 127.0.0.1:8814
p2p-listen-endpoint = 0.0.0.0:9814
producer-name = producer111o
signature-provider = EOS788n77BLxcsM4sE5Mi42uKmBxC6ALVkyAoyPAmiAJm1bcH1hGR=KEY:5J8if85n9Uzxfp3MdHmLEEgDrN4jvUL164cLKJ6KqjcrdQ2YoTT
EOF
read -d '' config15 << EOF
http-server-address = 127.0.0.1:8815
p2p-listen-endpoint = 0.0.0.0:9815
producer-name = producer111p
signature-provider = EOS84g5TApfPqwLe8LTTDuypyhvi2Cf4ZpVvm4PHTxczMaL8LEVf5=KEY:5JVouLJMLLm3aNZqpYVjbHpbuTifc1b8gfkeWTmB5HFecLNmie1
EOF
read -d '' config16 << EOF
http-server-address = 127.0.0.1:8816
p2p-listen-endpoint = 0.0.0.0:9816
producer-name = producer111q
signature-provider = EOS6HEqdDp9T5To52idjw7cjzEYhRZ1CZxy5DnhNgFY9JH3naBhAc=KEY:5JtKVvxEkfR7pzYJxtnfaNLbwCuK34MrioMch5o2VfxYBd3Prbn
EOF
read -d '' config17 << EOF
http-server-address = 127.0.0.1:8817
p2p-listen-endpoint = 0.0.0.0:9817
producer-name = producer111r
signature-provider = EOS6g73HDDHaW7X8jAbBBiGjkRxdqmfruBY4ST9FKr6z2BxgUGauV=KEY:5KFFpvN3Sc4MCUpQWuiEdsGSCTvckVwCxEU985s9AZVA4gAdBUw
EOF
read -d '' config18 << EOF
http-server-address = 127.0.0.1:8818
p2p-listen-endpoint = 0.0.0.0:9818
producer-name = producer111s
signature-provider = EOS5f3DEYdmQ22cSFMrWKyHhLYKvHEpwppSEf4tKpQWzJx4CrJcKi=KEY:5J2a8k37qBhmZHmvuBqU6mxCtNtdnw3tzyGLpC6WxhV5VVDBzSF
EOF
read -d '' config19 << EOF
http-server-address = 127.0.0.1:8819
p2p-listen-endpoint = 0.0.0.0:9819
producer-name = producer111t
signature-provider = EOS63acPsuJy2Rn1MbXpGz78uuzfF6frj3jWeyykjkpuSBjy1HMtb=KEY:5KhWdLjQFibha1QaMjPZoFL2jyJJSP5HeBEdwDkbJBpFWBMYiUE
EOF
read -d '' config20 << EOF
http-server-address = 127.0.0.1:8820
p2p-listen-endpoint = 0.0.0.0:9820
producer-name = producer111u
signature-provider = EOS6JNYvKigRgQemwW6aTS2qZNHjEHsRsuLTo2TVA935TtcaPD6xU=KEY:5J237MB3QfkEczSR9Kthqe73sQdufi7ZXFcaQJwLXaXCAAG3z9m
EOF
read -d '' config21 << EOF
http-server-address = 127.0.0.1:8821
p2p-listen-endpoint = 0.0.0.0:9821
producer-name = producer111v
signature-provider = EOS78V2E4V4h3txkZ6fQvqXxYez7qzQMTqqdbxS33dBkPbD9kwHfR=KEY:5J4gjCRmFtezLMjR12EmTWLvTUVeTTDM4bi4L1osLTZQiShorMo
EOF
read -d '' config22 << EOF
http-server-address = 127.0.0.1:8822
p2p-listen-endpoint = 0.0.0.0:9822
producer-name = producer111w
signature-provider = EOS7G3KbYdANRcF64rTeyR8j39KaVQ4EGGPK189vHvQazoPF8zgQX=KEY:5HwEp79MKNz81nDDZz4zmFzgm7jBcH2nsCLv5ucLvcV3CMztgLn
EOF
read -d '' config23 << EOF
http-server-address = 127.0.0.1:8823
p2p-listen-endpoint = 0.0.0.0:9823
producer-name = producer111x
signature-provider = EOS7Ckx456UiQNrn9iGbLA4e37ZM7bxuoVtkEcxBza11UcSnL2SyY=KEY:5JnDiMJK3KThbPaDxan1FLmDCXFh6VXcwqdNH1oCVzDYF4mZqjb
EOF
read -d '' config24 << EOF
http-server-address = 127.0.0.1:8824
p2p-listen-endpoint = 0.0.0.0:9824
producer-name = producer111y
signature-provider = EOS7uKfBKEVTuXa2jWLjsrFpVdsfSeJ5cKvfNL5t9thMhFKLNmPNy=KEY:5JkESzQ7FF934VeJazRYjQrE9g6geVVpExEEvpwR7QmXtaHmAUT
EOF
read -d '' config25 << EOF
http-server-address = 127.0.0.1:8825
p2p-listen-endpoint = 0.0.0.0:9825
producer-name = producer111z
signature-provider = EOS5EDycPyDPvEg5VuFn1iBZdRpDhP81dkfPFaXj7RMGk7to945ne=KEY:5KXjyXjkrjJpPMWFRSRmsv5tUA9uB5KeSMPLXLUpNEMd2FvLGc8
EOF
read -d '' config26 << EOF
http-server-address = 127.0.0.1:8826
p2p-listen-endpoint = 0.0.0.0:9826
producer-name = producer112a
signature-provider = EOS6GSCJRSFPBG4nhXFxyE75FNBL18MpxzQc5gAGUjT8ipnfahGeS=KEY:5Ka1ihV29UWkjLUFmjqz85DAD81MZ9LLg8hQpNVNXfF9FA9ZFoM
EOF
read -d '' config27 << EOF
http-server-address = 127.0.0.1:8827
p2p-listen-endpoint = 0.0.0.0:9827
producer-name = producer112b
signature-provider = EOS817hVJSH2zGsTfXP9CynNRYqdntUQTPy5o82NpqzGCooYsx4jP=KEY:5JxowrZcMMJ4iZoJkTnhKt4pSvVQsLacY34AeY7oc6XZ1ZfK5Fi
EOF
read -d '' config28 << EOF
http-server-address = 127.0.0.1:8828
p2p-listen-endpoint = 0.0.0.0:9828
producer-name = producer112c
signature-provider = EOS8fdPxQhHUo1oBPiSjFLRxbKdUmV4gmAjsPHAxPDmHZHk2SgbHd=KEY:5J6u5bqfyfmKUeQvtoorkGPTKmJzfhkpc2Pj15mJvK8qc8aAvAg
EOF
read -d '' config29 << EOF
http-server-address = 127.0.0.1:8829
p2p-listen-endpoint = 0.0.0.0:9829
producer-name = producer112d
signature-provider = EOS5uHCMZbf5f5XxaYA4mNk1eL73VUovcNUWpno63aNLFMD6etqEG=KEY:5KHqh8qeWfbztaB4HJ31gCGATxcDp29ZVMzSpLBbWbA2DGhQPjf
EOF
read -d '' config30 << EOF
http-server-address = 127.0.0.1:8830
p2p-listen-endpoint = 0.0.0.0:9830
producer-name = producer112e
signature-provider = EOS6BeucfYVwJKyNMQC8EEs8PE2pbdGSfqyheV6kFqLt15TWn2xxs=KEY:5JAJ38sS2bqx6awVaPFDRXwW4TXUbV699ENbw8DBjnv5CHb2hmm
EOF
read -d '' config31 << EOF
http-server-address = 127.0.0.1:8831
p2p-listen-endpoint = 0.0.0.0:9831
producer-name = producer112f
signature-provider = EOS6gPndrJ8QX1VzctXCZhBFcP3e9vUuC5GRQesYhxboi52MzqkuG=KEY:5KLJLyHYK22nC7r5j7wN31ARYkA6ZtYAbGzv7RA8skoNw1NDgq7
EOF
read -d '' config32 << EOF
http-server-address = 127.0.0.1:8832
p2p-listen-endpoint = 0.0.0.0:9832
producer-name = producer112g
signature-provider = EOS6E7c8nRub318kgpKdrF8sLKGP3nWqLNH1anDvtVjSoaC9Z5KEf=KEY:5Kb28WjUZaM5HdZQ7n2pRQD5ZfavLGbVjNVZWpvUARcx1vwGnGZ
EOF
read -d '' config33 << EOF
http-server-address = 127.0.0.1:8833
p2p-listen-endpoint = 0.0.0.0:9833
producer-name = producer112h
signature-provider = EOS7zzB82wTCzKhgVLt9dggVsrZxcdMMHcExgQgMFTvBj5UFPg4nP=KEY:5JBSTB5g8wGhjqWSKWEDxqPoHuMpKYthP73Na7PUQf8LkeguHz8
EOF
read -d '' config34 << EOF
http-server-address = 127.0.0.1:8834
p2p-listen-endpoint = 0.0.0.0:9834
producer-name = producer112i
signature-provider = EOS6NY2p3D9Pb7qmY72SXcWssfCHYhZUzZXkNab52yaxrGZYPC8SS=KEY:5Jp2W2heeJjczSm7YgURFLRJTA4SfdPHgQAQAekiWYFKesubv5B
EOF
read -d '' config35 << EOF
http-server-address = 127.0.0.1:8835
p2p-listen-endpoint = 0.0.0.0:9835
producer-name = producer112j
signature-provider = EOS5x8WwLHi76hyjeAjKX7HTPuBRRGtF8NpSXHVyV2VzGagaTdabt=KEY:5HyVmMJrq4bKKqJginUyPVQ6HvPdgJYhyRe2m3jsCFPVnCCiE9e
EOF
read -d '' config36 << EOF
http-server-address = 127.0.0.1:8836
p2p-listen-endpoint = 0.0.0.0:9836
producer-name = producer112k
signature-provider = EOS5wkiVZu85oU3nZB1JtWoitgoMAy7xToZsZuosehjJHb6ATCXqq=KEY:5KKLqabW4oRmyKaVsRBrHQABJRr8kEitXSXdZn7uCJuUHExM5QK
EOF
read -d '' config37 << EOF
http-server-address = 127.0.0.1:8837
p2p-listen-endpoint = 0.0.0.0:9837
producer-name = producer112l
signature-provider = EOS58nMtaqAYRwMrXEauQhhQ3Awbdsvni6Yq8kzr4GAFwEBtS9g2d=KEY:5K7iwycEWaJ6cbMpcsSDBEWTAe7GrkjRomTRH76DmEKwRtj2YZG
EOF
read -d '' config38 << EOF
http-server-address = 127.0.0.1:8838
p2p-listen-endpoint = 0.0.0.0:9838
producer-name = producer112m
signature-provider = EOS89oyVbf2LfbNpfGiy6SHRkqhFdNG2QZREkCxNp72UC7YYHmiAJ=KEY:5KVZiDmUF3G2QFbt69ACLjCS4kKgx5hyR8Aad78QZVQUEvpnyeT
EOF
read -d '' config39 << EOF
http-server-address = 127.0.0.1:8839
p2p-listen-endpoint = 0.0.0.0:9839
producer-name = producer112n
signature-provider = EOS68W7VSEdnhku1YkUu7VXzj5KVhsjyh9QtidUqEmxF6t8Kbacyc=KEY:5KGBYfD4QNhXA81D4vGmM9yZ3fYYQEpeHseGS3q1TBbJqbN8Gpb
EOF
read -d '' config40 << EOF
http-server-address = 127.0.0.1:8840
p2p-listen-endpoint = 0.0.0.0:9840
producer-name = producer112o
signature-provider = EOS6ehCpDHq75YGgqGcuBYLgLPK4NqMGz6moNqcKoteAvR64Cdnqg=KEY:5JBoteqx8Qy4CtxCs9esS1JVrq2QEPbq4E1o5doKD5u3CyieHJW
EOF
read -d '' config41 << EOF
http-server-address = 127.0.0.1:8841
p2p-listen-endpoint = 0.0.0.0:9841
producer-name = producer112p
signature-provider = EOS7MwZArPm7ueyh1L8VMikRCGJxoLFPGWzeZofdiR1S2M7DLbzVH=KEY:5JwCzcAkzJozuDvU85LWWCu18StvEUd8TKcFa8axi846WENopYd
EOF
read -d '' config42 << EOF
http-server-address = 127.0.0.1:8842
p2p-listen-endpoint = 0.0.0.0:9842
producer-name = producer112q
signature-provider = EOS4uEU5tmy3cJEYGkyBpg3qTyfD7Gn7Du6MoFba3xX5MqsASGB8E=KEY:5K4LXUoNLjQSwSX8wsSsLEg9qAQuEtKZ6ydoSmUZBGLhTJQ8MKk
EOF
read -d '' config43 << EOF
http-server-address = 127.0.0.1:8843
p2p-listen-endpoint = 0.0.0.0:9843
producer-name = producer112r
signature-provider = EOS6QPsbpYCW73yYLonkcu5qZ68yc2LracPt1fxVwNyP1hbJzihEW=KEY:5Jx1ebwAx96r7Q4EKJNoRRX3h5iU4u6kGv2Aga14JzcwMEbmKUH
EOF
read -d '' config44 << EOF
http-server-address = 127.0.0.1:8844
p2p-listen-endpoint = 0.0.0.0:9844
producer-name = producer112s
signature-provider = EOS7A56aZnF61Fx4GEnd84iKnsddKmAzS4f95tTn8eatKgqZesAu6=KEY:5J6vdJWVeKHpe7S4qRjYxJNyK5Z7X2HwQhiDZkPpLn7XNBfvmnY
EOF
read -d '' config45 << EOF
http-server-address = 127.0.0.1:8845
p2p-listen-endpoint = 0.0.0.0:9845
producer-name = producer112t
signature-provider = EOS5yWrKB4Pj29NLxmxxvNdwafqu6FLmDmYcshFuGDhX6JEwwxWg5=KEY:5KL9qLkiqRBWSGBSx8z7m5xf9hb4UzDskcG3jNdYUGv3coePf3i
EOF
read -d '' config46 << EOF
http-server-address = 127.0.0.1:8846
p2p-listen-endpoint = 0.0.0.0:9846
producer-name = producer112u
signature-provider = EOS5aHSv2jsMVbGnh7qFAhSYFLdUcDrTmuPjP9zG7r5exa6bAzUXH=KEY:5J9UfCKZ3S8XyLAtEMcSnSggbrARP9TBifxJtRDMkEUh2gnHoJn
EOF
read -d '' config47 << EOF
http-server-address = 127.0.0.1:8847
p2p-listen-endpoint = 0.0.0.0:9847
producer-name = producer112v
signature-provider = EOS7vTUPbcTf7VxC7GmdYaRjgZXbXNc195cWvt6wqRMNMEe2dVRCn=KEY:5KWyehLUxrerzzAZ3vaXLLAzp7SZbTuegwUERQbAgvM6EfpjWqk
EOF
read -d '' config48 << EOF
http-server-address = 127.0.0.1:8848
p2p-listen-endpoint = 0.0.0.0:9848
producer-name = producer112w
signature-provider = EOS7qCe2tqqWSMnb5ibJXsPmV41s6UdjEhc5yDww6xU2ZcnkKTJSY=KEY:5KJgchqG28hMuYJpm8TXhfgMGfBjrFdznRYB1AAPs4ZEdeB9bkn
EOF
read -d '' config49 << EOF
http-server-address = 127.0.0.1:8849
p2p-listen-endpoint = 0.0.0.0:9849
producer-name = producer112x
signature-provider = EOS7u1MPDsS1ZjNjaS8A3qGMdVZpByvsT6uZNXD2k92V2Fme7eB3s=KEY:5J6yJMa6CqmFwFg3LrWHVqMsYxFph75Er5f2DmwZEAn3xfZqwwa
EOF
read -d '' config50 << EOF
http-server-address = 127.0.0.1:8850
p2p-listen-endpoint = 0.0.0.0:9850
producer-name = producer112y
signature-provider = EOS7MDSmN7UfnkZDAfJe3xuMGoeaaYjtUYZpPuaqdF8m9sAv4dVTE=KEY:5K8Ydw3KYCxZiTBwVTkgbuQTuyD5W4qndB7X9RoBMKhQ9ZnhMop
EOF
read -d '' config51 << EOF
http-server-address = 127.0.0.1:8851
p2p-listen-endpoint = 0.0.0.0:9851
producer-name = producer112z
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
#            echo http-server-address = 127.0.0.1:88${i}
#            echo p2p-listen-endpoint = 0.0.0.0:98${i}
#            echo producer-name = producer111
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
