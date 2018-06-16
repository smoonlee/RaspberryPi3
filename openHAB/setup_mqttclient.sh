echo "#                           #"
echo "# Mqtt Client Setup Script  #"
echo "#                           #"

echo "Running System Update"
echo

apt-get update -y & apt upgrade -y

echo
apt install wiringpi -y

echo
apt install wget -y

echo
apt install curl -y

echo
apt install git -y

echo
apt install mosquitto mosquitto-clients -y
systemctl enable mosquitto
systemctl start mosquitto

echo
mkdir /media/mqtt_setup

#GPOI Diag Tool - https://github.com/kgbplus/gpiotest
cd /media/mqtt_setup
wget https://raw.githubusercontent.com/kgbplus/gpiotest/master/gpiotest.py

# Configure Packages for Mqtt Led Controll
apt install python-pip -y
pip install paho-mqtt
cd /media/mqtt_setup
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/OpenHAB/mqtt-client/mqtt.gpiocontrol.py

# Configure Packegs for Mqtt Dht22 Senser
apt-get install build-essential python-dev python-openssl -y
cd /media/mqtt_setup

echo
git clone https://github.com/adafruit/Adafruit_Python_DHT.git
cd Adafruit_Python_DHT
python setup.py install

echo
cd /media/mqtt_setup
https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/OpenHAB/mqtt-client/mqtt.dht22sensor.py

# Install Raspotify Connecter
echo
curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

# Pull Example Setup Files from GitHub
echo
cd /media/mqtt_setup
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/OpenHAB/mqtt-client/openhab_led_example
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/OpenHAB/mqtt-client/openhab_dht22_example

