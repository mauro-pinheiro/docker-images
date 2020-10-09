FROM ubuntu

ARG USER_ID
ARG GROUP_ID
ARG USER
ARG SSHPRI
ARG SSHPUB
ARG GITGLO

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

RUN mkdir /home/$USER/.ssh
RUN echo "$SSHPRI" > /home/$USER/.ssh/id_rsa
RUN echo "$SSHPUB" > /home/$USER/.ssh/id_rsa.pub
RUN echo "$GITGLO" > /home/$USER/.gitconfig
RUN echo “StrictHostKeyChecking no “ > /home/$USER/.ssh/config

#Install oh-my-bash
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

USER ${USER}:docker