package sample.graphical.entity;

import javafx.animation.Timeline;
import javafx.scene.canvas.Canvas;
import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import static sample.graphical.entity.GraphicalProcessing.colorField;

public class Figure extends GraphicalObject {

    // Закрашивание пикслей под границей фигуры
    public static List <ColoredPixel> colorBorderPixels(Canvas graphTable, List <ColoredPixel> pixelList, List<GraphicalPoint> pointList, Color tempColor) throws InterruptedException {

        for (int pointNumber = 0; pointNumber < pointList.size(); pointNumber++)
        {
            System.out.println("pointNumber = " + pointNumber);

            // Инициализация точек
            GraphicalPoint firstPoint, secondPoint;

            firstPoint = pointList.get(pointNumber);

            if (pointNumber == pointList.size() - 1)
                secondPoint = pointList.get(0);
            else
                secondPoint = pointList.get(pointNumber + 1);

            if (firstPoint.xValue < secondPoint.xValue)
                pixelList = colorField(pixelList, graphTable, firstPoint, secondPoint, tempColor);
            else
                pixelList = colorField(pixelList, graphTable, secondPoint, firstPoint, tempColor);

            TimeUnit.SECONDS.sleep(1);
            graphTable.getGraphicsContext2D();
        }

        return pixelList;
    }

    // Установка стартового пикселя
    public static ColoredPixel setFirstRunningPixel(List <GraphicalPoint> pointList, Color tempColor) {
        return new ColoredPixel(pointList.get(0).xValue, pointList.get(0).yValue, tempColor);
    }

    // Направление затравливания
    static int getWayOfMoving(List<ColoredPixel> pixelList, ColoredPixel runningPixel) {
        int leftColoredPixel = 0, rightColoredPixel = 0, topColoredPixel = 0, bottomColoredPixel = 0;

        System.out.println("PixelList.size() = " + pixelList.size());

        for (int numberOfCheckedPixel = 0; numberOfCheckedPixel < pixelList.size(); numberOfCheckedPixel++) {
            ColoredPixel tempCheckingPixel = pixelList.get(numberOfCheckedPixel);

            // Слева
            if ((tempCheckingPixel.coordinateX + 1 == runningPixel.coordinateX) &&
                    (tempCheckingPixel.coordinateY == runningPixel.coordinateY) &&
                    (tempCheckingPixel.tempColor == runningPixel.tempColor))
                leftColoredPixel = 1;

            // Справа
            if ((tempCheckingPixel.coordinateX - 1 == runningPixel.coordinateX) &&
                    (tempCheckingPixel.coordinateY == runningPixel.coordinateY) &&
                    (tempCheckingPixel.tempColor == runningPixel.tempColor))
                rightColoredPixel = 1;

            // Сверху
            if ((tempCheckingPixel.coordinateX == runningPixel.coordinateX) &&
                    (tempCheckingPixel.coordinateY - 1 == runningPixel.coordinateY) &&
                    (tempCheckingPixel.tempColor == runningPixel.tempColor))
                topColoredPixel = 1;

            // Снизу
            if ((tempCheckingPixel.coordinateX == runningPixel.coordinateX) &&
                    (tempCheckingPixel.coordinateY + 1 == runningPixel.coordinateY) &&
                    (tempCheckingPixel.tempColor == runningPixel.tempColor))
                bottomColoredPixel = 1;

            // Нет возможности затравливать! Тупик!
            if (leftColoredPixel + rightColoredPixel + topColoredPixel + bottomColoredPixel == 4)
                return -1;
        }

        System.out.println(leftColoredPixel + ", " + rightColoredPixel + ", " + topColoredPixel + ", " + bottomColoredPixel);

        // Завтравливание вверх - 4
        if (leftColoredPixel == 1 && bottomColoredPixel == 1 && rightColoredPixel == 1)
            return 4;

        // Завтравливание вниз - 3
        if (leftColoredPixel == 1 && topColoredPixel == 1 && rightColoredPixel == 1)
            return 3;

        // Завтравливание влево - 1
        if (topColoredPixel == 1 && bottomColoredPixel == 1 && rightColoredPixel == 1)
            return 1;

        // Завтравливание вправо - 2
        if (topColoredPixel == 1 && bottomColoredPixel == 1 && leftColoredPixel == 1)
            return 2;

        // Завтравливание вправо - 2
        if (topColoredPixel == 1 && bottomColoredPixel == 1)
            return 2;

        // Завтравливание вниз - 3
        if (leftColoredPixel == 1 && rightColoredPixel == 1)
            return 3;

        // Завтравливание вправо - 2
        if ((topColoredPixel == 1 && leftColoredPixel == 1) ||
                (bottomColoredPixel == 1 && leftColoredPixel == 1))
            return 2;

        // Завтравливание вниз - 3
        if (topColoredPixel == 1 && rightColoredPixel == 1)
            return 3;

        // Завтравливание вверх - 4
        if (bottomColoredPixel == 1 && rightColoredPixel == 1)
            return 4;

        // Закрашивание вниз - 3
        if ((topColoredPixel == 1) ||
                (rightColoredPixel == 1) ||
                (leftColoredPixel == 1))
            return 3;

        // Закрашивание вправо - 2
        if (bottomColoredPixel == 1)
            return 2;

//        if (leftColoredPixel + rightColoredPixel + topColoredPixel + bottomColoredPixel == 4)
//            return -1;

        return -1;
    }

    // Завтравливание области
    public static List <ColoredPixel> zatraveSquare(List <ColoredPixel> pixelList, Canvas graphTable, List<GraphicalPoint> pointList, Color tempColor, ColoredPixel runningPixel) {

        int wayOfMoving = getWayOfMoving(pixelList, runningPixel);

        System.out.println("wayOfMoving = " + wayOfMoving);

        while (wayOfMoving != -1) {

            System.out.println("wayOfMoving = " + wayOfMoving);
            pixelList.add(runningPixel);

            // Перемещение влево
            if (wayOfMoving == 1)
                runningPixel.coordinateX -= 1;

            // Перемещение вправо
            if (wayOfMoving == 2)
                runningPixel.coordinateX += 1;

            // Перемещение вниз
            if (wayOfMoving == 3)
                runningPixel.coordinateY += 1;

            // Перемещение вверх
            if (wayOfMoving == 4)
                runningPixel.coordinateX -= 1;

            // Закращивания писклея на экране
            graphTable.getGraphicsContext2D().getPixelWriter().setColor((int) runningPixel.coordinateX,
                    (int) runningPixel.coordinateY,
                    runningPixel.tempColor);

            // Добавление перемещенного пикселя
            pixelList.add(runningPixel);

            // Получение направления перемещения
            wayOfMoving = getWayOfMoving(pixelList, runningPixel);
        }

        System.out.println("wayOfMoving = " + wayOfMoving);

        return pixelList;
    }

    // Заполнение многоугольника
    public static void fillFigure(List <ColoredPixel> pixelList, Canvas graphTable, List<GraphicalPoint> pointList, Color tempColor) throws InterruptedException {

        // Закрашивание пикслей под границей фигуры
        pixelList = colorBorderPixels(graphTable, pixelList, pointList, tempColor);

        // Установка стартового пикселя
        ColoredPixel runningPixel = setFirstRunningPixel(pointList, tempColor);

        // Затравливание области
        pixelList = zatraveSquare(pixelList, graphTable, pointList, tempColor, runningPixel);

//        int borderPosition = getBorderPosition(pointList);
//
//        System.out.println("borderPosition = " + borderPosition);
//
//        Timeline timer;
//
//        for (int pointNumber = 0; pointNumber < pointList.size(); pointNumber++)
//        {
//            System.out.println("pointNumber = " + pointNumber);
//
//            // Инициализация точек
//            GraphicalPoint firstPoint, secondPoint;
//
//            firstPoint = pointList.get(pointNumber);
//
//            if (pointNumber == pointList.size() - 1)
//                secondPoint = pointList.get(0);
//            else
//                secondPoint = pointList.get(pointNumber + 1);
//
//            if (firstPoint.xValue < secondPoint.xValue)
//                colorField(pixelList, graphTable, firstPoint, secondPoint, borderPosition, tempColor);
//            else
//                colorField(pixelList, graphTable, secondPoint, firstPoint, borderPosition, tempColor);
//
//            TimeUnit.SECONDS.sleep(1);
//            graphTable.getGraphicsContext2D();
//        }
    }

    // Закрашивание всех фигур
    static public void fillAllFigures(Canvas graphTable, List<List <GraphicalPoint>> allFigures, List <ColoredPixel> pixelList, Color colorToFillFigure){
        for (int numberOfFigure = 0; numberOfFigure < allFigures.size(); numberOfFigure++) {
            try {
                fillFigure(pixelList, graphTable, allFigures.get(numberOfFigure), colorToFillFigure);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    // Получение позиции границы
    public static int getBorderPosition(List<GraphicalPoint> pointList){
        double minPosition = 10000, maxPosition = -10000;

        for (int pointNumber = 0; pointNumber < pointList.size(); pointNumber++) {
            System.out.println("pointList.get(pointNumber).xValue = " + (int) (pointList.get(pointNumber).xValue));

            double tempXPosition = pointList.get(pointNumber).xValue;

            if (tempXPosition < minPosition)
                minPosition = tempXPosition;

            if (tempXPosition > maxPosition)
                maxPosition = tempXPosition;
        }

        return (int) (maxPosition + minPosition) / 2;
    }

    static public boolean isAllFiguresAvailiableToBeFilles(List <List <GraphicalPoint> > allFigures){
        if (allFigures.size() != 0)
            return true;
        return false;
    }

    static public boolean isFigureAvailiableToCreate(List<GraphicalPoint>tempFigure){
        if (tempFigure.size() >= 3)
            return true;
        return false;
    }

    // Добавление фигуры
    static public List <GraphicalPoint> addFigure(List <List <GraphicalPoint> > allFigures,
                                                  List <GraphicalPoint> tempFigure){
        allFigures.add(tempFigure);
        return new ArrayList<>();
    }
}
