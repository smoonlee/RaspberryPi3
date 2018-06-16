echo "#                           #"
echo "# Mqtt Client Setup Script  #"
echo "#                           #"

echo "Running System Update"
echo

apt update -y & apt dist-upgrade -y
apt update -y & apt upgrade -y

echo
apt install wget -y

echo
apt install curl -y

echo
apt install git -y

echo 
apt-get install build-essential python-dev python-openssl -y

echo 
apt install python-pip -y
pip install paho-mqtt -y

echo
apt install mosquitto mosquitto-clients -y
systemctl enable mosquitto
systemctl start mosquitto

echo
mkdir /media/mqtt_setup

# Pull Files from GitHub to Local Device
cd /media
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt.remote_command.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/remote_services.conf

# Pull Service Files From GitHub to Local Device
cd /etc/systemd/system
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.remote_command.service
systemctl enable mqtt.remote_command
