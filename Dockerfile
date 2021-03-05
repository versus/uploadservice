FROM openjdk:11-slim AS builder
COPY . /app/
RUN  cd /app \
    && ./gradlew bootJar


FROM openjdk:11-slim
COPY --from=builder /app/build/libs/Upload-0.0.1-SNAPSHOT.jar /app/upload.jar
EXPOSE 8080/tcp
ENTRYPOINT ["java","-jar","/app/upload.jar"]