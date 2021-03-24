'''
Рубежный контроль, Андреев А.А. ИУ7-24Б

Дан круг, разделенный на 4 сектора. Каждый сектор закрашен различным цветом. 
Через центр круга проходит синусоида. 

Пользователь вводит угол поворота fi. Необходимо отобразить поворот круга по часовой стрелке на fi градусов и перемещение по синусоиде. При достижении границы экрана шарик продолжает движение по той же траектории в обратную сторону.

Программа пишется с использованием библиотеки pygame. Использование sprite, surface запрещено. 

Все реализуется с помощью примитивов, преобразования изображения осуществляются самостоятельно. 
'''
import pygame

from math import *
from random import *

# Шарики на экране
SCREENSIZE = 800;

X = 400 #ширина
Y = 400 #высота
WHITE = (255, 255, 255)#белый
T_Ser=(90, 90, 90)#темно-серый
S_Ser=(170, 170, 170) #светло-серый
sc = pygame.display.set_mode((800, 800))
WAY = 1;

gameDisplay = pygame.display.set_mode((SCREENSIZE,SCREENSIZE))

# Отрисовка шариков на экране
def drawBubbles():
    global X, Y, S_Ser, T_Ser, BUBBLES

    surf1 = pygame.Surface((X, Y))#задаем поверхность для верхнего левого сектора
    surf1.fill((WHITE))  # 
    rect1 = pygame.Rect((0, 0, 0, 0))#задаем область Rect для верхнего левого сектора
    pygame.draw.circle(surf1 ,S_Ser,( X, Y), 30)#рисуем круг, отобразится его часть
     
    surf2 = pygame.Surface((X, Y))#задаем поверхность для верхнего правого сектора
    surf2.fill((WHITE))  # 
    rect2 = pygame.Rect((X, 0, 0, 0))#задаем область Rect для верхнего правого сектора
    pygame.draw.circle(surf2 ,T_Ser,( 0, Y), 30)
     
    surf3 = pygame.Surface((X, Y))#задаем поверхность для нижнего левого сектора
    surf3.fill((WHITE))  # 
    rect3 = pygame.Rect((0, Y, 0, 0))#задаем область Rect для нижнего левого сектора
    pygame.draw.circle(surf3 ,T_Ser,( X, 0), 30)
     
    surf4 = pygame.Surface((X, Y))#задаем поверхность для нижнего правого сектора
    surf4.fill((WHITE))  # 
    rect4 = pygame.Rect((X, Y, 0, 0))#задаем область Rect для нижнего правого сектора
    pygame.draw.circle(surf4 ,S_Ser,( 0,0), 30)
     
    sc.blit(surf1, rect1)#отрисовываем первый сектор
    sc.blit(surf2, rect2)#второй
    sc.blit(surf3, rect3)#третий
    sc.blit(surf4, rect4)#четвертый
    
crashed = False

clock = pygame.time.Clock()

while not crashed:

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            crashed = True
        if event.type == pygame.MOUSEBUTTONDOWN:
            deleteBubble(event.pos);

    if (X >= 800):
        WAY = -1;
    elif (X <= 0):
        WAY = 1;

    X += 80 * WAY;
    #print(sin(X));
    Y = ((sin(X) * 40 + 400));

    drawBubbles();
    
    pygame.display.update()
    gameDisplay.fill((255, 255, 255))
    pygame.time.delay(50)
    clock.tick(80000)
    
pygame.init()
quit()
