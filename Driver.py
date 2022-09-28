from operator import itemgetter
import os
import sys
from time import sleep
from xml.sax.handler import property_interning_dict

from sys import argv
from mover import *


def filtlere(arucolar):
# filtreleme
    i = 0
    dis_dif = 0.5
    x_dif = 100
    y_dif = 150
    while i < len(arucolar)-1:
        if arucolar[i+1][3] - arucolar[i][3] < dis_dif and arucolar[i+1][2] - arucolar[i+1][2] < y_dif and arucolar[i+1][1] - arucolar[i+1][1] < x_dif:
            arucolar.pop(i)
        else:
            i += 1
    return arucolar


def data_olustur():
#arucolar matrisi
#her satir bir arucoya ait bilgileri tutacak
#[
#    [id1, center_x1, center_y1, distance1],
#    [id2, center_x2, center_y2, distance2],
#    [id3, center_x3, center_y3, distance3],
#    [id4, center_x4, center_y4, distance4],
#]

    arucolar = []
    dizi = argv[1:]
    # print(dizi)
    for i in range(len(dizi)//4):
        arucolar.append([int(dizi[0+i*4]), int(dizi[1+i*4]), int(dizi[2+i*4]), float(dizi[3+i*4])])

    arucolar = sorted(arucolar, key=itemgetter(3))

    # frp.close()
    return arucolar


def tek_ArUco(aruco):
    # print("tek aruco : ", aruco)
    if aruco[1] < 600:
        kavsak("left")
    elif aruco[1] > 700:
        kavsak("right")
    elif aruco[3] > 2:
        kavsak("forward")
    else:
        bir_metre_ileri()
        # print("bulundugu sekilde 1 metre ilerle")
        os.system("pkill ZED_Reloc_Aruco")


def cift_ArUco(aruco1, aruco2):
    midpoint = (aruco1[1] + aruco2[1]) // 2
    print(midpoint)
    # print("aruco1 : ", aruco1)
    # print("aruco2 : ", aruco2)
    if midpoint < 600:
        kavsak("left")
    elif midpoint > 700:
        kavsak("right")
    elif (aruco1[3] + aruco2[3]) // 2 > 2:
        kavsak("forward")
    else:
        dort_metre_ileri()
        # print("bulundugu sekilde 4 metre ilerle")
        os.system("pkill ZED_Reloc_Aruco")


veriler = data_olustur()
# bu kisimda gerçek dünyada birbirinin yaninda olan ArUcolar tek bir isaretmis gibi algilanacak
veriler = filtlere(veriler) # test asamalarinda daha belli olacak
# print(veriler)
# devaminda kalanlari sayisi 1 ise 2 metreden daha yakin olacak sekilde yaklasilacak
if len(veriler) == 1:
    tek_ArUco(veriler[0])
elif len(veriler) == 2:
    cift_ArUco(veriler[0], veriler[1])

# kalanlarin sayisi 2 ise orta noktasindan gecilecek
# for veri in veriler:
#     print(*veri)
