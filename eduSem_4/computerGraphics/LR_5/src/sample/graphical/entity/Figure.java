package sample.graphical.entity;

import javafx.scene.canvas.Canvas;
import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;

import java.util.ArrayList;
import java.util.List;

import static sample.graphical.entity.GraphicalProcessing.colorField;

public class Figure extends GraphicalObject {

    // Заполнение многоугольника
    public static void fillFigure(List <ColoredPixel> pixelList, Canvas graphTable, List<GraphicalPoint> pointList, Color tempColor) throws InterruptedException {

        int borderPosition = getBorderPosition(pointList);

        System.out.println("borderPosition = " + borderPosition);

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
                colorField(pixelList, graphTable, firstPoint, secondPoint, borderPosition, tempColor);
            else
                colorField(pixelList, graphTable, secondPoint, firstPoint, borderPosition, tempColor);
        }
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
