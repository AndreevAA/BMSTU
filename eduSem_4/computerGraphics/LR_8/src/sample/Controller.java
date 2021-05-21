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
    List<GraphicalPoint> inputFigure;

    List<List<GraphicalPoint>> allFigures;

    List<ColoredPixel> pixelList;

    RectangleCutter mainRectangle;

    @FXML
    private ListView<String> objectsPlacedList;

    @FXML
    private Canvas graphTable;

    @FXML
    private Button addFigureButton;

    @FXML
    private ScrollPane scrollPanel;

    @FXML
    private Button clearAllButton, inputFigureButton, fillButton;

    @FXML
    private ChoiceBox<String> operationType = new ChoiceBox<String>();
    @FXML
    private ChoiceBox colorFillingType = new ChoiceBox();

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

        // Многоугольник
        inputFigure = new ArrayList<>();

        // Массив точек текущей фигуры
        tempFigure = new ArrayList<>();

        // Массив всех фигур
        allFigures = new ArrayList<>();

        // Массив пикселей
        pixelList = new ArrayList<>();

        // Массив копий
        copyObjectList = new ArrayList<>();

        // Установка вариаций отрисовки
        operationType.getItems().addAll("Ввод многоугольника",
                "Ввод отсекателя");
    }

    @FXML
    public void onClearAllButton() {
        clearAllButton.setOnAction(event -> {

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

            double xMouseClickedPos = event.getX(), yMouseClickedPos = event.getY();

            // Отрисовка поставленной точки
            GraphicalPoint tempPoint = new GraphicalPoint(xMouseClickedPos, yMouseClickedPos, Color.BLACK);

            if (operationType.getValue() == "Ввод многоугольника") {
                objectList.add(tempPoint);
                if (tempFigure.size() >= 1) {
                    // Предыдущая точка отрезка
                    GraphicalPoint previousPoint = new GraphicalPoint(tempFigure.get(tempFigure.size() - 1).xValue, tempFigure.get(tempFigure.size() - 1).yValue, Color.BLACK);

                    // Добавление отрезка
                    objectList.add(new GraphicalLine(previousPoint.xValue, previousPoint.yValue,
                            tempPoint.xValue, tempPoint.yValue, Color.BLACK));
                }
            }
            else {
                System.out.println("inputFigure.size() = " + inputFigure.size());
                // Добавление точки и прямой на рисуок
                addLineWithPointToObjects(
                        inputFigure, objectList, tempFigure, tempPoint, mainRectangle);
            }

            // Добавление точки к текущей фигуре
            tempFigure.add(tempPoint);

            // Отрезок нарисован
            if (operationType.getValue() == "Ввод отсекателя") {
                if (tempFigure.size() == 2)
                    tempFigure.clear();
            }

            redrawElements(graphTable, objectList);
        });
    }

    @FXML
    public void onInputFigure() {
        inputFigureButton.setOnAction(actionEvent -> {

            objectList.add(new GraphicalLine(tempFigure.get(0).xValue, tempFigure.get(0).yValue,
                    tempFigure.get(tempFigure.size() - 1).xValue, tempFigure.get(tempFigure.size() - 1).yValue, Color.BLACK));

            for (int numberOfFigure = 0; numberOfFigure < tempFigure.size(); numberOfFigure++)
                inputFigure.add(new GraphicalPoint(tempFigure.get(numberOfFigure).xValue, tempFigure.get(numberOfFigure).yValue, Color.BLACK));
            //inputFigure = tempFigure;

            System.out.println("inputFigure.size() = " + inputFigure.size());

            tempFigure.clear();

            System.out.println("inputFigure.size() = " + inputFigure.size());

            redrawElements(graphTable, objectList);
        });
    }
}
