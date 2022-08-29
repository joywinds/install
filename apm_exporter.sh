#!/bin/bash

sudo curl -L "http://cdn.joywinds.com/softwares/apm_exporter/apm_exporter-0.0.2.linux-amd64" -o /usr/local/bin/apm_exporter
sudo chmod +x /usr/local/bin/apm_exporter

sudo useradd --no-create-home --shell /bin/false apm_exporter > /dev/null 2>&1

sudo tee /etc/systemd/system/apm_exporter.service > /dev/null <<EOT
[Unit]
Description=APM Exporter
After=network.target

[Service]
Type=simple
User=apm_exporter
ExecStart=/usr/local/bin/apm_exporter
Restart=always

[Install]
WantedBy=multi-user.target
EOT

sudo systemctl daemon-reload
sudo systemctl enable apm_exporter
sudo systemctl start apm_exporter
