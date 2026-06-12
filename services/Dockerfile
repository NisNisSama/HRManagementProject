FROM eclipse-temurin:25-jdk AS builder
WORKDIR /home/app

# 1. Copy configurations first to lock in the cache
COPY gradlew gradlew
COPY gradle gradle
COPY build.gradle build.gradle
COPY settings.gradle settings.gradle
COPY gradle.properties gradle.properties
COPY micronaut-cli.yml micronaut-cli.yml

RUN chmod +x ./gradlew

# 2. Force Gradle to download libraries before looking at code
RUN ./gradlew dependencies --no-daemon || true

# 3. Copy source code (breaks cache down here, leaving downloads safe above)
COPY src src
RUN ./gradlew assemble -x test --no-daemon

FROM eclipse-temurin:25-jre

WORKDIR /app

COPY --from=builder /home/app/build/libs/services-*-all.jar ./hrback.jar

EXPOSE 8090

CMD ["java", "-jar", "hrback.jar"]
