echo "#                           #"
echo "# Mqtt Client Setup Script  #"
echo "#                           #"

echo "Running System Update"
echo


apt update -y & apt dist-upgrade -y
apt update -y & apt upgrade -y

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
cd /media
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt.remote_command.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/remote_services.conf
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/dht22_output.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt.dht22.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt.relay_1.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt.relay_2.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt.relay_3.py

# Pull Files from GitHub to Local Device
cd /media/mqtt_setup
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt_setup/gpiotest.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt_setup/mqtt.dhtsensor.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt_setup/mqtt.gpiocontrol.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt_setup/mqtt-launcher.py
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/media/mqtt_setup/launcher.conf

# Pull Service Files From GitHub to Local Device
cd /etc/systemd/system
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.remote_command.service
systemctl enable mqtt.remote_command
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.dht22.service
systemctl enable mqtt.dht22
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.leds.service #maybe change to mqtt.lights
systemctl enable mqtt.leds
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.relay_1.service
systemctl enable mqtt.relay_1
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.relay_2.service
systemctl enable mqtt.relay_2
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.relay_3.service
systemctl enable mqtt.relay_3
wget https://github.com/smoonlee/RaspberryPi3/blob/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.relay_4.service
systemctl enable mqtt.relay_4

# Setup Raspotify Connector
echo
curl -sL https://dtcooper.github.io/raspotify/install.sh | sh
cd /etc/default 
rm raspotify
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/default/raspotify
service raspotify restart