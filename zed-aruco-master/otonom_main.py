PATH_TO_ZED_Reloc_Aruco = "/home/alperenlcr/Code/zed-aruco-master/mono/build/ZED_Reloc_Aruco"
PATH_TO_TXT = "/home/alperenlcr/Code/zed-aruco-master/wait.txt"
# otonom
import os
from time import sleep
from mover import *


def approach():
    # bu fonksiyon otonom olarak ArUco alanina ulastiktan sonra calistirilmalidir.
    # yaklasma / ortasindan gecme islemi bitene kadar cagirildigi kodun akisi duracaktir.
    # eger ki hata alirsaniz main.cpp - Driver.py - mover.py - ve bu koddaki global tanimli degiskenleri kontrol edin
    # hala calismiyorsa ZED_Reloc_Aruco icin mono/build icine girip make atin terminalden
    os.system(PATH_TO_ZED_Reloc_Aruco)
    print("devamke")
    sleep(1)
    fp = open(PATH_TO_TXT)
    second = int(fp.read())
    fp.close()
    sleep(second*3)
    print("finished")
    kavsak("stop")

approach()
# otonom
