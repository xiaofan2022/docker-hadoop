FROM hadoop-base:hadoop2.10.2_java8

ENV HIVE_VERSION=2.3.9

ENV HIVE_HOME /opt/hive-$HIVE_VERSION
ENV PATH $HIVE_HOME/bin:$PATH
ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION
ENV HIVE_LOG_DIR /opt/hive-$HIVE_VERSION/logs
WORKDIR /opt


RUN mkdir -p $HIVE_LOG_DIR

#Install Hive and Mysql JDBC
RUN wget https://repo.huaweicloud.com/apache/hive/hive-2.3.9/apache-hive-2.3.9-bin.tar.gz --no-check-certificate -O /tmp/hive-2.3.9-bin.tar.gz &&\
    tar -xzvf /tmp/hive-2.3.9-bin.tar.gz -C /tmp && \
    mv /tmp/apache-hive-2.3.9-bin/* $HIVE_HOME && \
    rm /tmp/hive* && \
    wget https://maven.aliyun.com/nexus/content/groups/public/mysql/mysql-connector-java/8.0.27/mysql-connector-java-8.0.27.jar -O $HIVE_HOME/lib/mysql-connector-java-8.0.27.jar && \
    wget https://maven.aliyun.com/nexus/content/groups/public/com/google/guava/guava/27.0-jre/guava-27.0-jre.jar -O $HIVE_HOME/lib/guava-27.0-jre.jar



#Spark should be compiled with Hive to be able to use it
#hive-site.xml should be copied to $SPARK_HOME/conf folder

#Custom configuration goes here
ADD conf/hive-site.xml $HIVE_HOME/conf
ADD conf/beeline-log4j2.properties $HIVE_HOME/conf
ADD conf/hive-env.sh $HIVE_HOME/conf
ADD conf/hive-exec-log4j2.properties $HIVE_HOME/conf
ADD conf/hive-log4j2.properties $HIVE_HOME/conf
ADD conf/ivysettings.xml $HIVE_HOME/conf
ADD conf/llap-daemon-log4j2.properties $HIVE_HOME/conf
ADD hiveservices.sh $HIVE_HOME/bin

COPY hiveservices.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/hiveservices.sh

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

COPY entrypoint.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 9999
EXPOSE 10000
EXPOSE 10002

#ENTRYPOINT ["entrypoint.sh"]
CMD startup.sh
#CMD [ "sh", "-c", "service ssh start; bash"]

