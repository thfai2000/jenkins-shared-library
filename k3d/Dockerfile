# Use openSUSE as the base image
FROM opensuse/leap:15.6

# Install JDK and the required toolset
RUN zypper refresh && \
    zypper install -y \
    java-17-openjdk \
    bash-completion \
    vim \
    less \
    man \
    jq \
    lsof \
    tree \
    psmisc \
    iputils \
    net-tools \
    bind-utils \
    iproute2 \
    iptables \
    nmap \
    ncat \
    socat \
    curl \
    wget \
    p7zip \
    sudo \
    git \
    maven && \
    zypper clean -a

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib64/jvm/java-17-openjdk

# Set PATH to include JAVA_HOME
ENV PATH=$PATH:$JAVA_HOME/bin

# Default command
CMD ["tail", "-f", "/dev/null"]
