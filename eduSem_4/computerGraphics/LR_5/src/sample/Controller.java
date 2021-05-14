package sample;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.canvas.Canvas;
import javafx.scene.control.*;
import javafx.scene.control.Button;
import javafx.scene.control.ScrollPane;
import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;
import sample.graphical.entity.*;

import java.net.URL;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;

import static sample.graphical.entity.CanvasOperations.*;
import static sample.graphical.entity.Figure.*;

public class Controller implements Initializable {

    Map<String, ObservableList<String>> objectsFields;
    Map<String, GraphicalObject> objectNamesToClassReference;

    List<GraphicalObject> objectList, copyObjectList;

    List<GraphicalPoint> tempFigure;

    List<List<GraphicalPoint>> allFigures;

    List<ColoredPixel> pixelList;

    @FXML
    private ListView<String> objectsPlacedList;

    @FXML
    private Canvas graphTable;

    @FXML
    private Button addFigureButton;

    @FXML
    private ScrollPane scrollPanel;

    @FXML
    private Button clearAllButton, comeBack, fillButton;

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

        // Массив пикселей
        pixelList = new ArrayList<>();

        // Массив копий
        copyObjectList = new ArrayList<>();

        // Установка вариаций отрисовки
        timeDelayType.getItems().addAll("С задержкой",
                "Без задержки");

        // Устновка вариаций цвета
        colorFillingType.getItems().addAll("Черный", "Красный", "Зеленый", "Серый", "Желтый", "Синий");
    }

    @FXML
    public void onComeBack() {
        comeBack.setOnAction(actionEvent -> {
//            objectList = getCopyFunction(objectList, copyObjectList);
            objectsPlacedList.setItems(
                    FXCollections.observableList(objectList.stream().map(Object::toString).collect(Collectors.toList())));
            redrawElements(graphTable, objectList);
        });
    }

    @FXML
    public void onClearAllButton() {
        clearAllButton.setOnAction(event -> {
            //copyObjectList = createCopyFunction(objectList, copyObjectList);

            objectList.clear();
            tempFigure.clear();
            allFigures.clear();
            pixelList.clear();

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
            int xMouseClickedPos = (int) event.getX(), yMouseClickedPos = (int) event.getY();

            // Отрисовка поставленной точки
            GraphicalPoint tempPoint = new GraphicalPoint(xMouseClickedPos, yMouseClickedPos, Color.BLACK);

            // Добавление точки и прямой на рисуок
            objectList = addLineWithPointToObjects(xMouseClickedPos, yMouseClickedPos,
                    objectList, tempFigure, tempPoint);

            // Добавление точки к текущей фигуре
            tempFigure.add(tempPoint);

            //createCopyFunction();

            redrawElements(graphTable, objectList);
        });
    }

    @FXML
    public void onAddFigure() {

        // Нажатие на кнопку Замкнуть
        addFigureButton.setOnAction(actionEvent -> {
           if (isFigureAvailiableToCreate(tempFigure)) {
               objectList = addLine(graphTable, objectList, tempFigure.get(0).xValue, tempFigure.get(0).yValue, tempFigure.get(tempFigure.size() - 1).xValue, tempFigure.get(tempFigure.size() - 1).yValue, Color.BLACK);
               tempFigure = addFigure(allFigures, tempFigure);
           }
           else
               parameterErrorField.setText("Введите 3 и более точек!");
        });
    }

    @FXML
    public void onFill() {
        fillButton.setOnAction(actionEvent -> {
            if (isAllFiguresAvailiableToBeFilles(allFigures)) {

                redrawElements(graphTable, objectList);

                long startTime = System.nanoTime();
                fillAllFigures(objectList, graphTable, allFigures, pixelList, CanvasOperations.getColor(colorFillingType.getValue().toString()), CanvasOperations.getTimeDelayStatus(timeDelayType.getValue().toString()));
                long endTime = System.nanoTime();

                workingTime.setText(Long.toString((endTime - startTime) / 100000000));

                objectList.forEach(graphicalObject -> graphicalObject.draw(graphTable.getGraphicsContext2D()));
            }
            else
                parameterErrorField.setText("Должна быть как минимум одна замкнутая фигура!");
        });
    }
}
