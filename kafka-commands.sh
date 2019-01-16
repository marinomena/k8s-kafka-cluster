#List Topics
kubectl -n kafka-cluster exec kafka-test-client -- \
/usr/bin/kafka-topics --zookeeper kafka-zookeeper:2181 --list

#Crete Topic
kubectl -n kafka-cluster exec kafka-test-client -- \
/usr/bin/kafka-topics --zookeeper kafka-zookeeper:2181 \
--topic test --create --partitions 1 --replication-factor 1

#Get message
kubectl -n kafka-cluster exec -ti kafka-test-client -- \
/usr/bin/kafka-console-consumer --bootstrap-server kafka:9092 \
--topic test --from-beginning

#Put message
kubectl -n kafka-cluster exec -ti kafka-test-client -- \
/usr/bin/kafka-console-producer --broker-list kafka:9092 \
--topic test 

