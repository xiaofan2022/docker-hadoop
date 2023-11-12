#DOCKER_NETWORK = docker-hadoop_default
#ENV_FILE = hadoop.env
current_branch := 1.2.4-rc01
build:
	docker build -t doris:$(current_branch)-be ./be
	docker build -t doris:$(current_branch)-fe ./fe
	docker build -t doris:register ./doris-register
