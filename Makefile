# Define a command for running Docker Compose
DOCKER_COMPOSE_RUN = docker-compose run --rm mlflow-server

# Define the build process for Docker Compose
build:
	@docker-compose build

up:
	@docker-compose up -d

down:
	@docker-compose down

exec-in: up
	@docker exec -it local-mlflow-tracking-server bash

lock-dependencies:
	@$(DOCKER_COMPOSE_RUN) bash -c "if [ -e ${BUILD_POETRY_LOCK} ]; then cp ${BUILD_POETRY_LOCK} ./poetry.lock; else poetry lock; fi"

# Environment variable for the location of the build Poetry lock file
BUILD_POETRY_LOCK = /poetry.lock.build
