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

# ##

# 첫 번째 단계: 어플리케이션 빌드
FROM alpine:latest as builder

WORKDIR /app

RUN apk --no-cache add openjdk17 curl

RUN wget -q https://services.gradle.org/distributions/gradle-8.5-bin.zip \
    && unzip -q gradle-8.5-bin.zip \
    && rm gradle-8.5-bin.zip \
    && mv gradle-8.5 /opt/gradle \
    && ln -s /opt/gradle/bin/gradle /usr/bin/gradle

COPY . /app

RUN gradle build

# 두 번째 단계: Nginx를 사용하여 어플리케이션 배포
FROM nginx:latest

# Nginx 설정 파일 직접 설정
RUN echo "events {\n  worker_connections  1024;\n}\n\nhttp {\n  server {\n    listen 80;\n    server_name localhost;\n\n    location / {\n      proxy_pass http://localhost:8080;\n      proxy_set_header Host $host;\n      proxy_set_header X-Real-IP $remote_addr;\n      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n      proxy_set_header X-Forwarded-Proto $scheme;\n    }\n\n    access_log /var/log/nginx/access.log;\n    error_log /var/log/nginx/error.log;\n  }\n}" > /etc/nginx/nginx.conf

# 포트 80을 노출
EXPOSE 80

# Nginx 실행
CMD ["nginx", "-g", "daemon off;"]