#Download base image ubuntu 16.04
FROM ubuntu:16.04
 
# Update Software repository
RUN apt-get update
 
RUN apt-get install -y default-jdk
RUN apt-get install wget
RUN apt-get install -y iputils-ping
RUN cd /opt/ && wget http://apache.rediris.es/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
#ADD http://apache.rediris.es/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz /opt/
RUN cd /opt/ && tar xzf /opt/spark-2.2.0-bin-hadoop2.7.tgz
RUN ls /opt/

RUN apt-get -y install openssh-server
RUN service ssh start

ENV SPARK_HOME /opt/spark-2.2.0-bin-hadoop2.7
ENV PATH $PATH:${SPARK_HOME}/bin
#ENV PATH $PATH:${SPARK_HOME}/sbin

#COPY slaves /opt/spark-2.2.0-bin-hadoop2.7/conf

CMD ["/opt/spark-2.2.0-bin-hadoop2.7/bin/spark-class", "org.apache.spark.deploy.master.Master"]

EXPOSE 8080 7077 6066