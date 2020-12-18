FROM ubuntu

# ARG USER_ID
# ARG GROUP_ID
# ARG USER
ARG GIT_APP_KEY=C99B11DEB97541F0

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="America/São Paulo"

# Install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    sudo \
    zip \
    nano \
    unzip \
    git \
    curl \
    gnupg

RUN APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key $GIT_APP_KEY && \
    apt-add-repository https://cli.github.com/packages && \
    apt update && \
    apt install gh

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Add user group docker
# RUN addgroup --gid ${GROUP_ID} docker

# # Add new user,
# # no password, no iteractive, given user id, given group id,
# # create home at given location, given username
# RUN adduser \
#     --disabled-password \
#     --gecos '' \
#     --uid $USER_ID \
#     --gid $GROUP_ID \
#     --home "/home/${USER}" \
#     $USER

# RUN echo "${USER}     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# WORKDIR /home/${USER}
# RUN chown $USER:docker /home/$USER

# USER ${USER}:docker

#Install oh-my-bash
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"