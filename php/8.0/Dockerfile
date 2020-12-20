FROM php:8-fpm

ARG USER_ID
ARG GROUP_ID
ARG USER

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="America/São Paulo"

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
    libonig-dev
    
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y nodejs

# RUN apt-get update && apt-get install -y php7.3-curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

# RUN docker-php-ext-configure curl --with-curl=/usr/local/lib
# RUN docker-php-ext-install curl

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
ENV PATH=/home/USER/.config/composer/vendor/bin

WORKDIR /home/${USER}

#Install oh-my-bash
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
