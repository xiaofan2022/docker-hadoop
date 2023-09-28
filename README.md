##hadoop2.10.2_java8

### Quick Start
network:
```
sudo docker network create --driver=bridge docker-hadoop-master_default
```
hadoop run:
```
  docker-compose up
```
hive:
```
docker-compose -f docker-compose-hive.yml up -d 
```

