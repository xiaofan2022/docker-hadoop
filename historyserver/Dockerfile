FROM hadoop-base:hadoop3.3.6_java8


HEALTHCHECK CMD curl -f http://localhost:19888/ || exit 1


#VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 19888

CMD ["/run.sh"]
