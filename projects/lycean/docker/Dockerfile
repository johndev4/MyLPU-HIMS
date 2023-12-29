FROM php:8.0-apache
RUN apt-get update
RUN apt-get install -y \
    git \
    zip \
    curl \
    sudo \
    unzip \
    libicu-dev \
    libbz2-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    g++
RUN docker-php-ext-install \
    bz2 \
    intl \
    bcmath \
    opcache \
    calendar \
    pdo_mysql \
    mysqli
COPY projects/lycean/docker/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY projects/lycean/public/ /var/www/html/public/
COPY projects/lycean/ /var/www/html/
COPY projects/vendor/ /var/www/vendor/
RUN mv "$PHP_INI_DIR"/php.ini-development "$PHP_INI_DIR"/php.ini
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN echo "DocumentRoot \"/var/www/html/public\"" >> /etc/apache2/apache2.conf
RUN a2enmod rewrite
# we need a user with the same UID/GID with host user
# so when we execute CLI commands, all the host file's ownership remains intact
# otherwise command from inside container will create root-owned files and directories
ARG uid
RUN useradd -G www-data,root -u "$uid" -d /home/devuser devuser
RUN mkdir -p /home/devuser/.composer && \
    chown -R devuser:devuser /home/devuser

# EXPOSE 8082