# Base Images 基础镜像
FROM ubuntu:22.04

# 添加脚本文件
ADD *.sh /root/

# 设置工作目录
WORKDIR /root/

RUN apt-get update && apt-get install -y  \
   mysql-client \
  netcat \
    && rm -rf /var/lib/apt/lists/*  && \
    chmod 755 *.sh

# 设置镜像源及基础环境
#RUN echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/latest-stable/main/" > /etc/apk/repositories \
#    && echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/latest-stable/community/" >> /etc/apk/repositories && \
#    apk update && \
#    apk add --no-cache mysql-client && \

#CMD ["tail", "-f", "/dev/null"]
#CMD [ "sh", "-c", "service ssh start; bash"]

