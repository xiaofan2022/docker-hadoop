DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := hadoop3.3.6_java8
build:
	docker build -t hadoop-base:$(current_branch) ./base
	docker build -t hadoop-namenode:$(current_branch) ./namenode
	docker build -t hadoop-datanode:$(current_branch) ./datanode
	docker build -t hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build -t hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t hadoop-historyserver:$(current_branch) ./historyserver
	docker build -t hadoop-hive:$(current_branch) ./hive
	docker build -t hadoop-wordcount:$(current_branch) ./wordcount
