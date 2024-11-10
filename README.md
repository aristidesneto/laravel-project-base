# Project Base

## Development

Execute `make` or `make help` for know thats commands.

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

To run the project for the first time, run the command to build the application:

```bash
make build
```

To run application, run the command:

```bash
make up
```

This command will launch the containers and run yarn to watch for any changes to the files.

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

Confirm all containers are running:

```
docker compose ps
```

The application is running: http://localhost:8080