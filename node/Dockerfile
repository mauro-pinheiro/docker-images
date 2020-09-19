FROM mauro/ubuntu

ARG USER

USER root

# Install node
RUN curl -sL https://deb.nodesource.com/setup_current.x | bash -
RUN apt-get install -y nodejs

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install global dev dependencies
RUN npm install --save-dev --global typescript nodemon jest

USER $USER
WORKDIR /home/${USER}

CMD [ "node" ]