FROM golang:1.17-bullseye
#
# set argument
ARG USER_NAME=kumano_ryo
ARG USER_ID=501
ARG GROUP_NAME=$USER_NAME
ARG GROUP_ID=$USER_ID
#
# install packages and tools
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    # install debian packages
    && apt-get install -y \
        git \
        lsb-release \
        sudo \
        make \
        peco \
        fish \
    # crean up
    && apt-get autoremove -y \
    && apt-get clean -y \
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