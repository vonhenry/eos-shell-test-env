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
private-key = ['EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV','5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3']
p2p-max-nodes-per-host = 50
max-clients = 25
enable-stale-production = true
producer-name = eosio
EOF

read -d '' config_common << EOF
enable-stale-production = true
p2p-peer-address = localhost:9876
plugin = eosio::chain_api_plugin
plugin = eosio::producer_plugin
EOF


read -d '' config00 << EOF
http-server-address = 127.0.0.1:8800
p2p-listen-endpoint = 0.0.0.0:9800
producer-name = producer111a
private-key = ['EOS7p8HMkhKw5Doncn7GMu9yRhGkHqxtXFMEaXCeJTGQ87DxztSdR','5JiifZVHiyUHtA51RReAh3fDzCQVQPtEku7y3aEUC4u6MUr83fx']
EOF

read -d '' config01 << EOF
http-server-address = 127.0.0.1:8801
p2p-listen-endpoint = 0.0.0.0:9801
producer-name = producer111b
private-key = ['EOS7bvJku6JZdbVxLfg9q7LEmqnyTexMTrYJteUoBCHDbF36Ux44s','5JYA6oj1HAw1xaT31ZR3m9Vzn7UQNaMdG9LRgNfEewrdVAR2z6C']
EOF

read -d '' config02 << EOF
http-server-address = 127.0.0.1:8802
p2p-listen-endpoint = 0.0.0.0:9802
producer-name = producer111c
private-key = ['EOS6dnV9KGX5zLa6EJS3fRFG1sBqvLCr45UkiJxxG3CxVRBRE2Hjd','5JL4zsc2CwHDkRCqYDCAVx7Ad7JtuhirbbPA61essr5iMyrjtnd']
EOF

read -d '' config03 << EOF
http-server-address = 127.0.0.1:8803
p2p-listen-endpoint = 0.0.0.0:9803
producer-name = producer111d
private-key = ['EOS7R6woULngUEGTSZiwU6bVTQ9S3QL7PNWUkHsHzQN4ZK8Sd5Z4S','5JFhRRFfL95DHEyaLieRz9LBENzrWq9iaK9r83oNfcFdcda7VmH']
EOF

read -d '' config04 << EOF
http-server-address = 127.0.0.1:8804
p2p-listen-endpoint = 0.0.0.0:9804
producer-name = producer111e
private-key = ['EOS5jurQAScHY15Dar97ynuafyoYWnZZQwtrDihe72oHJFiEMT9qE','5KCiYR8Ms2PrXtJ8WF1tQqumFN5EVsaQijcy6SDCmxRWaV8BWgZ']
EOF

read -d '' config05 << EOF
http-server-address = 127.0.0.1:8805
p2p-listen-endpoint = 0.0.0.0:9805
producer-name = producer111f
private-key = ['EOS5CcunRbAZHtwJz2DdPqFx7sMMhnZysChYvK5VXw63jXkkTyKx9','5KJty7z7m7GCv1u7GMr3ZNVAR9gvJcy2jDodsc5ZQKG7axqnR1m']
EOF

read -d '' config06 << EOF
http-server-address = 127.0.0.1:8806
p2p-listen-endpoint = 0.0.0.0:9806
producer-name = producer111g
private-key = ['EOS8RtT5pitvw1ohGWEmd8PuUd2WU8r3s1wSayb3JqybEL8qGHVAN','5J3qSByuxmF82Neuwb737vVK4pLqGyoepMmSCvndBfYwBPpGCVW']
EOF

read -d '' config07 << EOF
http-server-address = 127.0.0.1:8807
p2p-listen-endpoint = 0.0.0.0:9807
producer-name = producer111h
private-key = ['EOS7emRzu58rH3c5y9CC5R3yeYMtTZTyzNEmGUkENNr1hmp8CJQSP','5HwTsadDoXbtvXtqYxJfGSw6jE8xXYrP15xHnMib2QsWvPp8deG']
EOF

read -d '' config08 << EOF
http-server-address = 127.0.0.1:8808
p2p-listen-endpoint = 0.0.0.0:9808
producer-name = producer111i
private-key = ['EOS5nEcaoGe6sSTR5XSkt825qMrGhYiZMyYqNnSW45yPC6adGxaBQ','5JzMW1J6fsfwxSdToJ9B9QDbMFFKWmWWURmUWcxGxfVzJ6pP2Fk']
EOF

read -d '' config09 << EOF
http-server-address = 127.0.0.1:8809
p2p-listen-endpoint = 0.0.0.0:9809
producer-name = producer111j
private-key = ['EOS5TDZEjtqfiqiZdDikgQQjc2C3ZeFijyzpSFSLX1AmNGWbKAtpv','5JC9RHEFoQ3Zdj36FehduiK7DAxyVvWqRaXCZ3nNDUKVXUbDGJh']
EOF

read -d '' config10 << EOF
http-server-address = 127.0.0.1:8810
p2p-listen-endpoint = 0.0.0.0:9810
producer-name = producer111k
private-key = ['EOS8Ab17X1unSfw32TizCTqJBmrUHZ5c8YvR6UuYURiKLFeuEySBP','5JQLTMiEFTvwzNor68c1eoAUHxKzLLSCik9fN1fEsekhKsjXMog']
EOF

read -d '' config11 << EOF
http-server-address = 127.0.0.1:8811
p2p-listen-endpoint = 0.0.0.0:9811
producer-name = producer111l
private-key = ['EOS8hAoDAqQLXX7ch5nDJxLeoUiQ2hq2SumW6sLHKW2nwjmcb1iGE','5Hr5Am9NnKFhNa5G135xwbRzFg6N9tqkBxTecwt51Wu9F9r9nou']
EOF
read -d '' config12 << EOF
http-server-address = 127.0.0.1:8812
p2p-listen-endpoint = 0.0.0.0:9812
producer-name = producer111m
private-key = ['EOS8B6qCUS2GxiuAY6cUprhaxrN7JkYsJMC4qfCRhC9TewasU7sHb','5Jz6WiYj7akvimGZpjfy7pM4h52fr4318ZDZEGeZqm2EYjV6Pxf']
EOF
read -d '' config13 << EOF
http-server-address = 127.0.0.1:8813
p2p-listen-endpoint = 0.0.0.0:9813
producer-name = producer111n
private-key = ['EOS88P2JvJzYooCbNs3HriA6FUD5zxj1hPykG8T2i4fXtav3G8PS3','5HrBcHUXMrfa9LaY5BgnwVYRDacfhqaSReqQ99KvRTRYZ9v3DcB']
EOF
read -d '' config14 << EOF
http-server-address = 127.0.0.1:8814
p2p-listen-endpoint = 0.0.0.0:9814
producer-name = producer111o
private-key = ['EOS788n77BLxcsM4sE5Mi42uKmBxC6ALVkyAoyPAmiAJm1bcH1hGR','5J8if85n9Uzxfp3MdHmLEEgDrN4jvUL164cLKJ6KqjcrdQ2YoTT']
EOF
read -d '' config15 << EOF
http-server-address = 127.0.0.1:8815
p2p-listen-endpoint = 0.0.0.0:9815
producer-name = producer111p
private-key = ['EOS84g5TApfPqwLe8LTTDuypyhvi2Cf4ZpVvm4PHTxczMaL8LEVf5','5JVouLJMLLm3aNZqpYVjbHpbuTifc1b8gfkeWTmB5HFecLNmie1']
EOF
read -d '' config16 << EOF
http-server-address = 127.0.0.1:8816
p2p-listen-endpoint = 0.0.0.0:9816
producer-name = producer111q
private-key = ['EOS6HEqdDp9T5To52idjw7cjzEYhRZ1CZxy5DnhNgFY9JH3naBhAc','5JtKVvxEkfR7pzYJxtnfaNLbwCuK34MrioMch5o2VfxYBd3Prbn']
EOF
read -d '' config17 << EOF
http-server-address = 127.0.0.1:8817
p2p-listen-endpoint = 0.0.0.0:9817
producer-name = producer111r
private-key = ['EOS6g73HDDHaW7X8jAbBBiGjkRxdqmfruBY4ST9FKr6z2BxgUGauV','5KFFpvN3Sc4MCUpQWuiEdsGSCTvckVwCxEU985s9AZVA4gAdBUw']
EOF
read -d '' config18 << EOF
http-server-address = 127.0.0.1:8818
p2p-listen-endpoint = 0.0.0.0:9818
producer-name = producer111s
private-key = ['EOS5f3DEYdmQ22cSFMrWKyHhLYKvHEpwppSEf4tKpQWzJx4CrJcKi','5J2a8k37qBhmZHmvuBqU6mxCtNtdnw3tzyGLpC6WxhV5VVDBzSF']
EOF
read -d '' config19 << EOF
http-server-address = 127.0.0.1:8819
p2p-listen-endpoint = 0.0.0.0:9819
producer-name = producer111t
private-key = ['EOS63acPsuJy2Rn1MbXpGz78uuzfF6frj3jWeyykjkpuSBjy1HMtb','5KhWdLjQFibha1QaMjPZoFL2jyJJSP5HeBEdwDkbJBpFWBMYiUE']
EOF
read -d '' config20 << EOF
http-server-address = 127.0.0.1:8820
p2p-listen-endpoint = 0.0.0.0:9820
producer-name = producer111u
private-key = ['EOS6JNYvKigRgQemwW6aTS2qZNHjEHsRsuLTo2TVA935TtcaPD6xU','5J237MB3QfkEczSR9Kthqe73sQdufi7ZXFcaQJwLXaXCAAG3z9m']
EOF
read -d '' config21 << EOF
http-server-address = 127.0.0.1:8821
p2p-listen-endpoint = 0.0.0.0:9821
producer-name = producer111v
private-key = ['EOS78V2E4V4h3txkZ6fQvqXxYez7qzQMTqqdbxS33dBkPbD9kwHfR','5J4gjCRmFtezLMjR12EmTWLvTUVeTTDM4bi4L1osLTZQiShorMo']
EOF
read -d '' config22 << EOF
http-server-address = 127.0.0.1:8822
p2p-listen-endpoint = 0.0.0.0:9822
producer-name = producer111w
private-key = ['EOS7G3KbYdANRcF64rTeyR8j39KaVQ4EGGPK189vHvQazoPF8zgQX','5HwEp79MKNz81nDDZz4zmFzgm7jBcH2nsCLv5ucLvcV3CMztgLn']
EOF
read -d '' config23 << EOF
http-server-address = 127.0.0.1:8823
p2p-listen-endpoint = 0.0.0.0:9823
producer-name = producer111x
private-key = ['EOS7Ckx456UiQNrn9iGbLA4e37ZM7bxuoVtkEcxBza11UcSnL2SyY','5JnDiMJK3KThbPaDxan1FLmDCXFh6VXcwqdNH1oCVzDYF4mZqjb']
EOF
read -d '' config24 << EOF
http-server-address = 127.0.0.1:8824
p2p-listen-endpoint = 0.0.0.0:9824
producer-name = producer111y
private-key = ['EOS7uKfBKEVTuXa2jWLjsrFpVdsfSeJ5cKvfNL5t9thMhFKLNmPNy','5JkESzQ7FF934VeJazRYjQrE9g6geVVpExEEvpwR7QmXtaHmAUT']
EOF
read -d '' config25 << EOF
http-server-address = 127.0.0.1:8825
p2p-listen-endpoint = 0.0.0.0:9825
producer-name = producer111z
private-key = ['EOS5EDycPyDPvEg5VuFn1iBZdRpDhP81dkfPFaXj7RMGk7to945ne','5KXjyXjkrjJpPMWFRSRmsv5tUA9uB5KeSMPLXLUpNEMd2FvLGc8']
EOF
read -d '' config26 << EOF
http-server-address = 127.0.0.1:8826
p2p-listen-endpoint = 0.0.0.0:9826
producer-name = producer112a
private-key = ['EOS6GSCJRSFPBG4nhXFxyE75FNBL18MpxzQc5gAGUjT8ipnfahGeS','5Ka1ihV29UWkjLUFmjqz85DAD81MZ9LLg8hQpNVNXfF9FA9ZFoM']
EOF
read -d '' config27 << EOF
http-server-address = 127.0.0.1:8827
p2p-listen-endpoint = 0.0.0.0:9827
producer-name = producer112b
private-key = ['EOS817hVJSH2zGsTfXP9CynNRYqdntUQTPy5o82NpqzGCooYsx4jP','5JxowrZcMMJ4iZoJkTnhKt4pSvVQsLacY34AeY7oc6XZ1ZfK5Fi']
EOF
read -d '' config28 << EOF
http-server-address = 127.0.0.1:8828
p2p-listen-endpoint = 0.0.0.0:9828
producer-name = producer112c
private-key = ['EOS8fdPxQhHUo1oBPiSjFLRxbKdUmV4gmAjsPHAxPDmHZHk2SgbHd','5J6u5bqfyfmKUeQvtoorkGPTKmJzfhkpc2Pj15mJvK8qc8aAvAg']
EOF
read -d '' config29 << EOF
http-server-address = 127.0.0.1:8829
p2p-listen-endpoint = 0.0.0.0:9829
producer-name = producer112c
private-key = ['EOS5uHCMZbf5f5XxaYA4mNk1eL73VUovcNUWpno63aNLFMD6etqEG','5KHqh8qeWfbztaB4HJ31gCGATxcDp29ZVMzSpLBbWbA2DGhQPjf']
EOF
read -d '' config30 << EOF
http-server-address = 127.0.0.1:8830
p2p-listen-endpoint = 0.0.0.0:9830
producer-name = producer112e
private-key = ['EOS6BeucfYVwJKyNMQC8EEs8PE2pbdGSfqyheV6kFqLt15TWn2xxs','5JAJ38sS2bqx6awVaPFDRXwW4TXUbV699ENbw8DBjnv5CHb2hmm']
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
#            echo private-key = [\'"$pub_key"\',\'"$pri_key"\']
#            echo EOF
#        done
#    }





read -d '' loggingbios << EOF
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
      "name": "net_plugin_impl",
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

read -d '' logging00 << EOF
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
    }
  ]
}
EOF

read -d '' logging01 << EOF
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
    }
  ]
}
EOF