FROM kumanoryo/fish:latest
#
# set argument
ARG PACKER_VERSION=1.7
#
# install packages and tools
ENV DEBIAN_FRONTEND=noninteractive
# Add HashiCorp Linux repository and install packer.
USER root
SHELL ["/bin/bash", "-c"]
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
    && echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hachicorp.list \
    && apt update \
    && apt install -y \
        packer=$PACKER_VERSION'.*' \
    # crean up
    && apt autoremove -y \
    && apt clean -y \
	&& rm -rf /var/lib/apt/lists/*
#
# set env
ENV DEBIAN_FRONTEND=dialog