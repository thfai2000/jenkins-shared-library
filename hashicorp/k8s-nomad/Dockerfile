# Use a SUSE base image
FROM registry.suse.com/suse/sle15:15.6

ENV TZ=Asia/Hong_Kong
# Set environment variables to prevent prompts during installation
ENV ZYPPER_NOSERVICE=true

# Update the package index and install Podman
RUN zypper refresh && \
    zypper install -y podman unzip curl sudo && \
    zypper clean --all


RUN mkdir -p /opt/nomad/plugins

WORKDIR  /tmp/nomad/

RUN  curl -fsSL https://releases.hashicorp.com/nomad/1.9.3/nomad_1.9.3_linux_amd64.zip -o nomad.zip && \
    unzip nomad.zip && \
    mv nomad /usr/local/bin/ && \
    chmod +x /usr/local/bin/nomad && \
    rm nomad.zip

WORKDIR  /tmp/nomad-driver-podman/

RUN curl -fsSL https://releases.hashicorp.com/nomad-driver-podman/0.6.1/nomad-driver-podman_0.6.1_linux_amd64.zip -o nomad-driver-podman.zip && \
    unzip nomad-driver-podman.zip && \
    mv nomad-driver-podman /opt/nomad/plugins/ && \
    rm nomad-driver-podman.zip

RUN mkdir -p /opt/nomad/data
RUN mkdir -p /opt/nomad/log

WORKDIR /opt/nomad

RUN useradd --system --no-create-home nobody

# RUN chown -R nomad /opt/nomad

COPY start-up.sh .