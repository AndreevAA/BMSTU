package sample;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.VPos;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.control.*;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TextField;
import javafx.scene.text.TextAlignment;
import sample.graphical.GraphicalObject;
import sample.graphical.entity.GraphicalPoint;

import java.awt.*;
import java.net.URL;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;

public class Controller implements Initializable {

    private static final double DRAW_RADIUS = 10.0D;

    Map<String, ObservableList<String>> objectsFields;
    Map<String, GraphicalObject> objectNamesToClassReference;
    GraphicalObject currentObject;

    List<GraphicalPoint> objectList;
    List<GraphicalPoint> copyObjectList;

    static final public int NEEDED_NUMBER_OF_POINTS_FOR_COUNTING = 2;
    static final public int OVER_LINE = 1;
    static final public int ON_LINE = 0;
    static final public int UNDER_LINE  = -1;

    public double ZOMM_COFF = 1.0;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        objectsFields = new HashMap<>();
        objectsFields.put("Point", GraphicalPoint.parametersToObservableList());

        objectNamesToClassReference = new HashMap<>();
        objectNamesToClassReference.put("Point", GraphicalPoint.builder().build());

        objectList = new ArrayList<>();
        copyObjectList = new ArrayList<>();
    }

    @FXML
    private Button highlightElementButton;

    @FXML
    private Button deleteElementButton;

    @FXML
    private Button editElementButton;

    @FXML
    private Button createElementButton;

    @FXML
    private Button setParameterValueButton;

    @FXML
    private Label parameterErrorField;

    @FXML
    private TextField parameterValueInput;

    @FXML
    private ListView<String> objectsPlacedList;

    @FXML
    private ListView<String> objectsToPlaceList;

    @FXML
    private ListView<String> objectsParametersList;

    @FXML
    private Canvas graphTable;

    @FXML
    private ScrollPane scrollPanel;

    // Данные координаты Х
    @FXML
    private TextField xValue;

    // Данные координаты Y
    @FXML
    private TextField yValue;

    // Кнопка для начала вычислений
    @FXML
    private Button getResultCounting;

    // Поле с координатами двух вычисленных точек
    @FXML
    private TextField resultCounting;

    // Кнопка очистки канваса от всех данных
    @FXML
    private Button clearAllButton;

    // Кнопка вернуться назад
    @FXML
    private Button comeBack;

    // Кнопка зуммирования больше
    @FXML
    private Button zoomInPictureButton;

    // КНопка меньше
    @FXML
    private Button zoomOutPictureButton;

    @FXML
    public void onComeBack() {
        comeBack.setOnAction(actionEvent -> {
            getCopyFunction();
            objectsPlacedList.setItems(
                    FXCollections.observableList(objectList.stream().map(Object::toString).collect(Collectors.toList())));
            redrawElements();
        });
    }

    // Копия создания дублежа
    @FXML
    public void createCopyFunction() {
        // Очистка массива дубляжей
        copyObjectList.clear();

        // Добавление всех элементов
        for (int tempNumOfObject = 0; tempNumOfObject < objectList.size(); tempNumOfObject++)
            copyObjectList.add(objectList.get(tempNumOfObject));
    }

    // Получение дублирующий копии в оригинал
    @FXML
    public void getCopyFunction() {
        // Очистка массива дубляжей
        objectList.clear();

        // Добавление всех элементов
        for (int tempNumOfObject = 0; tempNumOfObject < copyObjectList.size(); tempNumOfObject++)
            objectList.add(copyObjectList.get(tempNumOfObject));
    }

    @FXML
    public void onClearAllButton() {
        clearAllButton.setOnAction(event -> {
            createCopyFunction();

            objectList.clear();
            objectsPlacedList.setItems(
                    FXCollections.observableList(objectList.stream().map(Object::toString).collect(Collectors.toList())));
            redrawElements();
        });
    }

    // Зумирование изображения
    public void setZoomInPicture()
    {
        zoomInPictureButton.setOnAction(actionEvent ->
        {
            ZOMM_COFF *= 2;
            redrawElements();
        });
    }

    // Зумирование изображения
    public void setZoomOutPicture()
    {
        zoomOutPictureButton.setOnAction(actionEvent ->
        {
            ZOMM_COFF /= 2;
            redrawElements();
        });
    }

    @FXML
    public void onCreateCanvas() {

        scrollPanel.widthProperty().addListener(event -> {
            graphTable.setWidth(scrollPanel.getWidth());
            redrawElements();
        });
        scrollPanel.heightProperty().addListener(event -> {
            graphTable.setHeight(scrollPanel.getHeight());
            redrawElements();
        });

        GraphicsContext gc = graphTable.getGraphicsContext2D();



        // сетка
        gc.setLineWidth(.5);
        gc.setFontSmoothingType(null);
        gc.setLineDashes(5, 2);
        for (int i = 0; i < (scrollPanel.getWidth() - scrollPanel.getWidth() % (60 * ZOMM_COFF)) / 60 / ZOMM_COFF; i++) {
            gc.strokeLine(i * 60 * ZOMM_COFF, 0, i * 60 * ZOMM_COFF, scrollPanel.getHeight());
            gc.strokeLine(0, i * 60 * ZOMM_COFF, scrollPanel.getWidth(), i * 60 * ZOMM_COFF);
        }

        gc.setLineDashes(null);
        gc.setLineWidth(1);

        // числа
        gc.setTextAlign(TextAlignment.CENTER);

        for (int i = 0; i < (scrollPanel.getWidth() - scrollPanel.getWidth() % 60) / 60; i++) {
            if (i == 5) continue;
            gc.strokeText(String.valueOf((i * 60 - 300) / ZOMM_COFF), i * 60, 315);
        }
        gc.setTextBaseline(VPos.CENTER);
        gc.setTextAlign(TextAlignment.LEFT);
        for (int i = 0; i < (scrollPanel.getHeight() - scrollPanel.getHeight() % 60) / 60 + 1; i++) {
            if (i == 5) continue;
            gc.strokeText(String.valueOf((i * 60 - 300) / ZOMM_COFF), 310, i * 60);
        }

        gc.strokeLine(300, 0, 300, scrollPanel.getHeight());    // zero line
        gc.strokeLine(0, 300, scrollPanel.getWidth(), 300);    // zero line

        graphTable.setOnMouseClicked(event -> {
            double xMouseClickedPos = event.getX(), yMouseClickedPos = event.getY();

            gc.fillOval(xMouseClickedPos - DRAW_RADIUS / 2, yMouseClickedPos - DRAW_RADIUS / 2, DRAW_RADIUS, DRAW_RADIUS);

            GraphicalPoint tempPoint = new GraphicalPoint((xMouseClickedPos - DRAW_RADIUS / 2 - 300) / ZOMM_COFF,  (yMouseClickedPos - DRAW_RADIUS / 2 - 300) / ZOMM_COFF);

            createCopyFunction();

            objectList.add(tempPoint);

            objectsPlacedList.getItems().add(tempPoint.toString());


        });
    }

    @FXML
    public void onEditElement() {
        currentObject = objectList.get(objectsPlacedList.getSelectionModel().getSelectedIndex());
        List<String> stringList = new ArrayList<>();
        Arrays.stream(currentObject.getClass().getDeclaredFields())
                .forEach(field -> {
                    try {
                        field.setAccessible(true);
                        stringList.add(field.getName() + " = " + field.get(currentObject));
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    }
                });
        objectsParametersList.setItems(FXCollections.observableList(stringList));

        createElementButton.setText("Изменить");

        createElementButton.setOnAction(event -> {
            objectsPlacedList.getItems().set(objectsPlacedList.getSelectionModel().getSelectedIndex(), currentObject.toString());

            objectsParametersList.setItems(FXCollections.emptyObservableList());

            createElementButton.setText("Добавить");

            createElementButton.setOnAction(anotherEvent -> onDrawElement());

            redrawElements();

            createCopyFunction();
        });
    }

    // Удаление элемента
    @FXML
    public void obDeleteElement() {
        objectList.remove(objectsPlacedList.getSelectionModel().getSelectedIndex());
        objectsPlacedList.setItems(
                FXCollections.observableList(objectList.stream().map(Object::toString).collect(Collectors.toList())));

        redrawElements();

        createCopyFunction();
    }

    // Отрисовка элемента
    @FXML
    public void onDrawElement() {
        try {
            // Получения значений полей
            double tempXDoubleValue = Double.parseDouble(xValue.getText().trim());
            double tempYDoubleValue = Double.parseDouble(yValue.getText().trim());

            GraphicalPoint tempPoint = new GraphicalPoint(tempXDoubleValue, tempYDoubleValue);

            objectList.add(tempPoint);

            objectsPlacedList.getItems().add(tempPoint.toString());

            graphTable.getGraphicsContext2D().fillOval((tempXDoubleValue - DRAW_RADIUS / 2 + 300) / ZOMM_COFF, (tempYDoubleValue - DRAW_RADIUS / 2 + 300) / ZOMM_COFF, DRAW_RADIUS, DRAW_RADIUS);
        }
        catch (Exception e) {
            e.printStackTrace();
            parameterErrorField.setText("Допущена ошибка при вводе.");
        }
    }

    private void redrawElements() {
        graphTable.getGraphicsContext2D().clearRect(0, 0, graphTable.getWidth(), graphTable.getHeight());
        objectList.forEach(graphicalObject -> graphicalObject.draw(graphTable.getGraphicsContext2D(), ZOMM_COFF));
    }

    public double getOnLineStatus (double x1, double y1, double x2, double y2, double xTest, double yTest)
    {
        return (xTest - x1) * (y2 - y1) - (x2 - x1) * (yTest - y1);
    }



    // Вычисление позиции точки относительно двух выбранных точек
    public int getPointPosition(double x1, double y1, double x2, double y2, double xTest, double yTest)
    {
        if (getOnLineStatus(x1, y1, x2, y2, xTest, yTest) > 0)
            return OVER_LINE;
        else if (getOnLineStatus(x1, y1, x2, y2, xTest, yTest) < 0)
            return UNDER_LINE;
        System.out.println(">>>");
        System.out.println(x1);
        System.out.println(y1);
        System.out.println(x2);
        System.out.println(y2);
        System.out.println(xTest);
        System.out.println(yTest);
        System.out.println((xTest - x1));
        System.out.println(y2 - y1);
        System.out.println(x2 - x1);
        System.out.println(yTest - y1);
        System.out.println((xTest - x1) * (y2 - y1) - (x2 - x1) * (yTest - y1));
        System.out.println("<<<");
        return ON_LINE;
    }

    public double abs(double tempNumber){
        if (tempNumber < 0)
            return -tempNumber;
        return tempNumber;
    }

    // Вычисление необходимых двух точек и отрисовка
    @FXML
    public void countPointsComparator() {
        // Проверка на количество точек более двух
        if (objectList.stream().distinct().count() > NEEDED_NUMBER_OF_POINTS_FOR_COUNTING) {
            int tempFirstPoint = 0, tempSecondPoint = 1;

            int resultFirstPoint = tempFirstPoint, resultSecondPoint = tempSecondPoint;

            int sideDifference = 1000000;

            for (; tempFirstPoint < objectList.size() - 2; tempFirstPoint++) {
                for (tempSecondPoint = tempFirstPoint + 1; tempSecondPoint < objectList.size() - 1; tempSecondPoint++) {
                    int tempSideDifference = 0;

                    for (int tempTestPoint = tempSecondPoint + 1; tempTestPoint < objectList.size(); tempTestPoint++)
                        if (tempFirstPoint != tempSecondPoint && tempSecondPoint != tempTestPoint && tempTestPoint != tempFirstPoint)
                            tempSideDifference += getPointPosition(objectList.get(tempFirstPoint).getxValue(), objectList.get(tempFirstPoint).getyValue(), objectList.get(tempSecondPoint).getxValue(), objectList.get(tempSecondPoint).getyValue(), objectList.get(tempTestPoint).getxValue(), objectList.get(tempTestPoint).getyValue());


                    System.out.println(tempSideDifference);

                    if (abs(tempSideDifference) < abs(sideDifference)) {
                        resultFirstPoint = tempFirstPoint;
                        resultSecondPoint = tempSecondPoint;
                        sideDifference = tempSideDifference;
                    }
                }
            }

            // Печать необходимых точек
            resultCounting.setText("Точка: " +
                    "x=" + objectList.get(resultFirstPoint).getxValue() +
                    ", y=" + objectList.get(resultFirstPoint).getyValue() +
                    ";\n Точка: " +
                    "x=" + objectList.get(resultSecondPoint).getxValue() +
                    ", y=" + objectList.get(resultSecondPoint).getyValue());

            // Удаление предыдущей линии при наличии
            redrawElements();

            // Отрисовка линии, соединяющей найденные точки
            graphTable.getGraphicsContext2D().strokeLine(objectList.get(resultFirstPoint).getxValue() * ZOMM_COFF  + 300 + DRAW_RADIUS / 2 , objectList.get(resultFirstPoint).getyValue() * ZOMM_COFF + 300 + DRAW_RADIUS / 2,
                    objectList.get(resultSecondPoint).getxValue() * ZOMM_COFF + 300 + DRAW_RADIUS / 2, objectList.get(resultSecondPoint).getyValue() * ZOMM_COFF + 300 + DRAW_RADIUS / 2);
        }
        else
        {
            resultCounting.setText("Должно быть более трех точек.");
        }
    }
}
