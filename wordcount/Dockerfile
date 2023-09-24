FROM hadoop-base:hadoop2.10.2_java8

ENV CLASS_TO_RUN="wordcount"
ENV PARAMS="/input /output"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
#CMD [ "sh", "-c", "service ssh start; bash"]
