

``` 
# step 1 in new shell
cd ./clusters-ibc/cluster-one
./cluster.sh init
./cluster.sh start

# step 2 in new shell
cd ./clusters-ibc/cluster-two
./cluster.sh init
./cluster.sh start

# step 3 in new shell
cd ./clusters-ibc
./chain_run.sh

# step 4 start test in new shell
cd ./clusters-ibc
. task_ibc_test.sh



# clear shell backgroud processes and log files
cd ./clusters-ibc
. clear.sh

```
