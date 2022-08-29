#!/bin/bash

curl -L "http://cdn.joywinds.com/softwares/apm_exporter/apm_exporter-0.0.2.linux-amd64" -o /usr/local/bin/apm_exporter
chmod +x /usr/local/bin/apm_exporter

useradd --no-create-home --shell /bin/false apm_exporter > /dev/null 2>&1

tee /etc/systemd/system/apm_exporter.service > /dev/null <<EOT
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

systemctl daemon-reload
systemctl enable apm_exporter
systemctl start apm_exporter
