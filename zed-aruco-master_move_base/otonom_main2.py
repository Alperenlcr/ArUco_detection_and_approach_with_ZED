PATH_TO_ZED_Reloc_Aruco = "/home/alperenlcr/Code/zed-aruco-master/mono/build/ZED_Reloc_Aruco"
PATH_TO_TXT = "/home/alperenlcr/Code/zed-aruco-master/wait.txt"
PATH_TO_TXT3 = "/home/alperenlcr/Code/zed-aruco-master/count_probobility.txt"

# otonom
import os
from time import sleep
from mover import *


def approach():
    # bu fonksiyon otonom olarak ArUco alanina ulastiktan sonra calistirilmalidir.
    # yaklasma / ortasindan gecme islemi bitene kadar cagirildigi kodun akisi duracaktir.
    os.system(PATH_TO_ZED_Reloc_Aruco)



    # eger ki hata alirsaniz main.cpp - Driver.py - mover.py - ve bu koddaki global tanimli degiskenleri kontrol edin
    # hala calismiyorsa ZED_Reloc_Aruco icin mono/build icine girip make atin terminalden

    print("devamke")
    sleep(1)
    fp = open(PATH_TO_TXT)
    second = int(fp.read())
    fp.close()
    sleep(second*3)
    print("finished")
    kavsak("stop")


count = 2   # aruco marker count -> gate(2) or post(1)
probobility_count = 0

fp = open(PATH_TO_TXT3, "w")
fp.write(str(count) + " " + str(probobility_count))
fp.close()

approach()
# otonom
