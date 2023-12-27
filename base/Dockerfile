#FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8
FROM ubuntu:22.04
ENV FLINK_VERSION=1.16.3
#ENV HADOOP_VERSION=32
ENV SCALA_VERSION=2.12

#Enable poc-init-daemon
ENV ENABLE_INIT_DAEMON false
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP flink_master_init

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /

##Flink Installation
###Download:
RUN  set -ex && apt-get update && apt-get install -y  \
     openssh-server \
      wget \
      net-tools \
      curl \
      netcat \
      libsnappy-dev \
      dnsutils \
      vim \
    && rm -rf /var/lib/apt/lists/*

RUN  set -ex && apt-get update \
      && apt-get install dnsutils -y  \
      && apt-get -y install openssh-client \
      && chmod +x *.sh \
      #&& curl -fSL https://archive.apache.org/dist/flink/flink-${FLINK_VERSION}/flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz -o flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz\
      && curl -fSL https://mirrors.tuna.tsinghua.edu.cn/apache/flink/flink-${FLINK_VERSION}/flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz -o flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz\
      && tar -xvzf flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz \
      && rm flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz \
      && mv flink-${FLINK_VERSION} /usr/local/flink \
      && curl -fSL https://repo.maven.apache.org/maven2/org/apache/flink/flink-connector-jdbc/1.16.2/flink-connector-jdbc-1.16.2.jar -o /usr/local/flink/lib/flink-connector-jdbc-1.16.2.jar \
      && curl -fSL https://repo.maven.apache.org/maven2/mysql/mysql-connector-java/8.0.11/mysql-connector-java-8.0.11.jar -o /usr/local/flink/lib/mysql-connector-java-8.0.11.jar


RUN wget https://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.tar.gz --no-check-certificate -O /tmp/jdk-8u202-linux-x64.tar.gz && \
    tar -xzvf /tmp/jdk-8u202-linux-x64.tar.gz -C /tmp && \
    mv /tmp/jdk1.8.0_202 /usr/local/jdk1.8 && \
    rm /tmp/jdk*

ENV JAVA_HOME=/usr/local/jdk1.8
ENV PATH $JAVA_HOME/bin/:$PATH

ENV FLINK_HOME /usr/local/flink
ENV PATH $PATH:$FLINK_HOME/bin

#add passless key to ssh
RUN ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/*

# add netcat for SERVICE_PRECONDITION checks
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends netcat

COPY entrypoint.sh /

#ENTRYPOINT ["/entrypoint.sh"]
CMD [ "sh", "-c", "service ssh start; bash"]
