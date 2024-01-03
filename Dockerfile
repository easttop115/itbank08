# 기반이 되는 경량화된 이미지 선택 (Alpine Linux에 OpenJDK 17 버전)
FROM ubuntu:latest

# 작업 디렉토리 설정
WORKDIR /app

# 소스 코드 복사
COPY . /app

# 필요한 패키지 설치 (Git 및 기타 도구)
RUN apk-get update && \
    apk add --no-cache git && \
    rm -rf /var/cache/apk/* 

# Gradle 설치
RUN apk add --no-cache curl && \
    curl -s "https://get.sdkman.io" | bash && \
    source "/root/.sdkman/bin/sdkman-init.sh" && \
    sdk install gradle

# Gradle 빌드 (옵션: 실제 프로젝트 빌드를 수행하려면 Gradle 빌드 명령어를 사용하십시오)
RUN gradle --version

# 컨테이너 실행 명령 (옵션: 실제 애플리케이션 실행 명령어를 사용하십시오)
CMD ["echo", "Docker image built successfully!"]

# ######