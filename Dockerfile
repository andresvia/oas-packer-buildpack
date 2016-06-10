FROM centos:7
ENV PACKER_DOWNLOAD_URL https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip
ENV JQ_DOWNLOAD_URL https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
ENV AWS_DOWNLOAD_URL https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
WORKDIR /tmp
RUN yum update -y && yum install -y wget unzip && yum clean all
RUN wget -q $PACKER_DOWNLOAD_URL -Opacker.zip
RUN wget -q $JQ_DOWNLOAD_URL $AWS_DOWNLOAD_URL
RUN unzip packer.zip
RUN mv packer /usr/local/bin
RUN rm packer.zip
RUN chmod +x jq-linux64
RUN mv jq-linux64 /usr/local/bin/jq
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN rm -r awscli-bundle/ awscli-bundle.zip
WORKDIR /
