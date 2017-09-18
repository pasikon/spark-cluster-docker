FROM spark-michal-test:latest

ENV SPARK_MASTER "spark://spark-master:7077"

CMD ["/opt/spark-2.2.0-bin-hadoop2.7/bin/spark-class", "org.apache.spark.deploy.worker.Worker", "spark://spark-master:7077"]