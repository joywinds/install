#! /bin/bash

version=1.3.1
node_exporter_version=node_exporter-${version}.linux-amd64
node_exporter_download_url=https://github.com/prometheus/node_exporter/releases/download/v${version}/${node_exporter_version}.tar.gz

wget -q ${node_exporter_download_url}
tar xzf ${node_exporter_version}.tar.gz

rsync ${node_exporter_version}/node_exporter /usr/local/bin

rm -rf ${node_exporter_version}.tar.gz ${node_exporter_version}

useradd --no-create-home --shell /bin/false node_exporter > /dev/null 2>&1

tee /etc/systemd/system/node_exporter.service > /dev/null <<EOT
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
Restart=always
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOT

systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter
