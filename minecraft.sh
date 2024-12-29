mkdir ~/minecraft
cd ~/minecraft

printf 'Do you agree to the Minecraft EULA (https://www.minecraft.net/eula)? [Y/N] '
read answer

if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "eula=true" > eula.txt
else
    exit
fi

sudo apt-get update
sudo apt-get install git openjdk-17-jre-headless -y

mkdir build
cd build
curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -jar BuildTools.jar --rev latest --final-name server.jar
mv server.jar ..
rm -rf build

echo Creating system service /etc/systemd/system/minecraft.service
sudo tee -a /etc/systemd/system/minecraft.service > /dev/null <<EOF
[Unit]
Description=minecraft server (spigot)

[Service]
Type=simple
Restart=on-failure
WorkingDirectory=/home/$(whoami)/minecraft
ExecStart=java -DIReallyKnowWhatIAmDoingISwear -jar server.jar

[Install]
WantedBy=multi-user.target
EOF

echo Enabling system service
sudo systemctl start minecraft.service
sudo systemctl enable minecraft.service
echo Done!