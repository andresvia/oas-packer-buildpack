FROM centos:7
ENV PACKER_DOWNLOAD_URL https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip
RUN yum install -y wget unzip && yum clean all
RUN cd /tmp && \
  wget -q $PACKER_DOWNLOAD_URL -Opacker.zip && \
  unzip packer.zip && \
  mkdir -p /usr/local/bin && \
  mv packer /usr/local/bin && \
  rm packer.zip
ENTRYPOINT [ "/usr/local/bin/packer", "--machine-readable" ]
