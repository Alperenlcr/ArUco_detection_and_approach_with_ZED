from operator import itemgetter
import os
from sys import argv
from mover import *
from aruco_gate import *
PATH_TO_TXT3 = "/home/alperenlcr/Code/zed-aruco-master/count_probobility.txt"


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

    arucolar = [[], []]
    dizi = argv[1:]
    # print(dizi)
    x = 0
    for i in range(len(dizi)//4):
        if int(dizi[0+i*4]) == -1:
            x = 1
            continue
        arucolar[x].append([int(dizi[0+i*4]), int(dizi[1+i*4]), int(dizi[2+i*4]), float(dizi[3+i*4])])
    # -1 liden bol ilkler new sonrakiler old

    arucolar[0] = sorted(arucolar[0], key=itemgetter(3))
    arucolar[1] = sorted(arucolar[1], key=itemgetter(3))

    # frp.close()
    return arucolar


def tek_ArUco(aruco):
    # print("tek aruco : ", aruco)
    print(aruco[1], aruco[2], aruco[3])
    if aruco[1] < 600:
        kavsak("left")
    elif aruco[1] > 700:
        kavsak("right")
    elif aruco[3] > 2:
        kavsak("forward")
    # cok yakin durursa koordinat ile 1 metre ileri gitmemeli
    elif aruco[3] < 1.5:
        n_metre_ileri(0)
        os.system("pkill ZED_Reloc_Aruco")
    else:
        n_metre_ileri(1)
        # print("bulundugu sekilde 1 metre ilerle")
        os.system("pkill ZED_Reloc_Aruco")


def cift_ArUco(neww, old, probobilty_count):
    neww = filtlere(neww) # test asamalarinda daha belli olacak
    old = filtlere(old) # test asamalarinda daha belli olacak
    if not (len(neww) == 2 and len(old) == 2):
        probobilty_count = 0
        kavsak("right")
# dogru tanima oldugunda move_base hedefi vermemiz lazim
# bunun icin tekrarli bir sekilde ayni yerlerde tanima olursa dogru yerler oldugunu varsayacagiz
# dogru yer olmadikca rover donecek - dogru tanimalar oldugunda ise move_base hedefleri verilecek ve aruco tanima kapatilacak
    elif abs(neww[0][1] - old[0][1]) < 80 and abs(neww[0][2] - old[0][2]) < 50 and abs(neww[0][3] - old[0][3] < 0.5) and \
        abs(neww[1][1] - old[1][1]) < 80 and abs(neww[1][2] - old[1][2]) < 50 and abs(neww[1][3] - old[1][3] < 0.5):
        probobilty_count += 1
        if probobilty_count == 3:
            # move_base goal
            gate_passing(neww[0][3], neww[1][3])
            os.system("pkill ZED_Reloc_Aruco")
    else:
        probobilty_count = 0
        kavsak("right")


veriler = data_olustur()

fp = open(PATH_TO_TXT3, "r")
temp = fp.read()
fp.close()

temp2 = list(map(int, temp.split()))
count, probobility_count = temp2[0], temp2[1]

#for veri in veriler:
#    print(veri)

#print(count)
#count += 1
#print()
# bu kisimda gerçek dünyada birbirinin yaninda olan ArUcolar tek bir isaretmis gibi algilanacak
# print(veriler)
# devaminda kalanlari sayisi 1 ise 2 metreden daha yakin olacak sekilde yaklasilacak
#if len(veriler) == 1:
#    tek_ArUco(veriler[0])
#elif len(veriler) == 2:
#    cift_ArUco(veriler[0], veriler[1])

if count == 1:
    tek_ArUco(veriler[0][0])
else:
    cift_ArUco(veriler[0], veriler[1], probobility_count)


fp = open(PATH_TO_TXT3, "w")
fp.write(str(count) + " " + str(probobility_count))
fp.close()


# kalanlarin sayisi 2 ise orta noktasindan gecilecek
# for veri in veriler:
#     print(*veri)
