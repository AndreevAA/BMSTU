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

import java.awt.*;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

    // Устноавка точки и прямой на рисунок
    static public List <GraphicalObject> addLineWithPointToObjects(double xMouseClickedPos, double yMouseClickedPos, List <GraphicalObject> objectList, List <GraphicalPoint> tempFigure, GraphicalPoint tempPoint){
        // Добавление точки
        objectList.add(tempPoint);

        // Добавление прямой
        if (isTempFigureAvaliableToAddLine(tempFigure))
            objectList.add(new GraphicalLine(tempFigure.get(tempFigure.size() - 1).xValue, tempFigure.get(tempFigure.size() - 1).yValue,
                    xMouseClickedPos, yMouseClickedPos, Color.BLACK));

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
