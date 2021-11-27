FROM amazoncorretto:16
# https://hub.docker.com/_/openjdk

ENV KAFKA_DISTRIBUTION=https://downloads.apache.org/kafka/3.0.0/kafka_2.13-3.0.0.tgz

RUN curl -s  --output /tmp/kafka.tgz ${KAFKA_DISTRIBUTION} && \
    yes | yum install tar gzip gettext && \
    mkdir kafka && tar -xvf /tmp/kafka.tgz --strip-components=1 --directory=kafka &&\
    rm -rf /tmp/kafka.tgz

WORKDIR /kafka

# How to start kafka without zookeeper
# https://github.com/apache/kafka/blob/2.8/config/kraft/README.md
ENV CLUSTER_UUID=fdNn7Hv3TRGrk32_j3k3Vg
ENV KAFKA_ADVERTISED_HOSTNAME=localhost

RUN ./bin/kafka-storage.sh format -t $CLUSTER_UUID -c ./config/kraft/server.properties

COPY ./broker.properties /config/
COPY ./server.properties /config/
COPY  ./start_broker.sh ./

EXPOSE 9092 9093

CMD [ "bash", "./start_broker.sh" ]
