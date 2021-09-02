# ref) https://github.com/microsoft/vscode-remote-try-go/blob/master/.devcontainer/Dockerfile
FROM golang:1.17-buster
#
# set argument
ARG USER_NAME=vscode
ARG USER_ID=1000
ARG GROUP_NAME=$USER_NAME
ARG GROUP_ID=$USER_ID
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
RUN groupadd --gid $GROUP_ID $GROUP_NAME \
    && useradd -s /bin/bash --uid $USER_ID --gid $GROUP_ID -m $USER_NAME \
    && echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME \
    && chmod 0440 /etc/sudoers.d/$USER_NAME
#
# install Google Cloud SDK
USER $USER_NAME
RUN curl https://sdk.cloud.google.com > /tmp/install.sh \
    && bash /tmp/install.sh --disable-prompts \
    && echo "source /home/vscode/google-cloud-sdk/completion.bash.inc" >> /home/$USER_NAME/.bashrc \
    && echo "source /home/vscode/google-cloud-sdk/path.bash.inc" >> /home/$USER_NAME/.bashrc \
    # crean up
    && rm -f /tmp/install.sh
#
# set env
ENV DEBIAN_FRONTEND=dialog