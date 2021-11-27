You can get image via Docker Hub.

https://hub.docker.com/r/kazukima/kafka-without-zookeeper/tags

```
docker run -p 9092:9092 --rm -it kazukima/kafka-without-zookeeper:latest
```


kafka-without-zookeeper
====

https://hub.docker.com/r/kazukima/kafka-without-zookeeper/tags

Dockerfile for runs kafka without zookeeper.

Many software build top of Apache Kafka. Creating sandbox Kafka cluster for try to those software is boring work.

This image aims for testing with Kafka easily. If you try to Kafka related software, 


How to use
====

Thanks to KIP-500, now Kafka runs single process.

Simple run
---

Following one-line start kafka on localmachine, broker advertising name is `localhost`.

```
docker run -p 9092:9092 --rm -it kazukima/kafka-without-zookeeper:latest
```

You can create topic by following command.

```
./kafka-topics.sh --bootstrap-server=localhost:9092 --create --topic new_name

~

Created topic new_name.
```

docker-compose
---


`docker-compose` example is follows. 

```yaml
---
version: '2'
services:
  kafka:
    image: kazukima/kafka-without-zookeeper:latest
    hostname: kafka
    container_name: kafka
    ports:
      - "9092:9092"
      - "9101:9101"
    environment:
      KAFKA_ADVERTISED_HOSTNAME: kafka

```

Configuration
----
You should set `KAFKA_ADVERTISED_HOSTNAME` if you want to connect kafka from other host/container.

Default value is `localhost` and only 

Reference
====
* [KRaft (aka KIP-500) mode Early Access Release - kafka/README.md at 2.8 · apache/kafka](https://github.com/apache/kafka/blob/2.8/config/kraft/README.md)
* [Kafka Needs No Keeper - Removing ZooKeeper Dependency - //www.confluent.io/blog](https://www.confluent.io/blog/removing-zookeeper-dependency-in-kafka/)
* [Apache Kafka 2.8.0 Features and Improvements (Including Early Access to KIP-500) - //www.confluent.io/blog](https://www.confluent.io/blog/kafka-2-8-0-features-and-improvements-with-early-access-to-kip-500/)
