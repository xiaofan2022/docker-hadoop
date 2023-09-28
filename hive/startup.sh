#!/bin/bash
$HIVE_HOME/bin/schematool -dbType mysql -initSchema -verbose

hadoop fs -mkdir       /tmp
hadoop fs -mkdir -p    /user/hive/warehouse
hadoop fs -chmod g+w   /tmp
hadoop fs -chmod g+w   /user/hive/warehouse
hiveservices.sh start

cd $HIVE_HOME/bin
./hiveserver2 --hiveconf hive.server2.enable.doAs=false
sleep 60

CREATE TABLE IF NOT EXISTS users (
    user_id INT,
    username STRING,
    email STRING
);

INSERT INTO users VALUES
    (1, 'user1', 'user1@example.com'),
    (2, 'user2', 'user2@example.com'),
    (3, 'user3', 'user3@example.com');