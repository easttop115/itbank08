# 기반이 되는 경량화된 이미지 선택
FROM alpine:latest

# 작업 디렉토리 설정
WORKDIR /app

# 소스 코드 복사
COPY . /app

# 필요한 패키지 설치 (Git 및 기타 도구)
RUN apk update && \
    apk add --no-cache git unzip zip curl sed openjdk17-jdk && \
    rm -rf /var/cache/apk/*

# 환경 변수 설정
ENV GRADLE_HOME=/opt/gradle
ENV GRADLE_VERSION=6.9

# Download and install Gradle
RUN set -o errexit -o nounset && \
    echo "Downloading Gradle" && \
    curl -L https://services.gradle.org/distributions/gradle-6.9-bin.zip -o gradle-bin.zip && \
    unzip gradle-bin.zip -d /opt && \
    rm gradle-bin.zip && \
    ln -s /opt/gradle-6.9/bin/gradle /usr/bin/gradle

# SDKMAN 설치
RUN set -o errexit -o nounset && \
    curl -s "https://get.sdkman.io" | bash && \
    source "$HOME/.sdkman/bin/sdkman-init.sh"

# Gradle 빌드 (옵션: 실제 프로젝트 빌드를 수행하려면 Gradle 빌드 명령어를 사용하십시오)
RUN /bin/sh -c "source $HOME/.sdkman/bin/sdkman-init.sh && gradle --version"

# 컨테이너 실행 명령 (옵션: 실제 애플리케이션 실행 명령어를 사용하십시오)
CMD ["echo", "Docker image built successfully!"]
