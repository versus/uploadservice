
.PHONY: run
run:
	./gradlew bootRun

.PHONY: build
build:
	./gradlew bootJar

.PHONY: compose
compose:
	docker-compose up --build


