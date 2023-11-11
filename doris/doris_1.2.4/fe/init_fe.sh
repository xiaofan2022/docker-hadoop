#!/bin/bash
cd /usr/local/apache-doris/
perl -pi -e "s|# priority_networks = 10.10.10.0/24;192.168.0.0/16|priority_networks = 172.20.80.0/16|g" /usr/local/apache-doris/conf/fe.conf
/usr/local/apache-doris/bin/start_fe.sh
