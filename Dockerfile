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
ENV GRADLE_VERSION=7.3
ENV JAVA_HOME=$SDKMAN_CANDIDATES/java/current
ENV PATH=$JAVA_HOME/bin:$PATH

# Downloading SDKMAN! and installing Java and Gradle
RUN apk --no-cache add bash && \
    curl -s "https://get.sdkman.io" | bash -s && \
    bash -c "source \"$HOME/.sdkman/bin/sdkman-init.sh\" && \
    sdk install java $JAVA_VERSION && \
    sdk install gradle $GRADLE_VERSION && \
    rm -rf $HOME/.sdkman/archives/* && \
    rm -rf $HOME/.sdkman/tmp/*"

# # Downloading SDKMAN! and installing Java and Gradle
# RUN apk --no-cache add bash && \
#     curl -s "https://get.sdkman.io" | bash -s && \
#     source "$HOME/.sdkman/bin/sdkman-init.sh" && \
#     bash -c "yes | sdk install java $JAVA_VERSION && \
#     yes | sdk install gradle $GRADLE_VERSION && \
#     rm -rf $HOME/.sdkman/archives/* && \
#     rm -rf $HOME/.sdkman/tmp/*"

# # Gradle 설치
# RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && gradle --version"

# Gradle 빌드 (옵션: 실제 프로젝트 빌드를 수행하려면 Gradle 빌드 명령어를 사용하십시오)
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk use gradle $GRADLE_VERSION && gradle --version"


# 컨테이너 실행 명령 (옵션: 실제 애플리케이션 실행 명령어를 사용하십시오)
CMD ["echo", "Docker image built successfully!"]
