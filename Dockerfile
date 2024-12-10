# Stage 1: Build the application with JDK 17
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /aws
COPY ./.mvn/ ./.mvn/
COPY ./mvnw ./
COPY ./pom.xml ./
RUN ./mvnw dependency:go-offline
COPY ./src/ ./src/
RUN ./mvnw clean package -DskipTests

# Stage 2: Run the application without Nginx
FROM openjdk:17-jdk-slim
WORKDIR /aws
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get clean
COPY --from=build /aws/target/spring-boot-aws-0.0.1.jar /aws/spring-boot-aws.jar
EXPOSE 8080
CMD java -jar /aws/spring-boot-aws.jar
