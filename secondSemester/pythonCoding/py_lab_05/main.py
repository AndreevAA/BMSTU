import pygame

from math import *
from random import *

# Шарики на экране
BUBBLES = [];
SCREENSIZE = 800;
MINRADIOUS = 20;
MAXRADIOUS = 50;
MINSPEED = 1;
MAXSPEED = 40;
LEVEL = 1;
POINTS = 0;
STARTTIME = 2000;
TEMPTIME = STARTTIME;

# Создание шарика
def createRandomBubble():
    global BUBBLES;
    
    tempXPosition = randint(0, SCREENSIZE);
    tempYPosition = randint(0, SCREENSIZE);
    tempRadious = randint(MINRADIOUS, MAXRADIOUS);
    tempColor = (randint(0, 256), randint(0, 256), randint(0, 256))
    tempXSteps = randint(-MAXSPEED, MAXSPEED)
    tempYSteps = randint(-MAXSPEED, MAXSPEED)
    
    BUBBLES.append([tempXPosition, tempYPosition, tempRadious, tempColor, tempXSteps, tempYSteps]);

# Изменение позиции шарика
def makeStepBubble():
    global BUBBLES, MINSPEED, MAXSPEED;
    for i in range(len(BUBBLES)):
        #print(BUBBLES[i])
        tempXPosition = BUBBLES[i][0];
        tempYPosition = BUBBLES[i][1];
        tempRadious =   BUBBLES[i][2];
        tempColor =     BUBBLES[i][3];
        tempXSteps =    BUBBLES[i][4];
        tempYSteps =    BUBBLES[i][5];
        
        if (tempXPosition + tempXSteps - tempRadious <= 0):
            tempXSteps = randint(MINSPEED, MAXSPEED)
        if (tempYPosition + tempYSteps - tempRadious <= 0):
            tempYSteps = randint(MINSPEED, MAXSPEED)
        if (tempXPosition + tempXSteps + tempRadious >= SCREENSIZE):
            tempXSteps = randint(-MAXSPEED, -MINSPEED)
        if (tempYPosition + tempYSteps + tempRadious >= SCREENSIZE):
            tempYSteps = randint(-MAXSPEED, -MINSPEED)

        newXPosition = tempXPosition + tempXSteps;
        newYPosition = tempYPosition + tempYSteps;
        
        BUBBLES[i] = [newXPosition, newYPosition, BUBBLES[i][2], tempColor, tempXSteps, tempYSteps];
    
# Отрисовка шариков на экране
def drawBubbles():
    global BUBBLES;
    for i in range(len(BUBBLES)):
        tempXPosition = BUBBLES[i][0];
        tempYPosition = BUBBLES[i][1];
        tempRadious =   BUBBLES[i][2];
        tempColor =     BUBBLES[i][3];
        pygame.draw.circle(gameDisplay, tempColor, (BUBBLES[i][0], BUBBLES[i][1]), BUBBLES[i][2])

# Нахождение дистанции между точками
def distanceBetweenPoints(tempXPosition, tempYPosition, mouseButtonDownX, mouseButtonDownY):
    answer = sqrt((tempXPosition - mouseButtonDownX) ** 2 + (tempYPosition - mouseButtonDownY) ** 2);
    return answer;

# Проверка нахождения клика внутри круга
def checkInBubble(tempRadious, tempXPosition, tempYPosition, mouseButtonDownX, mouseButtonDownY):
    if distanceBetweenPoints(tempXPosition, tempYPosition, mouseButtonDownX, mouseButtonDownY) < tempRadious:
        return 1;
    return 0;

# Проверка и удаление шариков
def deleteBubble(positions):
    global BUBBLES, POINTS;
    mouseButtonDownX = positions[0];
    mouseButtonDownY = positions[1];
    
    newBubbles = [];
    for i in range(len(BUBBLES)):
        tempXPosition = BUBBLES[i][0];
        tempYPosition = BUBBLES[i][1];
        tempRadious =   BUBBLES[i][2];
        tempColor =     BUBBLES[i][3];
        
        if (checkInBubble(tempRadious, tempXPosition, tempYPosition, mouseButtonDownX, mouseButtonDownY) == 0):
            newBubbles.append(BUBBLES[i]);
            
    POINTS += len(BUBBLES) - len(newBubbles);
    BUBBLES = newBubbles;
    
# Проверка уровня и количества очков
def checkUpLevel():
    global BUBBLES, LEVEL, STARTTIME, TEMPTIME;
    
    
    if (len(BUBBLES) == 0):
        LEVEL += 1;
        TEMPTIME = STARTTIME;
        for i in range(LEVEL * 5):
            createRandomBubble();
        
# Обновление времени
def updateTime():
    global TEMPTIME;
    TEMPTIME -= 2;
    
crashed = False

# Проверка времени на истечени
def checkUpTimeAndPoints():
    global TEMPTIME, crashed;
    if (TEMPTIME // 100 < 1):
        crashed = True;
        
gameDisplay = pygame.display.set_mode((SCREENSIZE,SCREENSIZE))

clock = pygame.time.Clock()

for i in range(LEVEL * 5):
    createRandomBubble();

while not crashed:

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            crashed = True
        if event.type == pygame.MOUSEBUTTONDOWN:
            deleteBubble(event.pos);
        
    pygame.display.set_caption('Level: ' + str(LEVEL) + ' | Points: ' + str(POINTS) + ' | Time: ' + str(TEMPTIME // 100))
    
    updateTime();
    checkUpTimeAndPoints();
    checkUpLevel();
    makeStepBubble();
    drawBubbles();
    
    pygame.display.update()
    gameDisplay.fill((30,120,180))
    clock.tick(40000)
    
pygame.init()
quit()
