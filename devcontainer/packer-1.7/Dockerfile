FROM debian:bullseye-slim
#
# set argument
ARG USER_NAME=vscode
ARG USER_ID=501
ARG GROUP_NAME=$USER_NAME
ARG GROUP_ID=$USER_ID
ARG PACKER_VERSION=1.7
#
# install packages and tools
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update \
    # install debian packages
    && apt install -y \
        git \
        lsb-release \
        sudo \
        curl \
        gnupg \
        make \
        peco \
        fish \
#
# Add HashiCorp Linux repository and install packer.
    && curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
    && echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hachicorp.list \
    && apt update \
    && apt install -y \
        packer=$PACKER_VERSION'.*' \
    # crean up
    && apt autoremove -y \
    && apt clean -y \
	&& rm -rf /var/lib/apt/lists/*
#
# create noroot user
RUN groupadd --gid $GROUP_ID $GROUP_NAME \
    && useradd -s $(which fish) --uid $USER_ID --gid $GROUP_ID -m $USER_NAME \
    && echo $USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER_NAME \
    && chmod 0440 /etc/sudoers.d/$USER_NAME
#
# install Google Cloud SDK
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
    && sudo apt-get update && sudo apt-get install google-cloud-sdk
#
# isntall fisher
USER $USER_NAME
SHELL ["fish", "-c"]
RUN curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# insetall my fish plugin
RUN fisher install kumanoryo/peco_select_gce_ssh
RUN fisher install kumanoryo/peco_select_gcp_project
#
# set env
ENV DEBIAN_FRONTEND=dialog