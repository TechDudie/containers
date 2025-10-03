sudo apt update
sudo apt install microsocks ufw -y
sudo ufw allow 22/tcp
sudo ufw allow 24167/tcp
sudo ufw --force enable

echo Creating system service /etc/systemd/system/proxy.service
sudo tee -a /etc/systemd/system/proxy.service > /dev/null <<EOF
[Unit]
Description=microsocks socks5://0.0.0.0:24167
Documentation=https://github.com/rofl0r/microsocks
After=network.target

[Service]
Type=simple
Restart=always
ExecStart=microsocks -p 24167

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable proxy.service
sudo systemctl start proxy.service
