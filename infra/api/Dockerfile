FROM eclipse-temurin:25-jdk AS builder
WORKDIR /home/app

ARG SRC_DIR=services
# 1. Copy configurations first to lock in the cache
COPY ${SRC_DIR}/gradlew gradlew
COPY ${SRC_DIR}/gradle gradle
COPY ${SRC_DIR}/build.gradle build.gradle
COPY ${SRC_DIR}/settings.gradle settings.gradle
COPY ${SRC_DIR}/gradle.properties gradle.properties
COPY ${SRC_DIR}/micronaut-cli.yml micronaut-cli.yml

RUN chmod +x ./gradlew

# 2. Force Gradle to download libraries before looking at code
RUN ./gradlew dependencies --no-daemon || true

# 3. Copy source code (breaks cache down here, leaving downloads safe above)
COPY ${SRC_DIR}/src src
RUN ./gradlew assemble -x test --no-daemon

FROM eclipse-temurin:25-jre

WORKDIR /app

COPY --from=builder /home/app/build/libs/services-*-all.jar ./hrback.jar

EXPOSE 8090

CMD ["java", "-jar", "hrback.jar"]
