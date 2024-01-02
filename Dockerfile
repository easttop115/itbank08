# 환경 변수 설정
ENV GRADLE_VERSION=8.5 \
    JAVA_VERSION=17

# 필수 도구 설치
RUN apk --no-cache add \
        openjdk${JAVA_VERSION} \
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
WORKDIR /app

# 이미지 빌드 스크립트
# COPY . /app
# RUN docker build -t 477159410287.dkr.ecr.ap-northeast-2.amazonaws.com/itbank08 .

# 사용자 권한 변경
USER root

# 필요한 작업 수행 (Runner 등록 및 실행 등)
