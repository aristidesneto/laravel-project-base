# Project Base

## Helper

Execute `make` or `make help` to see available commands.

```bash
Usage:
  make <target>

Targets:
  up          Up containers
  run-dev     Run application
  down        Down containers
  build       Build application and install dependencies
  migrate     Execute migrations, database needs running
  ssh-%       SSH inside container, Ex: 'make ssh-laravel' for container laravel
  help        Print help
```

## Setup database

Setup your `.env` file:

```env
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=password
```

## Setup application

To run the project for the first time, run the command to build the application:

```bash
make build
```

To run application, run the command:

```bash
make up
```

This command will launch the containers and run yarn to watch for any changes to the files.

Your terminal will be locked.

Open other terminal and execute the migration:

```bash
make migrate
```

## Interact with containers

Commands via composer and yarn must be executed inside the laravel container.

```bash
# ssh inside laravel
make ssh-laravel
```

It is also possible to execute commands this way:

```bash
docker compose exec laravel composer install <package>
```

## Access the application

Confirm if all containers are running:

```
docker compose ps
```

The application is running: http://localhost:8080