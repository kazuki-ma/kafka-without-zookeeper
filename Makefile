build:
	docker image build . -t kafka-without-zookeeper
	docker image tag kafka-without-zookeeper kazukima/kafka-without-zookeeper:latest
	docker image push kazukima/kafka-without-zookeeper:latest
