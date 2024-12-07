# Stage 1: Build the Spring Boot application using Maven
FROM maven:3.8.4-openjdk-11 AS build

WORKDIR /app
COPY pom.xml .
COPY src /app/src
RUN mvn clean package 

RUN ls -la /app/target/ 

# Stage 2: Run the Spring Boot app using OpenJDK
FROM openjdk:11-jre-slim AS runtime

WORKDIR /app
COPY --from=build /app/target/helloworld-0.0.1-SNAPSHOT.jar app.jar

# Stage 3: Set up Nginx to serve the Spring Boot app
FROM nginx:alpine AS nginx

# Copy the custom Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the Spring Boot app to the nginx server's root
COPY --from=runtime /app/app.jar /usr/share/nginx/html/app.jar

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
