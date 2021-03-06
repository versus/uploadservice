# Getting Started

### Requirement
For further reference, please consider the following sections:

* docker
* docker-compose
* make
* openjdk-11 (optional)

### Start project

```bash
git clone https://github.com/versus/uploadservice.git
cd uploadservice
make compose
```
* waiting for start the service
```bash
 curl localhost:8080/actuator/health
 {"status":"UP"}
 ```
* try to connect to the service
```bash
curl localhost:8080
Use `curl -F 'file=@nameFile.ext' http://localhost:8080/upload` and see file into /tmp

```
* try to upload a file upload.jar to the service
```bash
curl -F 'file=@upload.jar' localhost:8080/upload
File upload.jar has been successfully uploaded
```

* check the file in /tmp directory in the service images

```bash
docker exec upload_upload_1 ls /tmp/upload.jar
/tmp/upload.jar
```

* check prometeus metrics for the service
```bash
curl localhost:8080/actuator/prometheus

......

```

### Use make

* Start the service in local environment
```bash
make run
```

* Build jar file of the service

```bash
make build
.....
ls ./build/libs/Upload-0.0.1-SNAPSHOT.jar
```

* Build docker image versus/upload:latest of the service
```bash
make docker-build
```

* Build docker image and start project in docker environment
```bash
make docker-run
```

