sudo apt update
sudo apt install ufw -y
sudo ufw --force enable
sudo ufw allow 9100/tcp
sudo useradd -rs /bin/false node_exporter
cd ~
wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
tar -xvf node_exporter-1.9.1.linux-amd64.tar.gz
cd node_exporter-1.9.1.linux-amd64
sudo mv node_exporter /usr/local/bin/

cat <<EOF | sudo tee /etc/systemd/system/node_exporter.service
[Unit]
Description=node_exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
