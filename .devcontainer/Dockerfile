FROM debian:bullseye

# Set env vars
ENV LANG=C.UTF-8

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    openjdk-11-jdk \
    git \
    bash \
    wget \
    libxext-dev \
    libxrender-dev \
    libxtst-dev \
    libxi6 \
    x11-apps \
    xauth \
    x11-xserver-utils \
    socat \
    && apt-get clean


# Create setup script
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh
