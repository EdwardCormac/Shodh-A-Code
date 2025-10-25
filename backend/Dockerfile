FROM eclipse-temurin:21-jdk-alpine AS build

WORKDIR /app

# Install Maven
RUN apk add --no-cache maven

# Copy pom.xml first for dependency caching
COPY pom.xml ./

# Download dependencies
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Install Docker CLI (needed for judge integration)
RUN apk add --no-cache docker-cli

# Copy the built jar from build stage
COPY --from=build /app/target/*.jar app.jar

# Create temp directory for submissions
RUN mkdir -p /tmp/submissions

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]