FROM ubuntu:20.04
ARG AUTHOR
ARG EMAIL
ARG USERNAME
ARG PASSWORD
# Setup the locale
RUN APT_INSTALL="apt install -y --no-install-recommends" && \
    apt update && \
    # Install the locales
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL locales-all
ENV LANG "en_US.UTF-8" \
    LANGUAGE "en_US.UTF-8" \
    LC_ALL "en_US.UTF-8"
# Install the basic utilities and python
RUN APT_INSTALL="apt install -y --no-install-recommends" && \
    apt update && \
    # Install the base packages
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    sudo \
    build-essential \
    cmake \
    apt-utils \
    apt-transport-https \
    software-properties-common \
    ca-certificates \
    wget \
    curl \
    git \
    vim \
    libssl-dev \
    unzip \
    unrar && \
    # Install python 3.8 and pip
    apt update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    python3.8 \
    python3.8-dev \
    python3.8-distutils \
    && \
    wget -O ~/get-pip.py \
    https://bootstrap.pypa.io/get-pip.py && \
    python3.8 ~/get-pip.py && \
    ln -s /usr/bin/python3.8 /usr/local/bin/python
ENV PATH=$PATH:~/.local/bin
# Install core python packages
RUN PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    $PIP_INSTALL \
    numpy \
    scipy \
    pandas \
    scikit-image \
    scikit-learn \
    matplotlib \
    seaborn \
    Cython \
    tqdm \
    typing
# Install pytorch and allied packages
RUN PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    $PIP_INSTALL \
    torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0+cu113 -f \
    https://download.pytorch.org/whl/cu113/torch_stable.html && \
    $PIP_INSTALL \
    einops \
    pytorch-lightning \
    hydra-core
# Install jupyterlab
RUN PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    $PIP_INSTALL \
    jupyterlab
# Install opencv
RUN APT_INSTALL="apt install -y --no-install-recommends" && \
    apt update && \
    # Install the base packages
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
    libopencv-dev python3-opencv
# Cleanup and Add the user
RUN ldconfig && \
    apt clean && \
    apt autoremove && \
    rm -rf -- /var/lib/apt/lists/* /tmp/* ~/* && \
    # Create a user named USERNAME and set the password to PASSWORD
    useradd -m -s /bin/bash -p $(openssl passwd -1 $PASSWORD) $USERNAME && \
    # Add the user to the sudo group
    usermod -aG sudo $USERNAME && \
    git config --global user.name "$AUTHOR" && \
    git config --global user.email "$EMAIL"
USER $USERNAME
WORKDIR /home/$USERNAME