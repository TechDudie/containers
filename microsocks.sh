sudo apt update
sudo apt install microsocks -y
sudo apt install ufw -y
echo Allowing 22/tcp
sudo ufw allow 22/tcp
echo Allowing 22/udp
sudo ufw allow 22/udp
echo Allowing 1080/tcp
sudo ufw allow 1080/tcp
echo Allowing 1080/udp
sudo ufw allow 1080/udp

echo Creating system service /etc/systemd/system/microsocks.service
sudo tee -a /etc/systemd/system/microsocks.service > /dev/null <<EOF
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
sudo systemctl enable microsocks.service
sudo reboot