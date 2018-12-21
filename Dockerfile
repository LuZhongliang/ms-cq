FROM registry.docker-cn.com/library/gradle:jdk8
RUN mkdir /home/gradle/microservices
ADD . /home/gradle/microservices/
WORKDIR /home/gradle/microservices/
USER root
RUN gradle bootJar
CMD java -jar /home/gradle/microservices/build/libs/gs-accessing-data-mysql-0.1.0.jar