# Makefile for Laravel Docker

# Set default target
.DEFAULT_GOAL := help

# Define variables
DOCKER_COMPOSE = docker-compose

# Targets
help:
	@echo "Usage:"
	@echo "  make setup          Setup the Docker environment (build, up, composer-update, data)"
	@echo "  make build          Build the Docker images"
	@echo "  make up             Start the Docker containers"
	@echo "  make down           Stop and remove the Docker containers"
	@echo "  make logs           View Docker container logs"
	@echo "  make bash           Access the bash shell in the Laravel container"
	@echo "  make serve          Run 'php artisan serve' inside the Laravel container"

setup: build up composer-update data

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

logs:
	$(DOCKER_COMPOSE) logs -f

bash:
	$(DOCKER_COMPOSE) exec laravel-docker bash

composer-update: up
	$(DOCKER_COMPOSE) exec laravel-docker bash -c "composer update"

migrate:
	$(DOCKER_COMPOSE) exec -T laravel-docker sh -c "sleep 30 && php artisan migrate"

seed:
	$(DOCKER_COMPOSE) exec laravel-docker php artisan db:seed --class=SongsTableSeeder

data: up
	$(DOCKER_COMPOSE) exec -T laravel-docker sh -c "sleep 30 && php artisan migrate"
	$(DOCKER_COMPOSE) exec laravel-docker php artisan db:seed --class=SongsTableSeeder

serve: up
	$(DOCKER_COMPOSE) exec laravel-docker bash -c "php artisan serve --host=0.0.0.0"

