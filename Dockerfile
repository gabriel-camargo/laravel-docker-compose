FROM php:7.4-fpm
LABEL maintainer="Gabriel Rodrigo de Camargo <gabriel.rodrigocam@gmail.com>"

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libjpeg-dev \
    libxml2-dev \
    libxslt-dev \
    libpq-dev \
    locales \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath opcache

RUN sed --in-place '/pt_BR.UTF-8/s/^#//' /etc/locale.gen

ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR:pt:en
ENV LC_ALL pt_BR.UTF-8

RUN locale-gen

RUN echo "America/Sao_Paulo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN mkdir -p /root/.composer

# Set working directory
WORKDIR /var/www