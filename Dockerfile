# Multi-stage Dockerfile

# Stage 1: Build
FROM openjdk:17-alpine AS builder

# Install required dependencies and perform build steps
RUN mkdir -p /opt && \
    apk --no-cache add openjdk17 unzip bash curl && \
    curl -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o /tmp/gradle.zip && \
    unzip -d /opt /tmp/gradle.zip && \
    rm /tmp/gradle.zip && \
    ...

# Stage 2: Create the final image
FROM another-base-image

# Copy artifacts from the builder stage
COPY --from=builder /app/build /app/build

# Set the working directory
WORKDIR /app

# 이미지 빌드 스크립트
RUN docker build -t 477159410287.dkr.ecr.ap-northeast-2.amazonaws.com/itbank08 .

# 사용자 권한 변경
USER root

# 필요한 작업 수행 (Runner 등록 및 실행 등)
