# 기반 이미지 설정
FROM alpine:3.15

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
    curl -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o /tmp/gradle.zip || \
    (echo "Failed to download Gradle." && exit 1) && \
    unzip -d /opt /tmp/gradle.zip && \
    rm /tmp/gradle.zip


# Gradle 실행 환경 변수 설정
ENV GRADLE_HOME=/opt/gradle-${GRADLE_VERSION}
ENV PATH=${GRADLE_HOME}/bin:$PATH

# 작업 디렉토리 생성
RUN mkdir -p /app
WORKDIR /app

# # 이미지 빌드 명령어
# docker build -t gl.itbank08.link:8001/das/itbank08 .

# 이미지 빌드 스크립트
COPY . /app
WORKDIR /app
RUN docker build -t 477159410287.dkr.ecr.ap-northeast-2.amazonaws.com/itbank08 .


# 사용자 권한 변경
USER root

# 필요한 작업 수행 (Runner 등록 및 실행 등)

# 최종적으로 서버에 이미 설치된 GitLab Runner를 활용하여 작업을 진행합니다.