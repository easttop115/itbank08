# 기반이 되는 경량화된 이미지 선택
FROM alpine:latest

# 작업 디렉토리 설정
WORKDIR /app

# 소스 코드 복사
COPY . /app

# 환경 변수 설정
ENV GRADLE_HOME=/opt/gradle
ENV GRADLE_VERSION=7.3

# 필요한 패키지 설치 (Git, java 및 기타 도구) / 패키지 캐시 삭제
RUN apk update && \
    apk add --no-cache git unzip zip curl sed bash && \
    rm -rf /var/cache/apk/* 

# Corretto 17.0.9 설치
RUN mkdir /opt/java && \
    tar -xzf /usr/lib/jvm/java-17-openjdk-amd64.tar.gz -C /opt/java && \
    rm /usr/lib/jvm/java-17-openjdk-amd64.tar.gz

# Set JAVA_HOME environment variable
ENV JAVA_HOME /opt/java/amazon-corretto-17.0.9.12.1-linux-x64

# Update PATH to include Java binaries
ENV PATH $JAVA_HOME/bin:$PATH

# Gradle 빌드 (옵션: 실제 프로젝트 빌드를 수행하려면 Gradle 빌드 명령어를 사용하십시오)
RUN bash -c "java -version && javac -version && curl -s https://get.sdkman.io | bash && source $HOME/.sdkman/bin/sdkman-init.sh && sdk install gradle $GRADLE_VERSION && sdk flush archives && sdk flush temp"

# 컨테이너 실행 명령 (옵션: 실제 애플리케이션 실행 명령어를 사용하십시오)
CMD ["echo", "Docker image built successfully!"]
