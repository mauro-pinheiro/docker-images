FROM php:7.2-fpm

ARG USER_ID
ARG GROUP_ID
ARG USER
ARG GIT_APP_KEY=C99B11DEB97541F0

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="America/São Paulo"

# Install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
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
    gnupg \
    nodejs \
    npm

# RUN apt-get update && apt-get install -y php7.3-curl

RUN APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key $GIT_APP_KEY && \
    apt-add-repository https://cli.github.com/packages && \
    apt update && \
    apt install gh

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd

# RUN docker-php-ext-configure curl --with-curl=/usr/local/lib
# RUN docker-php-ext-install curl

# RUN pecl install xdebug

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

#Install oh-my-bash
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# WORKDIR /home/${USER}

# COPY ./local.ini /usr/local/etc/php/conf.d/local.ini

# Expose port 9000 and start php-fpm server

EXPOSE 9000
CMD ["php-fpm"]