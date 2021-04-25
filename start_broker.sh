envsubst < /config/broker.properties > ./config/kraft/broker.properties
envsubst < /config/server.properties > ./config/kraft/server.properties

./bin/kafka-server-start.sh ./config/kraft/server.properties
