FROM debian:buster-slim
#
# set argument
ARG USER_NAME=vscode
ARG USER_UID=1000
ARG GROUP_NAME=$USER_NAME
ARG GROUP_GID=$USER_UID
#
# install packages and tools
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    # install debian packages
    && apt-get install -y \
        apt-utils \
        dialog \
        git \
        iproute2 \
        procps \
        lsb-release \
        sudo \
        zip \
        make \
    # crean up
    && apt-get autoremove -y \
    && apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/*
#
# create noroot user
RUN groupadd --gid $GROUP_GID $GROUP_NAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $GROUP_NAME -m $USER_NAME \
    && echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME \
    && chmod 0440 /etc/sudoers.d/$USER_NAME
#
# set env
ENV DEBIAN_FRONTEND=dialog
