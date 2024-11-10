FROM php:8.3-fpm

# Arguments defined in docker-compose.yml
ARG WWWUSER=laravel
ARG UID=1000
ARG NODE_VERSION=20

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


RUN apt-get update && apt-get install -y gpg \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_VERSION.x nodistro main" > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y nodejs \
    && npm install -g yarn

# Set working directory
WORKDIR /var/www/html

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $UID -d /home/$WWWUSER $WWWUSER
RUN mkdir -p /home/$WWWUSER/.composer && \
    chown -R $WWWUSER:$WWWUSER /home/$WWWUSER

USER $WWWUSER
