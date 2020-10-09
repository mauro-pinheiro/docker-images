FROM mauro/conda

ARG USER

USER $USER:docker

RUN conda run -n docker pip install jupyter numpy pandas matplotlib seaborn scipy scikit-learn sklearn --upgrade --user
ENV PATH=/home/$USER/.local/bin:$PATH

WORKDIR /home/$USER/python