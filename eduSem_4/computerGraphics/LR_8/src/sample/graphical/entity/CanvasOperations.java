package sample.graphical.entity;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.canvas.Canvas;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.ScrollPane;
import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;
import sample.graphical.elements.RectangleCutter;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static java.lang.StrictMath.*;

public class CanvasOperations extends GraphicalObject
{
    // Преобразование значение цвета
    public static Color getColor(String tempColorStatus)
    {
        if (tempColorStatus == "Красный")
            return Color.RED;
        else if (tempColorStatus == "Зеленый")
            return Color.GREEN;
        else if (tempColorStatus == "Серый")
            return Color.GREY;
        else if (tempColorStatus == "Синий")
            return Color.BLUE;
        else if (tempColorStatus == "Желтый")
            return Color.YELLOW;
        else
            return Color.BLACK;
    }

    // Установка параметров для скролла панели
    static public void setScrollPanelProperties(ScrollPane scrollPanel, Canvas graphTable, List <GraphicalObject> objectList) {
        scrollPanel.widthProperty().addListener(event -> {
            graphTable.setWidth(scrollPanel.getWidth());
            redrawElements(graphTable, objectList);
        });

        scrollPanel.heightProperty().addListener(event -> {
            graphTable.setHeight(scrollPanel.getHeight());
            redrawElements(graphTable, objectList);
        });
    }

    // Перерисовка элементов экрана
    static public void redrawElements(Canvas graphTable, List<GraphicalObject> objectList)
    {
        graphTable.getGraphicsContext2D().clearRect(0, 0, graphTable.getWidth(), graphTable.getHeight());
        objectList.forEach(graphicalObject -> graphicalObject.draw(graphTable.getGraphicsContext2D()));
    }

    // Отрисовка линии
    static public List <GraphicalObject> addLine(Canvas graphTable, List <GraphicalObject> objectList, double firstX, double firstY, double secondX, double secondY, Color tempСolor)
    {
        // Добавление линии
        objectList.add(new GraphicalLine(firstX, firstY, secondX, secondY, tempСolor));

        redrawElements(graphTable, objectList);

        return objectList;
    }


    // Верификация на возможность добавления линии
    static public boolean isTempFigureAvaliableToAddLine(List <GraphicalPoint> tempFigure){
        if (tempFigure.size() != 0)
            return true;
        return false;
    }


    static public double getSquare(double a, double b, double c) {
        double p = (a + b + c) / 2;
        return sqrt(p * (p - a) * (p - b) * (p - c));
    }

    static public double getDistance(double x1, double y1, double x2, double y2) {
        return sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
    }

    // Проверка пересечения отрезков
    static public boolean isRectangleCrossedByLine(GraphicalPoint firstPoint, GraphicalPoint secondPoint,
                                                   GraphicalPoint thirdPoint, GraphicalPoint fourthPoint) {

        double x1 = firstPoint.xValue, y1 = firstPoint.yValue,
                x2 = secondPoint.xValue, y2 = secondPoint.yValue;

        double x3 = thirdPoint.xValue, y3 = thirdPoint.yValue,
                x4 = fourthPoint.xValue, y4 = fourthPoint.yValue;

        System.out.println(x1 + ", " + y1 + ", " + x2 + ", " + y2 + ", " +
                x3 + ", " + y3 + ", " + x4 + ", " + y4);

        double x1_x2 = getDistance(firstPoint.xValue, firstPoint.yValue, secondPoint.xValue, secondPoint.yValue);
        double x1_x3 = getDistance(firstPoint.xValue, firstPoint.yValue, thirdPoint.xValue, thirdPoint.yValue);
        double x1_x4 = getDistance(firstPoint.xValue, firstPoint.yValue, fourthPoint.xValue, fourthPoint.yValue);
        double x2_x3 = getDistance(secondPoint.xValue, secondPoint.yValue, thirdPoint.xValue, thirdPoint.yValue);
        double x2_x4 = getDistance(secondPoint.xValue, secondPoint.yValue, fourthPoint.xValue, fourthPoint.yValue);
        double x3_x4 = getDistance(thirdPoint.xValue, thirdPoint.yValue, fourthPoint.xValue, fourthPoint.yValue);

        double sqLeft = getSquare(x1_x2, x2_x3, x1_x3),
                sqRight = getSquare(x1_x2, x2_x4, x1_x4);

        double sqTop = getSquare(x1_x3, x3_x4, x1_x4),
                sqBottom= getSquare(x2_x3, x3_x4, x2_x4);

        double fSq = sqLeft + sqRight;
        double sSq = sqTop + sqBottom;

        if (sSq * 0.98 <= fSq && fSq <= sSq * 1.02)
            return  true;

        return false;
    }

    static public GraphicalPoint getRectangleCrossedByLine(GraphicalPoint firstPoint, GraphicalPoint secondPoint,
                                                           GraphicalPoint thirdPoint, GraphicalPoint fourthPoint) {

        double x1 = firstPoint.xValue, y1 = firstPoint.yValue,
                x2 = secondPoint.xValue, y2 = secondPoint.yValue;

        double x3 = thirdPoint.xValue, y3 = thirdPoint.yValue,
                x4 = fourthPoint.xValue, y4 = fourthPoint.yValue;

        double k1 = (y2 - y1) / (x2 - x1);
        double k2 = (y4 - y3) / (x4 - x3);

        double b1 = y2 - k1 * x2;
        double b2 = y4 - k2 * x4;

        double intersectionX = (b2 - b1) / (k1 - k2);
        double intersectionY = k1 * intersectionX + b1;

        return new GraphicalPoint(intersectionX, intersectionY, Color.BLACK);

//        double k = (y2 - y1) / (x2 - x1);
//
//        double b = y2 - k * x2;
//
//        if (isHorizontal) {
//            System.out.println("isHorizontal, x = " + (y3 - b) / k + ", y = " + y3);
//            return (new GraphicalPoint((y3 - b) / k, y3, Color.BLACK));
//        }
//        System.out.println("NOT Horizontal, x = " + x3 + ", y = " + k * x3 + b);
//        return (new GraphicalPoint(x3, k * x3 + b, Color.BLACK));
    }

    // Устноавка точки и прямой на рисунок
    static public List <GraphicalObject> addLineWithPointToObjects(List <GraphicalPoint> inputFigure, List <GraphicalObject> objectList, List <GraphicalPoint> tempFigure, GraphicalPoint tempPoint, RectangleCutter mainRectangle){
        // Добавление точки
        objectList.add(tempPoint);

        // Добавление прямой
        if (isTempFigureAvaliableToAddLine(tempFigure)) {

            // Предыдущая точка отрезка
            GraphicalPoint previousPoint = new GraphicalPoint(tempFigure.get(tempFigure.size() - 1).xValue, tempFigure.get(tempFigure.size() - 1).yValue, Color.BLACK);

            // Добавление отрезка
            objectList.add(new GraphicalLine(previousPoint.xValue, previousPoint.yValue,
                    tempPoint.xValue, tempPoint.yValue, Color.BLACK));

            // Существует многоугольник
            if (inputFigure.size() != 0) {

                System.out.println("inputFigure.size() != 0, " + inputFigure.size());

                // Массив точек пересения граней с отсекателем
                List <GraphicalPoint> intersectionPoints;
                intersectionPoints = new ArrayList<>();

                // Стартовая и конечная точка
                GraphicalPoint startSidePoint, endSidePoint;

                // Просмотр всех граней
                for (int numberOfPoint = 0; numberOfPoint < inputFigure.size() - 1; numberOfPoint++) {
                    System.out.println("Просмотрено: " + numberOfPoint);

                    startSidePoint = new GraphicalPoint(inputFigure.get(numberOfPoint).xValue, inputFigure.get(numberOfPoint).yValue, Color.BLACK);
                    endSidePoint = new GraphicalPoint(inputFigure.get(numberOfPoint + 1).xValue, inputFigure.get(numberOfPoint + 1).yValue, Color.BLACK);

                    // Найдено пересечение грани многоугольника и отсекателя
                    if (isRectangleCrossedByLine(tempPoint, previousPoint, startSidePoint, endSidePoint)) {
                        intersectionPoints.add(getRectangleCrossedByLine(tempPoint, previousPoint, startSidePoint, endSidePoint));
                    }
                }

                startSidePoint = new GraphicalPoint(inputFigure.get(inputFigure.size() - 1).xValue, inputFigure.get(inputFigure.size() - 1).yValue, Color.BLACK);
                endSidePoint = new GraphicalPoint(inputFigure.get(0).xValue, inputFigure.get(0).yValue, Color.BLACK);

                // Найдено пересечение грани многоугольника и отсекателя
                if (isRectangleCrossedByLine(tempPoint, previousPoint, startSidePoint, endSidePoint)) {
                    intersectionPoints.add(getRectangleCrossedByLine(tempPoint, previousPoint, startSidePoint, endSidePoint));
                }

                if (intersectionPoints.size() > 1) {
                    System.out.println("intersectionPoints.size() > 1");
                    objectList.add(new GraphicalLine(intersectionPoints.get(0).xValue, intersectionPoints.get(0).yValue, intersectionPoints.get(intersectionPoints.size() - 1).xValue, intersectionPoints.get(intersectionPoints.size() - 1).yValue
                            , Color.BLUE));
                }
            }
//
//            List <GraphicalPoint>
//            // Точки пересения прямой и прямоугольника
//            GraphicalPoint firstPointOfCrossing = null, secondPointOfCrossing = null;
//
//            // Статус пересечения
//            boolean isFirstPointOfCrossingUsed = false, isSecondPointOfCrossingUsed = false;
//
//            // Вершины многоугольника
//            GraphicalPoint leftBottomPoint = new GraphicalPoint(mainRectangle.startPointCoordinateX, mainRectangle.startPointCoordinateY, mainRectangle.color),
//                    leftTopPoint = new GraphicalPoint(mainRectangle.startPointCoordinateX, mainRectangle.startPointCoordinateY + mainRectangle.heightSide, mainRectangle.color),
//                    rightBottomPoint = new GraphicalPoint(mainRectangle.startPointCoordinateX + mainRectangle.widthSide, mainRectangle.startPointCoordinateY, mainRectangle.color),
//                    rightTopPoint = new GraphicalPoint(mainRectangle.startPointCoordinateX + mainRectangle.widthSide, mainRectangle.startPointCoordinateY + mainRectangle.heightSide, mainRectangle.color);
//
//            if (isRectangleCrossedByLine(previousPoint, tempPoint, leftBottomPoint, leftTopPoint, false)) {
//                firstPointOfCrossing = getRectangleCrossedByLine(previousPoint, tempPoint, leftBottomPoint, leftTopPoint, false);
//                isFirstPointOfCrossingUsed = true;
//            }
//
//            if (isRectangleCrossedByLine(previousPoint, tempPoint, leftBottomPoint, rightBottomPoint, true)) {
//                if (!isFirstPointOfCrossingUsed) {
//                    firstPointOfCrossing = getRectangleCrossedByLine(previousPoint, tempPoint, leftBottomPoint, rightBottomPoint, true);
//                    isFirstPointOfCrossingUsed = true;
//                }
//                else if (!isSecondPointOfCrossingUsed){
//                    secondPointOfCrossing = getRectangleCrossedByLine(previousPoint, tempPoint, leftBottomPoint, rightBottomPoint, true);
//                    isSecondPointOfCrossingUsed = true;
//                }
//            }
//
//            if (isRectangleCrossedByLine(previousPoint, tempPoint, leftTopPoint, rightTopPoint,true)) {
//                if (!isFirstPointOfCrossingUsed) {
//                    firstPointOfCrossing = getRectangleCrossedByLine(previousPoint, tempPoint, leftTopPoint, rightTopPoint, true);
//                    isFirstPointOfCrossingUsed = true;
//                }
//                else if (!isSecondPointOfCrossingUsed) {
//                    secondPointOfCrossing = getRectangleCrossedByLine(previousPoint, tempPoint, leftTopPoint, rightTopPoint, true);
//                    isSecondPointOfCrossingUsed = true;
//                }
//            }
//
//            if (isRectangleCrossedByLine(previousPoint, tempPoint, rightTopPoint, rightBottomPoint, false)) {
//                if (!isFirstPointOfCrossingUsed) {
//                    firstPointOfCrossing = getRectangleCrossedByLine(previousPoint, tempPoint, rightBottomPoint, rightTopPoint, false);
//                    isFirstPointOfCrossingUsed = true;
//                }
//                else if (!isSecondPointOfCrossingUsed){
//                    secondPointOfCrossing = getRectangleCrossedByLine(previousPoint, tempPoint, rightBottomPoint, rightTopPoint, false);
//                    isSecondPointOfCrossingUsed = true;
//                }
//            }
//
//            // Добавление отрезка
//            if (isFirstPointOfCrossingUsed && isSecondPointOfCrossingUsed)
//                objectList.add(new GraphicalLine(secondPointOfCrossing.xValue, secondPointOfCrossing.yValue, firstPointOfCrossing.xValue, firstPointOfCrossing.yValue
//                    , Color.BLUE));

        }

        return objectList;
    }

    public static List <GraphicalObject> addRectangleCutter(List <GraphicalObject> objectList, RectangleCutter mainRectangle) {

        // Левая вертикаль
        objectList.add(new GraphicalLine(mainRectangle.startPointCoordinateX, mainRectangle.startPointCoordinateY,
                mainRectangle.startPointCoordinateX, mainRectangle.startPointCoordinateY + mainRectangle.heightSide, mainRectangle.color));

        // Правая вертикаль
        objectList.add(new GraphicalLine(mainRectangle.startPointCoordinateX + mainRectangle.widthSide, mainRectangle.startPointCoordinateY,
                mainRectangle.startPointCoordinateX + mainRectangle.widthSide, mainRectangle.startPointCoordinateY + mainRectangle.heightSide, mainRectangle.color));

        // Верхняя горизонталь
        objectList.add(new GraphicalLine(mainRectangle.startPointCoordinateX, mainRectangle.startPointCoordinateY + mainRectangle.heightSide,
                mainRectangle.startPointCoordinateX + mainRectangle.widthSide, mainRectangle.startPointCoordinateY + mainRectangle.heightSide, mainRectangle.color));

        // Нижняя горизонталь
        objectList.add(new GraphicalLine(mainRectangle.startPointCoordinateX, mainRectangle.startPointCoordinateY,
                mainRectangle.startPointCoordinateX + mainRectangle.widthSide, mainRectangle.startPointCoordinateY, mainRectangle.color));

        return objectList;
    }

    // Копия создания дублежа
    @FXML
    static public List <GraphicalObject> createCopyFunction(List <GraphicalObject> objectList, List <GraphicalObject> copyObjectList) {
        // Очистка массива дубляжей
        copyObjectList.clear();

        // Добавление всех элементов
        for (int tempNumOfObject = 0; tempNumOfObject < objectList.size(); tempNumOfObject++)
            copyObjectList.add(objectList.get(tempNumOfObject));

        return copyObjectList;
    }

    // Получение дублирующий копии в оригинал
    @FXML
    static public List <GraphicalObject> getCopyFunction(List <GraphicalObject> objectList, List <GraphicalObject> copyObjectList) {
        // Очистка массива дубляжей
        objectList.clear();

        // Добавление всех элементов
        for (int tempNumOfObject = 0; tempNumOfObject < copyObjectList.size(); tempNumOfObject++)
            objectList.add(copyObjectList.get(tempNumOfObject));

        return objectList;
    }
}
