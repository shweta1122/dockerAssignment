FROM adoptopenjdk/maven-openjdk11

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:resolve

COPY . .
RUN mvn package


EXPOSE 80

# run time
WORKDIR /app/target
ENTRYPOINT ["java","-jar","/dockerAssignment-0.0.1-SNAPSHOT.jar","--server.port=80"]
