# Project Base

## Helper

Execute `make` or `make help` to see available commands.

```bash
Usage:
  make <target>

Targets:
  up                    Up containers
  run-dev               Run application
  down                  Down containers
  build                 Build application and install dependencies
  migrate               Execute migrations, database needs running
  ssh-%                 SSH inside container, Ex: 'make ssh-laravel' for container laravel
  subdomain-%           Create subdomains valids for use on application, Ex: 'make subdomain-tenant1'
  new-database-%        Create database for new tenant, Ex: 'make new-database-tenant1'
  help                  Print help
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
# or
docker compose exec laravel yarn install <package>
```

## Dynamic subdomains

Nginx is configured to respond to multiple subdomains and reject invalid subdomains.

To create a subdomain for your application, run the command:

> Root password required for this command

```bash
# Create a subdomain called tenant1
make subdomain-tenant1
```

This command will:

- create an entry in your hosts file, located at `/etc/hosts` on Linux and MacOS
- create a file called `tenant1` inside nginx container at `/etc/domains/tenant1`
- restart nginx container to apply configuration
- create a database to new tenant

The item 2 is necessary because there is a validation in nginx if the subdomain is valid or not, see line 7 in `./docker/nginx/conf/project-saas.conf`


## Access application

Application is running at [http://tenant1.project.local](http://tenant1.project.local)