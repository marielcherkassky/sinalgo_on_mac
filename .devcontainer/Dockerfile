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

# Install Gradle 5.4.1
RUN wget https://services.gradle.org/distributions/gradle-5.4.1-bin.zip \
    && unzip gradle-5.4.1-bin.zip -d /opt \
    && ln -s /opt/gradle-5.4.1/bin/gradle /usr/bin/gradle \
    && rm gradle-5.4.1-bin.zip

# Create setup script
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh
