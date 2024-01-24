# # FROM alpine:latest

# # RUN apk --no-cache add openjdk17 gradle
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

# Stage 1: Build buildx and install it
FROM golang:alpine as buildx_builder

RUN apk --no-cache add git
RUN git clone https://github.com/docker/buildx /go/src/github.com/docker/buildx
WORKDIR /go/src/github.com/docker/buildx
RUN CGO_ENABLED=0 GOOS=linux go install .

# Stage 2: Build your Java application
FROM eclipse-temurin:17-jdk-jammy as app_builder

WORKDIR /app

COPY gradlew ./
COPY gradlew.bat ./
COPY gradle /app/gradle
COPY build.gradle settings.gradle /app/
COPY gradle /app/gradle
COPY src /app/src
RUN chmod +x ./gradlew

# Install buildx
COPY --from=buildx_builder /go/bin/buildx /usr/local/bin/buildx

# Continue with the rest of your Dockerfi