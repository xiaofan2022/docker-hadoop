# 选择基础镜像
FROM openjdk:8
ENV DORIS_VERSION=1.2.4
# 根据自己需求进行替换
ARG package_url=https://mirrors.tuna.tsinghua.edu.cn/apache/doris/1.2/$DORIS_VERSION-rc01/apache-doris-be-$DORIS_VERSION-bin-x86_64.tar.xz
ARG package_name=apache-doris-be-1.2.4-bin-x86_64.tar.xz
ARG dependency_package_url=https://mirrors.tuna.tsinghua.edu.cn/apache/doris/1.2/$DORIS_VERSION-rc01/apache-doris-dependencies-$DORIS_VERSION-bin-x86_64.tar.xz

# 例如 ARG package_name=apache-doris-1.1.1-bin-x86.tar.gz
ARG package_path=apache-doris-be-1.2.4-bin-x86_64
# 例如 ARG package_path=apache-doris-1.1.1-bin-x86
# 设置环境变量
ENV JAVA_HOME="/usr/local/openjdk-8/" \
    PATH="/usr/local/apache-doris/be/bin:$PATH"

# 部署软件
RUN curl -o /usr/local/apache-doris.tar.gz $package_url && \
    curl -o /usr/local/apache-doris-dependencies.tar.gz $dependency_package_url && \
    tar -xvf /usr/local/apache-doris.tar.gz -C /usr/local/ && \
    tar -xvf /usr/local/apache-doris-dependencies.tar.gz -C /usr/local/ && \
    mv /usr/local/$package_path /usr/local/apache-doris && \
    mv /usr/local/apache-doris-dependencies-1.2.4-bin-x86_64/java-udf-jar-with-dependencies.jar /usr/local/apache-doris/lib && \
    rm -rf /usr/local/$package_name /usr/local/apache-doris/fe /usr/local/apache-doris/udf /usr/local/apache-doris/apache_hdfs_broker && \
    rm -rf /usr/local/apache-doris.tar.gz && \
    rm -rf /usr/local/apache-doris-dependencies*
CMD sysctl -w vm.max_map_count=2000000
COPY ./init_be.sh  /usr/local/apache-doris/bin/
RUN chmod 755 /usr/local/apache-doris/bin/init_be.sh
#CMD ["bash"]
CMD ["/bin/sh","/usr/local/apache-doris/bin/init_be.sh"]
#ENTRYPOINT ["/usr/local/apache-doris/bin/init_be.sh"]