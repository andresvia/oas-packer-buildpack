FROM alpine:3.4
ENV PACKER_DOWNLOAD_URL https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip
WORKDIR /usr/local/bin
ADD $PACKER_DOWNLOAD_URL packer.zip
RUN unzip packer.zip
RUN rm packer.zip
WORKDIR /
