sudo apt update

echo Creating system service /etc/systemd/system/fan.service
sudo tee -a /etc/systemd/system/fan.service > /dev/null <<EOF
[Unit]
Description=pinctrl FAN_PWM op dl

[Service]
Type=simple
Restart=on-failure
ExecStart=pinctrl FAN_PWM op dl

[Install]
WantedBy=multi-user.target
EOF

echo Enabling system service
sudo systemctl start fan.service
sudo systemctl enable fan.service
echo Done!