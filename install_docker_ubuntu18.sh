#!/bin/bash

wget -q https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_20.10.14~3-0~ubuntu-bionic_amd64.deb
wget -q https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-cli_20.10.14~3-0~ubuntu-bionic_amd64.deb
wget -q https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/containerd.io_1.5.11-1_amd64.deb
wget -q https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-compose-plugin_2.3.3~ubuntu-bionic_amd64.deb

dpkg -i docker-ce-cli_20.10.14~3-0~ubuntu-bionic_amd64.deb
dpkg -i containerd.io_1.5.11-1_amd64.deb
dpkg -i docker-ce_20.10.14~3-0~ubuntu-bionic_amd64.deb
dpkg -i docker-compose-plugin_2.3.3~ubuntu-bionic_amd64.deb

rm docker-ce-cli_20.10.14~3-0~ubuntu-bionic_amd64.deb
rm containerd.io_1.5.11-1_amd64.deb
rm docker-ce_20.10.14~3-0~ubuntu-bionic_amd64.deb
rm docker-compose-plugin_2.3.3~ubuntu-bionic_amd64.deb

curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
