# ref) https://github.com/microsoft/vscode-remote-try-go/blob/master/.devcontainer/Dockerfile
FROM golang:1.15-buster
#
# set argument
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
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
    # crean up
    && apt-get autoremove -y \
    && apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/*
#
# create noroot user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
#
# install Google Cloud SDK
USER $USERNAME
RUN curl https://sdk.cloud.google.com > /tmp/install.sh \
    && bash /tmp/install.sh --disable-prompts \
    && echo "source /home/vscode/google-cloud-sdk/completion.bash.inc" >> /home/$USERNAME/.bashrc \
    && echo "source /home/vscode/google-cloud-sdk/path.bash.inc" >> /home/$USERNAME/.bashrc \
    # crean up
    && rm -f /tmp/install.sh
#
# set env
ENV GO111MODULE=on
ENV DEBIAN_FRONTEND=dialog