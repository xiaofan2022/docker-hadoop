FROM flink-base:1.16.3_scala_2.12
#config files (template)
COPY flink-conf.yaml /usr/local/flink/conf/

COPY master.sh /
#RUN chmod +x /usr/local/flink/bin/jobmanager.sh
RUN mkdir -p /usr/local/flink/log
ENV FLINK_MASTER_LOG /usr/local/flink/log

EXPOSE 6123 22 8080

CMD ["/bin/bash", "/master.sh"]
#CMD [ "sh", "-c", "service ssh start; bash"]
