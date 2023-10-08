FROM hadoop-base:hadoop3.3.6_java8

ENV HIVE_VERSION=2.3.9

ENV HIVE_HOME /opt/hive-$HIVE_VERSION
ENV PATH $HIVE_HOME/bin:$PATH
ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION

WORKDIR /opt



#Install Hive and Mysql JDBC
RUN wget https://repo.huaweicloud.com/apache/hive/hive-2.3.9/apache-hive-2.3.9-bin.tar.gz --no-check-certificate -O /tmp/hive-2.3.9-bin.tar.gz &&\
    tar -xzvf /tmp/hive-2.3.9-bin.tar.gz -C /tmp && \
    mv /tmp/apache-hive-2.3.9-bin /opt/hive-2.3.9 && \
    rm /tmp/hive*



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
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 9999
EXPOSE 10000
EXPOSE 10002

#ENTRYPOINT ["entrypoint.sh"]
#CMD startup.sh
CMD [ "sh", "-c", "service ssh start; bash"]

