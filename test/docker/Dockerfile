# WITHOUT DOCKERFILE:
# docker run -dit -p 8080:80 --name apache-server -v ${PWD}:/usr/local/apache2/htdocs/ httpd:2.4

# WITH DOCKERFILE:
# docker build -t custom-apache-image .
# docker run -dit -p 8080:80 --name apache-server httpd:2.4


FROM php:7.4-apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
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

# 2. set up document root for apache
COPY ./projects/admin/docker/000-default.conf /etc/apache2/sites-available/

# 3. mod_rewrite for URL rewrite and mod_headers for .htaccess extra headers like Access-Control-Allow-Origin-
RUN a2enmod rewrite headers

# 4. start with base php config, then add extensions
RUN mv ${PHP_INI_DIR}/php.ini-development ${PHP_INI_DIR}/php.ini

COPY ./test/public-html /var/www/html/public

ARG uid
RUN useradd -G www-data,root -u ${uid} -d /home/devuser devuser
RUN mkdir -p /home/devuser/.composer && \
    chown -R devuser:devuser /home/devuser

EXPOSE 8080