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