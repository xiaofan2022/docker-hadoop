#!/bin/bash
cd $HIVE_HOME/scripts/metastore/upgrade/mysql/
#sed -i 's/CHARSET=latin1/CHARSET=utf8/g' *.sql
#sed -i 's/latin1_bin/utf8_general_ci/g' *.sql
#sed -i 's/latin1/utf8/g' *.sql

hadoop fs -mkdir       /tmp
hadoop fs -mkdir -p    /user/hive/warehouse
hadoop fs -chmod g+w   /tmp
hadoop fs -chmod g+w   /user/hive/warehouse
schematool -dbType mysql -initSchema -verbose
hiveservices.sh start
hiveserver2 --hiveconf hive.server2.enable.doAs=false
