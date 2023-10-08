FROM ubuntu:22.04

#RUN echo    "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse            "   >  /etc/apt/sources.list
#RUN echo    "deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse   "   >> /etc/apt/sources.list
#RUN echo    "deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse    "   >> /etc/apt/sources.list
#RUN echo    "deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse  "   >> /etc/apt/sources.list


RUN apt-get update && apt-get install -y  \
     openssh-server \
      wget \
      net-tools \
      curl \
      netcat \
      libsnappy-dev \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.tar.gz --no-check-certificate -O /tmp/jdk-8u202-linux-x64.tar.gz && \
    tar -xzvf /tmp/jdk-8u202-linux-x64.tar.gz -C /tmp && \
    mv /tmp/jdk1.8.0_202 /usr/local/jdk1.8 && \
    rm /tmp/jdk*
      
ENV JAVA_HOME=/usr/local/jdk1.8

ENV HADOOP_VERSION 3.3.6
ENV HADOOP_URL https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN set -x \
    && wget "$HADOOP_URL" --no-check-certificate  -O /tmp/hadoop.tar.gz \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*
#
COPY ./config/* /tmp/

RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

RUN mkdir -p /opt/hadoop-$HADOOP_VERSION/logs
#RUN mkdir /hadoop-data
ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION

RUN mv /tmp/ssh_config ~/.ssh/config && \
    mv /tmp/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    mv /tmp/slaves $HADOOP_HOME/etc/hadoop/slaves
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
#ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH
ENV PATH $JAVA_HOME/bin/:$PATH
###
#ADD entrypoint.sh /entrypoint.sh
###
##
##ENV CORE_CONF_fs_defaultFS                                              hdfs://namenode:9870
##ENV CORE_CONF_hadoop_http_staticuser_user                               root
##ENV CORE_CONF_hadoop_proxyuser_hue_hosts                                *
##ENV CORE_CONF_hadoop_proxyuser_hue_groups                               *
##ENV CORE_CONF_io_compression_codecs                                     org.apache.hadoop.io.compress.SnappyCodec
##
##ENV HDFS_CONF_dfs_webhdfs_enabled                                       true
##ENV HDFS_CONF_dfs_permissions_enabled                                   false
##ENV HDFS_CONF_dfs_namenode_datanode_registration_ip___hostname___check  false
#
#ENTRYPOINT ["/entrypoint.sh"]
CMD [ "sh", "-c", "service ssh start; bash"]
