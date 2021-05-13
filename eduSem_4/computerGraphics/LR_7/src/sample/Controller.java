package sample;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.canvas.Canvas;
import javafx.scene.control.*;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;
import sample.graphical.elements.RectangleCutter;
import sample.graphical.entity.*;

import java.awt.*;
import java.net.URL;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;

import static sample.graphical.entity.CanvasOperations.*;

public class Controller implements Initializable {

    Map<String, ObservableList<String>> objectsFields;
    Map<String, GraphicalObject> objectNamesToClassReference;

    List<GraphicalObject> objectList, copyObjectList;

    List<GraphicalPoint> tempFigure;

    List<List<GraphicalPoint>> allFigures;

    RectangleCutter mainRectangle;

    @FXML
    private ListView<String> objectsPlacedList;

    @FXML
    private Canvas graphTable;

    @FXML
    private ScrollPane scrollPanel;

    @FXML
    private Button clearAllButton, comeBack;

    @FXML
    private ChoiceBox timeDelayType = new ChoiceBox(), colorFillingType = new ChoiceBox();

    @FXML
    private Label parameterErrorField, workingTime;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        objectsFields = new HashMap<>();
        objectsFields.put("Point", GraphicalPoint.parametersToObservableList());

        objectNamesToClassReference = new HashMap<>();
        objectNamesToClassReference.put("Point", GraphicalPoint.builder().build());

        // Массив сущностей
        objectList = new ArrayList<>();

        // Массив точек текущей фигуры
        tempFigure = new ArrayList<>();

        // Массив всех фигур
        allFigures = new ArrayList<>();

        // Массив копий
        copyObjectList = new ArrayList<>();

        // Инициализация каттера
        mainRectangle = new RectangleCutter(100, 100,
                500, 500,
                Color.RED);

        // Отрисовка каттера
        objectList = addRectangleCutter(objectList, mainRectangle);

        // Установка вариаций отрисовки
        timeDelayType.getItems().addAll("С задержкой",
                "Без задержки");

        // Устновка вариаций цвета
        colorFillingType.getItems().addAll("Черный", "Красный", "Зеленый", "Серый", "Желтый", "Синий");
    }

    @FXML
    public void onComeBack() {
        comeBack.setOnAction(actionEvent -> {
            objectList = getCopyFunction(objectList, copyObjectList);
            objectsPlacedList.setItems(
                    FXCollections.observableList(objectList.stream().map(Object::toString).collect(Collectors.toList())));
            redrawElements(graphTable, objectList);
        });
    }

    @FXML
    public void onClearAllButton() {
        clearAllButton.setOnAction(event -> {
            copyObjectList = createCopyFunction(objectList, copyObjectList);

            objectList.clear();
            tempFigure.clear();
            allFigures.clear();

            redrawElements(graphTable, objectList);
        });
    }

    @FXML
    public void onCreateCanvas()
    {
        // Установка параметров скролла
        setScrollPanelProperties(scrollPanel, graphTable, objectList);

        // Чтение кликов мыши
        graphTable.setOnMouseClicked(event -> {

            double xMouseClickedPos = event.getX(), yMouseClickedPos = event.getY();

            // Отрисовка поставленной точки
            GraphicalPoint tempPoint = new GraphicalPoint(xMouseClickedPos, yMouseClickedPos, Color.BLACK);

            // Добавление точки и прямой на рисуок
            objectList = addLineWithPointToObjects(
                    objectList, tempFigure, tempPoint, mainRectangle);

            // Добавление точки к текущей фигуре
            tempFigure.add(tempPoint);

            // Отрезок нарисован
            if (tempFigure.size() == 2)
                tempFigure.clear();

            redrawElements(graphTable, objectList);
        });
    }
}
