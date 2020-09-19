FROM mauro/conda

ARG USER

USER $USER:docker

RUN conda run -n docker pip install jovian jupyter numpy pandas matplotlib seaborn --upgrade --user
ENV PATH=/home/$USER/.local/bin:$PATH

WORKDIR /home/$USER/python