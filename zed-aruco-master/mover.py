# robotu hareket ettirebilmemiz icin ros ile baglantimizin olacagi kod

# from geometry_msgs.msg import Twist
# import rospy
PATH_TO_TXT = "/home/alperenlcr/Code/zed-aruco-master/wait.txt"
PATH_TO_TXT2 = "/home/alperenlcr/Code/zed-aruco-master/contuine.txt"


# def pubTwist(lx, az):
#     pub_twist = rospy.Publisher('/cmd_vel', Twist, queue_size=10)   # bunu kaldirabilirsiniz otonom kodu yazildiginda
#     rospy.init_node('approach', anonymous=False)
#     movement = Twist()
#     movement.linear.x = lx
#     movement.linear.y = 0
#     movement.linear.z = 0
#     movement.angular.x = 0
#     movement.angular.y = 0
#     movement.angular.z = az
#     pub_twist.publish( movement )

def kavsak(yon):
    print(yon)
    fp = open(PATH_TO_TXT2, "w")
    fp.write(yon)
    fp.close()


# def ileri():
#     print("ileri")
#     #pubTwist(0.4, 0)
#     fp = open(PATH_TO_TXT, "w")
#     fp.write("4")
#     fp.close()


# def sol():
#     print("sol")
#     #pubTwist(0, -0.4)


# def sag():
#     print("sag")
#     #pubTwist(0, 0.4)


def dort_metre_ileri():
    print("4 Meter forward")
    #pubTwist(0.4, 0)
    fp = open(PATH_TO_TXT, "w")
    fp.write("4")
    fp.close()


def bir_metre_ileri():
    print("1 Meter forward")
    #pubTwist(0.4, 0)
    fp = open(PATH_TO_TXT, "w")
    fp.write("1")
    fp.close()


# def stop():
#     print("stop")
#     #pubTwist(0, 0)

