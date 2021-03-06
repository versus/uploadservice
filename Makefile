
.PHONY: run
run:
	./gradlew bootRun

.PHONY: build
build:
	./gradlew bootJar

.PHONY: docker-build
docker-build:
	docker build -f Dockerfile -t versus/upload:latest .

.PHONY: docker-run
docker-run:
	docker-compose -f docker-compose.yml up --build
