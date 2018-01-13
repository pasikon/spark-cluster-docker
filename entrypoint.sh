#!/bin/bash

export SPARK_MASTER_PORT=7077

# run spark 
cd /opt/spark-2.2.0-bin-hadoop2.7/sbin
./start-master.sh
./start-slave.sh spark://`hostname`:$SPARK_MASTER_PORT

CMD=${1:-"exit 0"}
if [[ "$CMD" == "-d" ]];
then
	service sshd stop
	/usr/sbin/sshd -D -d
else
	/bin/bash -c "$*"
fi