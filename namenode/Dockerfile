FROM hadoop-base:hadoop2.10.2_java8


HEALTHCHECK CMD curl -f http://localhost:50070/ || exit 1

RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 50070

CMD ["/run.sh"]
