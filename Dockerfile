FROM openjdk:11-slim AS builder
COPY . /app/
WORKDIR /app
RUN chmod 0755 /app/gradlew && ./gradlew bootJar


FROM openjdk:11-slim
# create non root user
RUN groupadd -g 101 spring && useradd -g 101 -l -M -s /bin/false -u 61000 spring
USER spring
COPY --from=builder /app/build/libs/Upload-0.0.1-SNAPSHOT.jar /app/upload.jar
EXPOSE 8080/tcp
ENTRYPOINT ["java","-jar","/app/upload.jar"]