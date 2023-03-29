# Import tkinter library
from tkinter import *
# Create an instance of tkinter frame or window
win = Tk()
# Set the geometry of tkinter frame
win.geometry("600x600")
myCanvas = Canvas(win, bg="pink", height=600, width=600)
zuraas1 = myCanvas.create_line(200, 20, 200, 580, width=4)
zuraas2 = myCanvas.create_line(400, 20, 400, 580, width=4)
zuraas3 = myCanvas.create_line(20, 200, 580, 200, width=4)
zuraas4 = myCanvas.create_line(20, 400, 580, 400, width=4)

eelj = 1
# {key: value}
conf = [{'x1': 0, 'x2': 200, 'y1': 0, 'y2': 200, 'xpaint1': 30, 'xpaint2': 30, 'opaint1': 30, 'opaint2': 30},
        {'x1': 200, 'x2': 400, 'y1': 0, 'y2': 200, 'xpaint1': 230,
            'xpaint2': 30, 'opaint1': 230, 'opaint2': 30},
        {'x1': 400, 'x2': 600, 'y1': 0, 'y2': 200, 'xpaint1': 430,
            'xpaint2': 30, 'opaint1': 430, 'opaint2': 30},
        {'x1': 0, 'x2': 200, 'y1': 200, 'y2': 400, 'xpaint1': 30,
            'xpaint2': 230, 'opaint1': 30, 'opaint2': 230},
        {'x1': 200, 'x2': 400, 'y1': 200, 'y2': 400, 'xpaint1': 230,
            'xpaint2': 230, 'opaint1': 230, 'opaint2': 230},
        {'x1': 400, 'x2': 600, 'y1': 200, 'y2': 400, 'xpaint1': 430,
            'xpaint2': 230, 'opaint1': 430, 'opaint2': 230},
        {'x1': 0, 'x2': 200, 'y1': 400, 'y2': 600, 'xpaint1': 30,
            'xpaint2': 430, 'opaint1': 30, 'opaint2': 430},
        {'x1': 200, 'x2': 400, 'y1': 400, 'y2': 600, 'xpaint1': 230,
            'xpaint2': 430, 'opaint1': 230, 'opaint2': 430},
        {'x1': 400, 'x2': 600, 'y1': 400, 'y2': 600, 'xpaint1': 430, 'xpaint2': 430, 'opaint1': 430, 'opaint2': 430}, ]

print(conf[7]['opaint1'])

muj = [0, 0, 0, 0, 0, 0, 0, 0, 0]
xmuj = [0, 0, 0, 0, 0, 0, 0, 0, 0]
omuj = [0, 0, 0, 0, 0, 0, 0, 0, 0]

hojil = [[1, 1, 1, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 1, 1, 1, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 1, 1, 1],
         [1, 0, 0, 0, 1, 0, 0, 0, 1],
         [0, 0, 1, 0, 1, 0, 1, 0, 0],
         [1, 0, 0, 1, 0, 0, 1, 0, 0],
         [0, 1, 0, 0, 1, 0, 0, 1, 0],
         [0, 0, 1, 0, 0, 1, 0, 0, 1]
         ]


def xzurah(x1, y1):
    xzur1 = myCanvas.create_line(x1, y1, x1+140, y1+140, width=10)
    xzur2 = myCanvas.create_line(x1, y1+140, x1+140, y1+140-140, width=10)


def ozurah(x1, y1):
    ozur = myCanvas.create_oval(x1, y1, x1+140, y1+140, width=10)


def callback(e):
    global eelj
    eelj += 1

    x = e.x
    y = e.y
    print("Pointer is currently at %d, %d" % (x, y))

    for i in range(0, len(conf)):
        if conf[i]['x1'] < x and x < conf[i]['x2'] and conf[i]['y1'] < y and y < conf[i]['y2'] and muj[i] == 0:
            muj[i] = 1
            print('Muj daragdsan', muj)
            if eelj % 2 == 0:
                xzurah(conf[i]['xpaint1'], conf[i]['xpaint2'])
                xmuj[i] = 1
                print("xmuj daragdsan", xmuj)
                for j in range(0, len(hojil)):
                    count = 0
                    for x in range(0, len(xmuj)):
                        if xmuj[x] == 1 and xmuj[x] == hojil[j][x]:
                            count += 1
                    if count == 3:
                        print("x hojloo")
            else:
                ozurah(conf[i]['opaint1'], conf[i]['opaint2'])
                omuj[i] = 1
                print("omuj daragdsan", omuj)
                for j in range(0, len(hojil)):
                    count = 0
                    for x in range(0, len(omuj)):
                        if omuj[x] == 1 and omuj[x] == hojil[j][x]:
                            count += 1
                    if count == 3:
                        print("o hojloo")

    # # 1-r muj
    # if 0 < x and x < 200 and 0 < y and y < 200:
    #     if eelj % 2 == 0:
    #         xzurah(30, 30)
    #     else:
    #         ozurah(30, 30)
    # # 2-r muj
    # if 200 < x and x < 400 and 0 < y and y < 200:
    #     if eelj % 2 == 0:
    #         xzurah(230, 30)
    #     else:
    #         ozurah(230, 30)
    # # 3-r muj
    # if 400 < x and x < 600 and 0 < y and y < 200:
    #     if eelj % 2 == 0:
    #         xzurah(430, 30)
    #     else:
    #         ozurah(430, 30)
    # # 4-r muj
    # if 0 < x and x < 200 and 200 < y and y < 400:
    #     if eelj % 2 == 0:
    #         xzurah(30, 230)
    #     else:
    #         ozurah(30, 230)
    # # 5-r muj
    # if 200 < x and x < 400 and 200 < y and y < 400:
    #     if eelj % 2 == 0:
    #         xzurah(230, 230)
    #     else:
    #         ozurah(230, 230)
    # # 6-r muj
    # if 400 < x and x < 600 and 200 < y and y < 400:
    #     if eelj % 2 == 0:
    #         xzurah(430, 230)
    #     else:
    #         ozurah(430, 230)
    # # 7-r muj
    # if 0 < x and x < 200 and 400 < y and y < 600:
    #     if eelj % 2 == 0:
    #         xzurah(30, 430)
    #     else:
    #         ozurah(30, 430)
    # # 8-r muj
    # if 200 < x and x < 400 and 400 < y and y < 600:
    #     if eelj % 2 == 0:
    #         xzurah(230, 430)
    #     else:
    #         ozurah(230, 430)
    # # 9-r muj
    # if 400 < x and x < 600 and 400 < y and y < 600:
    #     if eelj % 2 == 0:
    #         xzurah(430, 430)
    #     else:
    #         ozurah(430, 430)


win.bind('<Button>', callback)
myCanvas.pack()
win.mainloop()
