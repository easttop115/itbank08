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

FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app
COPY build.gradle settings.gradle /app/
COPY gradle /app/gradle
RUN ./gradlew build --no-daemon

COPY src /app/src

CMD ["./gradlew", "bootRun"]