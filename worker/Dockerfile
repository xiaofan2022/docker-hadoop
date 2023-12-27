FROM flink-base:1.16.3_scala_2.12
RUN mkdir -p /usr/local/flink/log
ADD flink-conf.yaml /usr/local/flink/conf/
ADD worker.sh /

EXPOSE 8081

CMD ["/bin/bash", "/worker.sh"]
