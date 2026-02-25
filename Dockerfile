# =========================
# Build stage
# =========================
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /build

COPY pom.xml .
COPY src ./src

RUN mvn package -DskipTests

# =========================
# Runtime stage
# =========================
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

COPY --from=build /build/target/quarkus-app/ /app/

EXPOSE 8080

CMD ["java", "-jar", "/app/quarkus-run.jar"]