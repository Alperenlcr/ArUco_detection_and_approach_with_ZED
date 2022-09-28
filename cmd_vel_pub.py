from time import sleep
from geometry_msgs.msg import Twist
import keyboard  # using module keyboard
import rospy

PATH_TO_TXT2 = "/home/alperenlcr/Code/zed-aruco-master/contuine.txt"

def pubTwist(lx, az, pub_twist):
    movement = Twist()
    movement.linear.x = lx
    movement.linear.y = 0
    movement.linear.z = 0
    movement.angular.x = 0
    movement.angular.y = 0
    movement.angular.z = az
    pub_twist.publish( movement )

pub_twist = rospy.Publisher('/cmd_vel', Twist, queue_size=10)   # bunu kaldirabilirsiniz otonom kodu yazildiginda
rospy.init_node('approach', anonymous=False)

while True:  # making a loop
#    if keyboard.is_pressed('q'):  # if key 'q' is pressed 
#        break  # finishing the loop
    try:
        with open(PATH_TO_TXT2, "r") as file:
            # Print the success message
            string = file.read()
            if string == "forward":
                pubTwist(0.4, 0, pub_twist)
                # ileri
            elif string == "left":
                pubTwist(0, -0.4, pub_twist)
                # sol
            elif string == "right":
                pubTwist(0, 0.4, pub_twist)
                # sag
            elif string == "stop":
                # dur
                pubTwist(0, 0, pub_twist)
                exit(1)            
    # Raise error if the file is opened before
    except IOError:
        pass
    sleep(0.1)

pubTwist(0, 0, pub_twist)
exit(1)