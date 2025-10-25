FROM eclipse-temurin:21-jdk-alpine

# Create non-root user for running code
RUN adduser -D -u 1001 runner

# Install basic utilities
RUN apk add --no-cache bash coreutils

WORKDIR /workspace

# Copy runner script
COPY runner.sh /usr/local/bin/runner.sh
RUN chmod +x /usr/local/bin/runner.sh

# Switch to non-root user
USER runner

ENTRYPOINT ["/usr/local/bin/runner.sh"]