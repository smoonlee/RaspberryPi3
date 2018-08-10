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
pip install rpi.gpio

echo 
apt install python-pip -y
pip install paho-mqtt
pip install requests 

echo
apt install mosquitto mosquitto-clients -y
systemctl enable mosquitto
systemctl start mosquitto

echo
mkdir /mqtt_client
mkdir /mqtt_client 
cd /mqtt_client/mqtt_setup
git clone https://github.com/adafruit/Adafruit_Python_DHT.git
cd Adafruit_Python_DHT
sudo python setup.py install

# Setup Raspotify Connector
echo

# Install curl and https apt transport
sudo apt-get -y install curl apt-transport-https

# Add repo and its GPG key
curl -sSL https://dtcooper.github.io/raspotify/key.asc | sudo apt-key add -v -
echo 'deb https://dtcooper.github.io/raspotify jessie main' | sudo tee /etc/apt/sources.list.d/raspotify.list

# Install package
sudo apt-get update
sudo apt-get -y install raspotify

cd /etc/default 
rm raspotify
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/default/raspotify
service raspotify restart

# install alsa mixer controls if missing [OSMC]
echo
apt-get install alsa-utils
