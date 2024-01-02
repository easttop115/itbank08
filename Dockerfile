# 기반 이미지 설정
FROM alpine:3.15

# 환경 변수 설정
ENV GRADLE_VERSION=8.5 \
    JAVA_VERSION=17

# 필수 도구 설치
RUN apk --no-cache add \
        openjdk$JAVA_VERSION \
        unzip \
        bash \
        curl

# Gradle 설치
RUN mkdir -p /opt && \
    curl -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o /tmp/gradle.zip && \
    unzip -d /opt /tmp/gradle.zip && \
    rm /tmp/gradle.zip

# Gradle 실행 환경 변수 설정
ENV GRADLE_HOME=/opt/gradle-${GRADLE_VERSION}
ENV PATH=${GRADLE_HOME}/bin:$PATH

# 작업 디렉토리 생성
RUN mkdir -p /app
WORKDIR /app
