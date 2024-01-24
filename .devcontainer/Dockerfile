FROM mcr.microsoft.com/devcontainers/base:bullseye

RUN apt update -y && export DEBIAN_FRONTEND=noninteractive \
    && apt -y install --no-install-recommends \
    build-essential \
    curl \
    git \
    gnupg2 \
    lsb-release \
    python3 \
    python3-pip \
    python3-venv \
    sudo \
    unzip \
    wget \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*