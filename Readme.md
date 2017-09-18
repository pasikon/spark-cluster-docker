start stuff:

0. create mynet network

1. Build base image
docker build -t spark-michal-test:latest .

2. build master image
docker build -t spark-michal-test-master:latest .

3. build worker image
docker build -t spark-michal-test-worker:latest .

4. create master container
docker create --net mynet -p 8089:8080 -h spark-master --name spark-master -i -t spark-michal-test-master:latest

5. start master container
docker start spark-master

6. create number of worker containers
docker create --net mynet -h spark-w1 --name spark-w1 -i -t spark-michal-test-worker:latest
docker create --net mynet -h spark-w2 --name spark-w2 -i -t spark-michal-test-worker:latest

7. start number of workers
docker start spark-w1
docker start spark-w2

TODO: add memory params to nodes