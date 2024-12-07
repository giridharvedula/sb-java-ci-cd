FROM cgr.dev/chainguard/jdk:latest
WORKDIR /aws
COPY ./.mvn/ ./.mvn/
COPY ./mvnw ./
COPY ./pom.xml ./
COPY ./src/main/java/com/springboot/aws/SpringBootAwsApplication.java ./src/main/java/com/springboot/aws/
RUN ls -la ./
RUN ./mvnw dependency:go-offline 
EXPOSE 80
CMD ["./mvnw", "spring-boot:run"]
