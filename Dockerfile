# Use a base image with Maven and JDK for building the application
FROM maven:3.8.3-openjdk-17-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Build the application using Maven
RUN mvn clean package

# Use a lightweight base image with OpenJDK for running the application
FROM eclipse-temurin:17-jre-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the build stage into the container
COPY --from=build /app/target/docker-java-app-0.0.1-SNAPSHOT.jar .

# Expose the port that the Spring Boot application will listen on
EXPOSE 8080

# Specify the command to run the Spring Boot application
CMD ["java", "-jar", "docker-java-app-0.0.1-SNAPSHOT.jar"]