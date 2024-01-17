# # Use an official Alpine Linux runtime as a parent image
# FROM alpine:latest

# # Set the working directory to /app
# WORKDIR /app

# # Install OpenJDK 17
# RUN apk --no-cache add openjdk17

# # Install Gradle 8.5
# RUN wget -q https://services.gradle.org/distributions/gradle-8.5-bin.zip \
#     && unzip -q gradle-8.5-bin.zip \
#     && rm gradle-8.5-bin.zip \
#     && mv gradle-8.5 /opt/gradle \
#     && ln -s /opt/gradle/bin/gradle /usr/bin/gradle

# # Copy the current directory contents into the container at /app
# COPY . /app

# # Build the application with Gradle
# RUN gradle build

# # Make port 8080 available to the world outside this container
# EXPOSE 8080

# # Run the application when the container launches
# # CMD ["java", "-jar", "build/libs/test-jenkins.jar"]

# FROM eclipse-temurin:17-jdk-jammy

# WORKDIR /app

# # Copy Gradle Wrapper
# COPY gradlew ./
# COPY gradlew.bat ./
# COPY gradle /app/gradle

# # Copy project files
# COPY build.gradle settings.gradle /app/
# COPY gradle /app/gradle
# COPY src /app/src

# # Grant execute permission to Gradle Wrapper
# RUN chmod +x ./gradlew

# # Resolve dependencies and build the application using Gradle Wrapper
# RUN ./gradlew build --no-daemon

# # Run the application
# CMD ["./gradlew", "bootRun"]

# Stage 1: Build Java application
FROM eclipse-temurin:17-jdk-jammy AS builder

WORKDIR /app

# Add a dummy file to invalidate the cache if gradlew or gradle files change
ADD somefile.txt ./

COPY gradlew* ./
COPY gradle /app/gradle
COPY build.gradle settings.gradle /app/
COPY gradle /app/gradle
COPY src /app/src

RUN chmod +x ./gradlew
RUN ./gradlew build --no-daemon

# Stage 2: Create Nginx image
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Copy the compiled Java application JAR from the builder stage
COPY --from=builder /app/build/libs/*.jar /usr/share/nginx/html/application.jar

# Copy Nginx configuration
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose the port Nginx will listen on
EXPOSE 8000

# Command to start Nginx and run the Java application
CMD ["nginx", "-g", "daemon off;"]


