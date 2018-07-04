# Pull Files from GitHub to Local Device
cd /mqtt_client
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/mqtt.remote_command.py
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/remote_services.conf
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/dht22_output.py
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/mqtt.dht22.py
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/mqtt.relay0_1.py
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/mqtt.relay0_2.py
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/mqtt.relay0_3.py
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/mqtt.relay0_4.py

# Pull Files from GitHub to Local Device
cd /mqtt_client/mqtt_setup
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/mqtt_setup/gpiotest.py
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/mqtt_setup/mqtt.dhtsensor.py
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/mqtt_setup/mqtt.gpiocontrol.py
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/mqtt_setup/mqtt-launcher.py
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/media/mqtt_setup/launcher.conf

# Pull Service Files From GitHub to Local Device
cd /etc/systemd/system
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.remote_command.service
systemctl enable mqtt.remote_command
systemctl start mqtt.remote_command
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.dht22.service
systemctl enable mqtt.dht22
systemctl start mqtt.dht22
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.leds.service #maybe change to mqtt.lights
systemctl enable mqtt.leds
systemctl start mqtt.leds
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.relay0_1.service
systemctl enable mqtt.relay0_1
systemctl start mqtt.relay0_1
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.relay0_2.service
systemctl enable mqtt.relay0_2
systemctl start mqtt.relay0_2
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.relay0_3.service
systemctl enable mqtt.relay0_3
systemctl start mqtt.relay0_3
wget https://raw.githubusercontent.com/smoonlee/RaspberryPi3/master/openHAB/openhab-mqttclient/etc/systemd/system/mqtt.relay0_4.service
systemctl enable mqtt.relay0_4
systemctl start mqtt.relay0_4
