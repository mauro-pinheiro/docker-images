FROM php:7.3-fpm

ARG USER_ID
ARG GROUP_ID
ARG USER
ARG SSHPRI
ARG SSHPUB
ARG GITGLO

COPY ./php/local.ini /usr/local/etc/php/conf.d/local.ini

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libssl-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    libzip-dev \
    jpegoptim optipng pngquant gifsicle \
    nano \
    unzip \
    git \
    curl \
    # php-curl \
    nodejs \
    npm

# RUN apt-get update && apt-get install -y php7.3-curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd

# RUN docker-php-ext-configure curl --with-curl=/usr/local/lib
# RUN docker-php-ext-install curl

RUN pecl install mongodb
RUN pecl install xdebug

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN addgroup --gid ${GROUP_ID} docker
RUN adduser \
    --disabled-password \
    --gecos '' \
    --uid $USER_ID \
    --gid $GROUP_ID \
    --home "/home/${USER}" \
    $USER

USER ${USER}:docker
WORKDIR /home/${USER}

RUN mkdir /home/$USER/.ssh
RUN echo "$SSHPRI" > /home/$USER/.ssh/id_rsa
RUN echo "$SSHPUB" > /home/$USER/.ssh/id_rsa.pub
RUN echo "$GITGLO" > /home/$USER/.gitconfig

# Expose port 9000 and start php-fpm server


EXPOSE 9000
CMD ["php-fpm"]