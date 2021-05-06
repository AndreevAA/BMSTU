package sample;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.Rectangle2D;
import javafx.geometry.VPos;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.SnapshotParameters;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.control.*;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.image.PixelReader;
import javafx.scene.image.WritableImage;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;
import javafx.util.Builder;
import sample.graphical.GraphicalObject;
import sample.graphical.entity.*;

import javax.imageio.ImageIO;
import javax.sound.sampled.Line;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;

import java.lang.StrictMath.*;

import static java.lang.StrictMath.*;
import static sample.graphical.entity.CanvasOperations.*;
import static sample.graphical.entity.Figure.*;
import static sample.graphical.entity.GraphicalProcessing.*;

public class Controller implements Initializable {

    Map<String, ObservableList<String>> objectsFields;
    Map<String, GraphicalObject> objectNamesToClassReference;

    List<GraphicalObject> objectList;

    List<GraphicalPoint> tempFigure;

    List<List<GraphicalPoint>> allFigures;

    List<ColoredPixel> pixelList;

    List<GraphicalObject> copyObjectList;

    @FXML
    private ListView<String> objectsPlacedList;

    @FXML
    private Canvas graphTable;

    @FXML
    private Button addFigureButton;

    @FXML
    private ScrollPane scrollPanel;

    // Кнопка очистки канваса от всех данных и возврат обратно
    @FXML
    private Button clearAllButton, comeBack, fillButton;

    // Выпадающие списки
    @FXML
    private ChoiceBox timeDelayType = new ChoiceBox(), colorFillingType = new ChoiceBox();

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

        timeDelayType.getItems().addAll("С задержкой",
                "Без задержки");

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
            pixelList.clear();

            redrawElements(graphTable, objectList);
        });
    }

    @FXML
    public void onCreateCanvas()
    {
        setScrollPanelProperties(scrollPanel, graphTable, objectList);

        graphTable.setOnMouseClicked(event -> {
            double xMouseClickedPos = event.getX(), yMouseClickedPos = event.getY();

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
        });
    }

    @FXML
    public void onFill() {

        // Нажатие клавиши Закрасить
        fillButton.setOnAction(actionEvent -> {
            if (isAllFiguresAvailiableToBeFilles(allFigures))
                for (int numberOfFigure = 0; numberOfFigure < allFigures.size(); numberOfFigure++) {
                    try {
                        fillFigure(pixelList, graphTable, allFigures.get(numberOfFigure), CanvasOperations.getColor(colorFillingType.getValue().toString()));
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
        });
    }
}
