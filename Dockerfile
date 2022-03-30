# --------------------------
# machinelearning-one/devel
# --------------------------

# Set the base image
# -------------------
FROM ubuntu:20.04

# Define required arguments
# --------------------------
ARG AUTHOR
ARG EMAIL
ARG USERNAME
ARG PASSWORD

# Define commands for headless installation
# ------------------------------------------
ENV DEBIAN_FRONTEND=noninteractive
ENV APT_INSTALL="apt install -y --no-install-recommends"
ENV PIP_INSTALL="python -m pip --no-cache-dir install --upgrade"

# Setup the locale
# -----------------
RUN apt update && \
    $APT_INSTALL locales-all
ENV LANG "en_US.UTF-8" \
    LANGUAGE "en_US.UTF-8" \
    LC_ALL "en_US.UTF-8"

# Install basic utilities
# ------------------------
RUN apt update && \
    $APT_INSTALL \
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
    unrar

# Install python 3.8 and pip
# ---------------------------
RUN apt update && \
    $APT_INSTALL \
    python3.8 \
    python3.8-dev \
    python3.8-distutils \
    && \
    wget -O ~/get-pip.py \
    https://bootstrap.pypa.io/get-pip.py && \
    python3.8 ~/get-pip.py && \
    ln -s /usr/bin/python3.8 /usr/local/bin/python
ENV PATH=$PATH:~/.local/bin

# Install numfocus and allied packages
# -------------------------------------
RUN $PIP_INSTALL \
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
# ------------------------------------
RUN $PIP_INSTALL \
    torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113 && \
    $PIP_INSTALL \
    einops \
    pytorch-lightning \
    hydra-core

# Install jupyterlab
# -------------------
RUN $PIP_INSTALL \
    jupyterlab

# Install opencv
# ---------------
RUN apt update && \
    $APT_INSTALL \
    libopencv-dev python3-opencv

# Perform cleanup
# ---------------
RUN ldconfig && \
    apt clean && \
    apt autoremove && \
    rm -rf -- /var/lib/apt/lists/* /tmp/* ~/*

# Create the user and set the password
# -------------------------------------
RUN useradd -m -s /bin/bash -p $(openssl passwd -1 $PASSWORD) $USERNAME

# Add the user to the sudo group
# -------------------------------
RUN usermod -aG sudo $USERNAME

# Configure git
# --------------
RUN git config --global user.name "$AUTHOR" && \
    git config --global user.email "$EMAIL"

# Set the default user and working directory
# -------------------------------------------
USER $USERNAME
WORKDIR /home/$USERNAME