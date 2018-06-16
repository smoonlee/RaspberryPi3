# Following code is tested with Raspberry Pi 3
# Import the Libraries Required
import RPi.GPIO as GPIO
from time import sleep

SERVO_PIN = 22

if __name__ == '__main__':
	# Setting the GPIO Mode to BOARD => Pin Count Mapping
	GPIO.setmode(GPIO.BOARD)

	# Setting the GPIO Mode to BCM => GPIO Mapping
	# Uncomment below line for to use GPIO number
	# GPIO.setmode(GPIO.BCM)

	# Setting the GPIO 18 as PWM Output
	GPIO.setup(SERVO_PIN,GPIO.OUT)

	# Disable the warning from the GPIO Library
	GPIO.setwarnings(False)

	# Starting the PWM and setting the initial position of the servo with 50Hz frequency
	servo = GPIO.PWM(SERVO_PIN,50)
	servo.start(0)
	while True:
		try:
			# Changing the Duty Cycle to rotate the motor
			servo.ChangeDutyCycle(12.6)
   			# Sleep for 5 Seconds
		        sleep(2)
			servo.ChangeDutyCycle(2.4)
			#time.sleep(2)
			#servo.ChangeDutyCycle(2.5)
			#time.sleep(2)

		except KeyboardInterrupt:
			servo.stop()
			GPIO.cleanup()
# End of the Script
