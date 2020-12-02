FROM php:7.4-fpm

ARG USER_ID
ARG GROUP_ID
ARG USER
ARG SSHPRI
ARG SSHPUB
ARG GITGLO

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
    libonig-dev \
    nodejs \
    npm

# RUN apt-get update && apt-get install -y php7.3-curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

# RUN docker-php-ext-configure curl --with-curl=/usr/local/lib
# RUN docker-php-ext-install curl

RUN pecl install mongodb
RUN pecl install xdebug
COPY ./local.ini /usr/local/etc/php/conf.d/local.ini

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

# Install laravel installer
RUN composer global require laravel/installer
ENV PATH=/home/mauro/.composer/vendor/bin:$PATH

WORKDIR /home/${USER}

RUN mkdir /home/$USER/.ssh
RUN echo "$SSHPRI" > /home/$USER/.ssh/id_rsa
RUN echo "$SSHPUB" > /home/$USER/.ssh/id_rsa.pub
RUN echo "$GITGLO" > /home/$USER/.gitconfig
RUN echo “StrictHostKeyChecking no “ > /home/$USER/.ssh/config

# Expose port 9000 and start php-fpm server


#Install oh-my-bash
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

EXPOSE 9000
CMD ["php-fpm"]