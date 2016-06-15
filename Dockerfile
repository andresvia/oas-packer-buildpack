FROM centos:7
ENV PACKER_DOWNLOAD_URL https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip
ENV JQ_DOWNLOAD_URL https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
ENV AWS_DOWNLOAD_URL https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
RUN yum install -y wget unzip && yum clean all
RUN cd /tmp && \
  wget -q $PACKER_DOWNLOAD_URL -Opacker.zip && \
  wget -q $JQ_DOWNLOAD_URL $AWS_DOWNLOAD_URL && \
  unzip packer.zip && \
  mv packer /usr/local/bin && \
  chmod +x jq-linux64 && \
  mv jq-linux64 /usr/local/bin/jq && \
  unzip awscli-bundle.zip && \
  ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
  rm -r awscli-bundle/ awscli-bundle.zip packer.zip
