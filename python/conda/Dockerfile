FROM mauro/ubuntu

ARG USER

RUN curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash ./Miniconda3-latest-Linux-x86_64.sh -b

ENV PATH=/home/mauro/miniconda3/bin:$PATH

RUN conda update -n base -c defaults conda

RUN conda create -n docker -y python=3.8

USER $USER:docker
WORKDIR /home/$USER/python