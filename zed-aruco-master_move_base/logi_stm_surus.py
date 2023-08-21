#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Joy
import time
import serial


def joy_cb(data):
	#$0.2,-0.8;

	msg = "$" + str(data.axes[1]) + "," + str(data.axes[0]) + ";"
	print(msg)
	ser.write(msg.encode())

rospy.init_node('joy_cmdVel_stm', anonymous=True)
ser = serial.Serial("/dev/ttyACM0", 9600, timeout=None)
rospy.Subscriber("/joy", Joy, joy_cb)
rospy.spin()
