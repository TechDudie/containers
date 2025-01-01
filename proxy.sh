sudo apt update
sudo apt install microsocks ufw -y
echo Allowing 22/tcp
sudo ufw allow 22/tcp
echo Allowing 22/udp
sudo ufw allow 22/udp
echo Allowing 1080/tcp
sudo ufw allow 1080/tcp
echo Allowing 1080/udp
sudo ufw allow 1080/udp
echo Enabling ufw service
sudo ufw --force enable

echo Creating system service /etc/systemd/system/proxy.service
sudo tee -a /etc/systemd/system/proxy.service > /dev/null <<EOF
[Unit]
Description=microsocks socks5://0.0.0.0:1080
Documentation=https://github.com/rofl0r/microsocks
After=network.target

[Service]
Type=simple
Restart=always
ExecStart=microsocks

[Install]
WantedBy=multi-user.target
EOF

echo Enabling system service
systemctl start proxy.service
sudo systemctl enable proxy.service
echo Done!