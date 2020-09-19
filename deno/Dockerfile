FROM mauro/ubuntu

ARG USER

# Download and install deno
RUN curl -fsSL https://deno.land/x/install/install.sh | sh

# Update PATH variable to include deno
ENV PATH=/home/mauro/.deno/bin:$PATH

# Install denon
RUN deno install --allow-read --allow-run --allow-write --allow-net -f -q --unstable https://deno.land/x/denon/denon.ts

WORKDIR /home/$USER

CMD [ "deno" ]