# 기반이 되는 경량화된 이미지 선택
FROM openjdk:17-alpine

# 작업 디렉토리 설정
WORKDIR /app

# 소스 코드 복사
COPY . /app

# 환경 변수 설정
ENV GRADLE_HOME=/opt/gradle
ENV GRADLE_VERSION=7.3
ENV JAVA_VERSION=17

# 필요한 패키지 설치 (Git, java17 및 기타 도구)
RUN apk update && \
    apk add --no-cache git unzip zip curl sed bash openjdk17-corretto && \
    rm -rf /var/cache/apk/*

# Downloading SDKMAN! and installing Java and Gradle
RUN apk --no-cache add bash && \
    curl -s "https://get.sdkman.io" | bash -s && \
    /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk selfupdate && sdk install gradle $GRADLE_VERSION && sdk flush archives && sdk flush temp"


# SDKMAN이 설정한 환경 변수를 사용
ENV SDKMAN_CANDIDATES_DIR=/opt/sdkman/candidates
ENV PATH="$SDKMAN_CANDIDATES_DIR/java/current/bin:$SDKMAN_CANDIDATES_DIR/gradle/current/bin:$PATH"

# Gradle 빌드 (옵션: 실제 프로젝트 빌드를 수행하려면 Gradle 빌드 명령어를 사용하십시오)
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk use gradle $GRADLE_VERSION && gradle --version"

# 컨테이너 실행 명령 (옵션: 실제 애플리케이션 실행 명령어를 사용하십시오)
CMD ["echo", "Docker image built successfully!"]
