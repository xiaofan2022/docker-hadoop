#!/bin/bash
sleep 60
# create input files
mkdir input
echo "Hello Docker" >input/file2.txt
echo "Hello Hadoop" >input/file1.txt
# create input directory on HDFS
hdfs dfs -rmr /input
hdfs dfs -rmr /output
hadoop fs -mkdir -p /input
#
## put input files to HDFS
hdfs dfs -put ./input/* /input
#
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.10.2.jar wordcount /input /output
#
echo -e "\ninput file1.txt:"
hdfs dfs -cat /input/file1.txt
#
echo -e "\ninput file2.txt:"
hdfs dfs -cat /input/file2.txt
#
## print the output of wordcount
echo -e "\nwordcount output:"
hdfs dfs -cat /output/*


