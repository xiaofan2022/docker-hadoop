# 选择基础镜像
FROM openjdk:8
ENV DORIS_VERSION=1.2.4
# 根据自己需求进行替换
ARG package_url=https://mirrors.tuna.tsinghua.edu.cn/apache/doris/1.2/$DORIS_VERSION-rc01/apache-doris-fe-$DORIS_VERSION-bin-x86_64.tar.xz
# 例如 ARG package_url=https://mirrors.tuna.tsinghua.edu.cn/apache/doris/1.1/1.1.1-rc03/apache-doris-1.1.1-bin-x86.tar.gz
ARG package_name=apache-doris-fe-1.2.4-bin-x86_64.tar.xz
# 例如 ARG package_name=apache-doris-1.1.1-bin-x86.tar.gz
ARG package_path=apache-doris-fe-1.2.4-bin-x86_64
# 例如 ARG package_path=apache-doris-1.1.1-bin-x86
# 设置环境变量
ENV JAVA_HOME="/usr/local/openjdk-8/" \
    PATH="/usr/local/apache-doris/fe/bin:$PATH"
# 部署软件
RUN curl -o /usr/local/apache-doris.tar.gz $package_url && \
    tar -xvf /usr/local/apache-doris.tar.gz -C /usr/local/ && \
    mv /usr/local/$package_path /usr/local/apache-doris && \
    rm -rf /usr/local/$package_name /usr/local/apache-doris/be /usr/local/apache-doris/udf /usr/local/apache-doris/apache_hdfs_broker && \
    rm -rf /usr/local/apache-doris.tar.gz

COPY init_fe.sh  /usr/local/apache-doris/bin
RUN chmod 755 /usr/local/apache-doris/bin/init_fe.sh
#CMD ["bash"]

CMD ["/usr/local/apache-doris/bin/init_fe.sh"]