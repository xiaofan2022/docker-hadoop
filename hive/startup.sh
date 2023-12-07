#!/bin/bash
mysql -h mysql  -u root -proot -e "drop database if exists hive"
$HIVE_HOME/bin/schematool -dbType mysql -initSchema -verbose

hadoop fs -mkdir       /tmp
hadoop fs -mkdir -p    /user/hive/warehouse
hadoop fs -chmod g+w   /tmp
hadoop fs -chmod g+w   /user/hive/warehouse
hiveservices.sh start

cd $HIVE_HOME/bin
./hiveserver2 --hiveconf hive.server2.enable.doAs=false