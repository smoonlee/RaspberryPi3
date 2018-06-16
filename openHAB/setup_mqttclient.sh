echo "#                           #"
echo "# Mqtt Client Setup Script  #"
echo "#                           #"

echo "Running System Update"
echo

apt update -y & apt dist-upgrade -y

echo
apt install wiringpi -y

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
cd /media/mqtt_setup
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt_setup/gpiotest.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt_setup/mqtt.dhtsensor.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt_setup/mqtt.gpiocontrol.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt_setup/mqtt-launcher.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt_setup/launcher.conf

# Pull Service Files From GitHub to Local Device
cd /etc/systemd/system
wget 
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.bedroom.dht22.service
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.bedroom.leds.service
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.bedroom.relay_1.service
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.bedroom.relay_2.service
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.bedroom.relay_3.service
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.bedroom.relay_4.service

# Setup Raspotify Connector
echo
curl -sL https://dtcooper.github.io/raspotify/install.sh | sh
cd /etc/default 
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/default/raspotify
service raspotify restart