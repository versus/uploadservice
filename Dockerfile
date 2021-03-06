FROM openjdk:11-slim AS builder
COPY . /app/
WORKDIR /app
RUN chmod 0755 /app/gradlew && ./gradlew bootJar


FROM openjdk:11-slim
# create non root user
# Because major distributions reserve uid from 1000 to 60000, I proposed 61000 as uid. By the way, worker nodes of GKE reserve uid from 5000 to 60000.
RUN groupadd -g 61000 spring && useradd -g  61000-l -M -s /bin/false -u 61000 spring
USER spring
COPY --from=builder /app/build/libs/Upload-0.0.1-SNAPSHOT.jar /app/upload.jar
EXPOSE 8080/tcp
ENTRYPOINT ["java","-jar","/app/upload.jar"]