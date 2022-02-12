FROM kumanoryo/fish:latest
#
# set argument
ARG TERRAFORM_VERSION=1.1.*
#
# Add HashiCorp Linux repository and install terraform.
USER root
SHELL ["/bin/bash", "-c"]
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
    && echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hachicorp.list \
    && apt-get update \
    && apt-get install -y \
        terraform=$TERRAFORM_VERSION \
    # crean up
    && apt-get autoremove -y \
    && apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/*
#
# set env
ENV DEBIAN_FRONTEND=dialog