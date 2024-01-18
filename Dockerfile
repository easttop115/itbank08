# Stage 1: Build Stage
FROM eclipse-temurin:17-jdk-jammy-alpine AS builder

WORKDIR /app

# Copy Gradle Wrapper
COPY gradlew ./
COPY gradlew.bat ./
COPY gradle /app/gradle

# Copy project files
COPY build.gradle settings.gradle /app/
COPY gradle /app/gradle
COPY src /app/src

# Grant execute permission to Gradle Wrapper
RUN chmod +x ./gradlew

# Build the application using Gradle Wrapper
RUN ./gradlew build --no-daemon

# Stage 2: Runtime Stage
FROM alpine:latest

WORKDIR /app

# Copy only necessary files from the build stage
COPY --from=builder /app/build/libs/*.jar /app/app.jar

# Entrypoint command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
