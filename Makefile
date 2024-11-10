.DEFAULT_GOAL := help

.PHONY: up run-dev down build migrate help


up: ## Up containers
	@docker compose up -d
	make run-dev

run-dev: ## Run application
	@docker compose exec laravel yarn run dev --host

down: ## Down containers
	@docker compose down

build: ## Build application and install dependencies
	@docker compose build
	@docker compose run --rm laravel composer install
	@docker-compose run --rm laravel yarn install

## Run migrate
migrate: ## Execute migrations, database needs running
	@docker compose run --rm laravel php artisan migrate
	@docker compose run --rm laravel php artisan db:seed

ssh-%: ## SSH inside container, Ex: 'make ssh-laravel' for container laravel
	@docker compose exec $* bash

help: ## Print help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_%-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)