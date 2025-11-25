# Multi-stage Dockerfile for a Spring Boot app
FROM maven:3.9.4-eclipse-temurin-21-alpine AS build
WORKDIR /workspace
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests package

FROM eclipse-temurin:21-jre-alpine
ARG JAR_FILE=target/java-aws-app-0.0.1-SNAPSHOT.jar
WORKDIR /app
COPY --from=build /workspace/${JAR_FILE} /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
