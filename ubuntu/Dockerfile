FROM ubuntu

ARG USER_ID
ARG GROUP_ID
ARG USER

# Install dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    zip \
    nano \
    unzip \
    git \
    curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)";
# SHELL ["/bin/bash", "--login", "-c"]

# Add user group docker
RUN addgroup --gid ${GROUP_ID} docker

# Add new user,
# no password, no iteractive, given user id, given group id,
# create home at given location, given username
RUN adduser \
    --disabled-password \
    --gecos '' \
    --uid $USER_ID \
    --gid $GROUP_ID \
    --home "/home/${USER}" \
    $USER

RUN echo "${USER}     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/${USER}
RUN chown $USER:docker /home/$USER

USER ${USER}:docker