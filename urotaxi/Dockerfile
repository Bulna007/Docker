FROM ubuntu:22.04
ENV TOMCAT_HOME=/u01/middleware/apache-tomcat-11.0.22
ENV PATH=$PATH:$TOMCAT_HOME/bin

RUN apt update -y
RUN apt install -y openjdk-17-jdk

RUN mkdir -p /u01/middleware

WORKDIR /u01/middleware

ADD https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.22/bin/apache-tomcat-11.0.22.tar.gz .
RUN tar -xzvf apache-tomcat-11.0.22.tar.gz
RUN rm apache-tomcat-11.0.22.tar.gz

COPY target/urotaxi.war apache-tomcat-11.0.22/webapps
COPY run.sh apache-tomcat-11.0.22/bin
RUN chmod u+x apache-tomcat-11.0.22/bin/run.sh

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl -f http://localhost:8080/urotaxi/actuator/health
ENTRYPOINT [ "apache-tomcat-11.0.22/bin/run.sh" ]
