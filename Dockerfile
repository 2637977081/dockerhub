FROM harbor.home.univer/library/maven:3.5.4-jdk-8-alpine as BUILD
COPY settings.xml /root/.m2/settings.xml
WORKDIR /opt/app
COPY pom.xml pom.xml
RUN mvn dependency:go-offline -B
COPY src /opt/app/src
RUN rm -rf /root/.m2/repository/com/univer
RUN mvn clean package

FROM  harbor.home.univer/library/serverjre:8-oracle
COPY --from=BUILD /opt/app/target/*.jar /opt/app/app.jar
WORKDIR /opt/app
CMD java $JVM_OPTS -jar app.jar