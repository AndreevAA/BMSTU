package sample;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.VPos;
import javafx.scene.Scene;
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

public class Controller implements Initializable {

    private static final double DRAW_RADIUS = 10.0D;

    Map<String, ObservableList<String>> objectsFields;
    Map<String, GraphicalObject> objectNamesToClassReference;

    List<GraphicalObject> objectList;
    List<GraphicalObject> copyObjectList;


    static final public int NEEDED_NUMBER_OF_POINTS_FOR_COUNTING = 2;
    static final public int OVER_LINE = 1;
    static final public int ON_LINE = 0;
    static final public int UNDER_LINE  = -1;

    public double ZOMM_COFF = 1.0;
    public double START_CANVAS_X = 0;
    public double START_CANVAS_Y = 0;

    @FXML
    private ChoiceBox algType = new ChoiceBox();

    @FXML
    private ChoiceBox colorType = new ChoiceBox();

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        objectsFields = new HashMap<>();
        objectsFields.put("Point", GraphicalPoint.parametersToObservableList());

        objectNamesToClassReference = new HashMap<>();
        objectNamesToClassReference.put("Point", GraphicalPoint.builder().build());

        objectList = new ArrayList<>();
        copyObjectList = new ArrayList<>();

        algType.getItems().addAll("Алгоритм, использующий библиотечную функцию", "Алгоритм цифрового дифференциального анализатора",
                "Алгоритм Брезенхема с действительными данными", "Алгоритм Брезенхема с целочисленными данными", "Алгоритм Брезенхема с устранением ступенчатости",
                "Алгоритм Ву");

        colorType.getItems().addAll("Черный", "Красный", "Зеленый", "Серый", "Желтый", "Синий");
    }

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

    // Кнопка очистки канваса от всех данных
    @FXML
    private Button clearAllButton;

    // Кнопка вернуться назад
    @FXML
    private Button comeBack;

    // Данные о координатах, вокруг которых вращать
    @FXML
    private TextField tempRootPointValueX;

    @FXML
    private TextField tempRootPointValueY;

    @FXML
    private Button graphButton;

    @FXML
    private Button timeButton;

    @FXML
    private TextField stepInformation;

    public TextField tempRootPointValueX1, tempRootPointValueY1, tempRootPointValueX2, tempRootPointValueY2;


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

            redrawElements();
        });
    }



    public boolean isStepValid(double tempStep)
    {
        if (tempStep > 0)
            return true;
        return false;
    }

    @FXML
    public void onMoveCanvasUp()
    {
        try {
            double tempStep = Double.parseDouble(stepInformation.getText().trim());

            if (isStepValid(tempStep) == true)
            {
                START_CANVAS_Y -= tempStep;

                redrawElements();
            }
            else
                parameterErrorField.setText("Допущена ошибка при вводе данных шага (Положительное).");
        }
        catch (Exception e) {
            e.printStackTrace();
            parameterErrorField.setText("Допущена ошибка при вводе данных шага.");
        }
    }

    @FXML
    public void onMoveCanvasDown()
    {
        try {
            double tempStep = Double.parseDouble(stepInformation.getText().trim());

            if (isStepValid(tempStep) == true)
            {
                START_CANVAS_Y += tempStep;

                redrawElements();
            }
            else
                parameterErrorField.setText("Допущена ошибка при вводе данных шага (Положительное).");
        }
        catch (Exception e) {
            e.printStackTrace();
            parameterErrorField.setText("Допущена ошибка при вводе данных шага.");
        }
    }

    @FXML
    public void onMoveCanvasRight()
    {
        try {
            double tempStep = Double.parseDouble(stepInformation.getText().trim());

            if (isStepValid(tempStep) == true)
            {
                START_CANVAS_X += tempStep;

                redrawElements();
            }
            else
                parameterErrorField.setText("Допущена ошибка при вводе данных шага (Положительное).");
        }
        catch (Exception e) {
            e.printStackTrace();
            parameterErrorField.setText("Допущена ошибка при вводе данных шага.");
        }
    }

    @FXML
    public void onMoveCanvasLeft()
    {
        try {
            double tempStep = Integer.parseInt(stepInformation.getText().trim());

            if (isStepValid(tempStep) == true)
            {
                START_CANVAS_X -= tempStep;

                redrawElements();
            }
            else
                parameterErrorField.setText("Допущена ошибка при вводе данных шага (Положительное).");
        }
        catch (Exception e) {
            e.printStackTrace();
            parameterErrorField.setText("Допущена ошибка при вводе данных шага.");
        }
    }

    @FXML
    public void onCreateCanvas()
    {
        scrollPanel.widthProperty().addListener(event -> {
            graphTable.setWidth(scrollPanel.getWidth());
            redrawElements();
        });

        scrollPanel.heightProperty().addListener(event -> {
            graphTable.setHeight(scrollPanel.getHeight());
            redrawElements();
        });
    }

    // Отрисовка линий
    private void drawLinesCanvas(GraphicsContext gc)
    {
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
    }

    // Отрисовка чисел
    private void drawNumbersCanvas(GraphicsContext gc)
    {
        // числа
        gc.setTextAlign(TextAlignment.CENTER);

        for (int i = 0; i < (scrollPanel.getWidth() - scrollPanel.getWidth() % 60) / 60; i++)
            gc.strokeText(String.valueOf((i * 60 - 300 + START_CANVAS_X) / ZOMM_COFF), i * 60, 315 - START_CANVAS_Y);

        gc.setTextBaseline(VPos.CENTER);
        gc.setTextAlign(TextAlignment.LEFT);

        for (int i = 0; i < (scrollPanel.getHeight() - scrollPanel.getHeight() % 60) / 60 + 1; i++)
            gc.strokeText(String.valueOf((i * 60 - 300 + START_CANVAS_Y) / ZOMM_COFF), 310 - START_CANVAS_X, i * 60);
    }

    // Отрисовка нулевых линий
    private void drawZeroLines(GraphicsContext gc)
    {
        gc.strokeLine(300 - START_CANVAS_X, 0, 300 - START_CANVAS_X, scrollPanel.getHeight());    // zero line
        gc.strokeLine(0, 300 - START_CANVAS_Y, scrollPanel.getWidth(), 300 - START_CANVAS_Y);    // zero line
    }

    // Отрисовка сетки и чисел
    private void drawCanvasMaterials()
    {
        GraphicsContext gc = graphTable.getGraphicsContext2D();

        //drawLinesCanvas(gc);
        //drawNumbersCanvas(gc);
        //drawZeroLines(gc);
    }

    // Перерисовка элементов экрана
    private void redrawElements()
    {
        System.out.println("Элементы перерисованы!");

        graphTable.getGraphicsContext2D().clearRect(0, 0, graphTable.getWidth(), graphTable.getHeight());
        objectList.forEach(graphicalObject -> graphicalObject.draw(graphTable.getGraphicsContext2D()));

        drawCanvasMaterials();
    }

    @FXML
    double getTempRootPointValueX()
    {
        return Double.parseDouble(tempRootPointValueX.getText().trim());
    }

    @FXML
    double getTempRootPointValueY()
    {
        return Double.parseDouble(tempRootPointValueY.getText().trim());
    }


    private void setStandartFunctionLine(int firstX, int firstY, int secondX, int secondY, Color lineColor){
        GraphicalLine line =  new GraphicalLine(firstX, firstY, secondX, secondY, lineColor);
        line.draw(graphTable.getGraphicsContext2D());
        objectList.add(line);
        redrawElements();
    }

    private void setDigitAnalizatorFunctionLine(int firstX, int firstY, int secondX, int secondY, Color lineColor){
        GraphicalDigitalAnalizerLinePixel graphicalDigitalAnalizerLinePixel = new GraphicalDigitalAnalizerLinePixel(firstX, firstY, secondX, secondY, lineColor);
        objectList.add(graphicalDigitalAnalizerLinePixel);
        redrawElements();
    }

    private void setBrezDoubleFunctionLine(int firstX, int firstY, int secondX, int secondY, Color lineColor)
    {
        BrezDoubleFunctionLinePixel brezDoubleFunctionLinePixel = new BrezDoubleFunctionLinePixel(firstX, firstY, secondX, secondY, lineColor);
        objectList.add(brezDoubleFunctionLinePixel);
        redrawElements();
    }

    private void setBrezIntegerFunctionLine(int firstX, int firstY, int secondX, int secondY, Color lineColor)
    {
        BrezIntegerFunctionLinePixel brezIntegerFunctionLinePixel = new BrezIntegerFunctionLinePixel(firstX, firstY, secondX, secondY, lineColor);
        objectList.add(brezIntegerFunctionLinePixel);
        redrawElements();
    }

    private void setBrezStupFunctionLine(int firstX, int firstY, int secondX, int secondY, Color lineColor)
    {
        BrezStupFunctionLinePixel brezStupFunctionLinePixel = new BrezStupFunctionLinePixel(firstX, firstY, secondX, secondY, lineColor);
        objectList.add(brezStupFunctionLinePixel);
        redrawElements();
    }

    private void setVuFunctionLine(int firstX, int firstY, int secondX, int secondY, Color lineColor)
    {
        VuFunctionLinePixel vuFunctionLinePixel = new VuFunctionLinePixel(firstX, firstY, secondX, secondY, lineColor);
        objectList.add(vuFunctionLinePixel);
        redrawElements();
    }

    Color getColor(String tempColorStatus)
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

    private void graphComparator() {
        if (algType.getValue() != null && colorType.getValue() != null)
        {
            String tempAlgStatus = algType.getValue().toString();
            Color lineColor = getColor(colorType.getValue().toString());

            int firstX = (Integer.parseInt(tempRootPointValueX1.getText())), firstY =(Integer.parseInt(tempRootPointValueY1.getText()));
            int secondX = (Integer.parseInt(tempRootPointValueX2.getText())), secondY = (Integer.parseInt(tempRootPointValueY2.getText()));

            if (tempAlgStatus == "Алгоритм, использующий библиотечную функцию")
                setStandartFunctionLine(firstX, firstY, secondX, secondY, lineColor);
            else if (tempAlgStatus == "Алгоритм цифрового дифференциального анализатора")
                setDigitAnalizatorFunctionLine(firstX, firstY, secondX, secondY, lineColor);
            else if (tempAlgStatus == "Алгоритм Брезенхема с действительными данными")
                setBrezDoubleFunctionLine(firstX, firstY, secondX, secondY, lineColor);
            else if (tempAlgStatus == "Алгоритм Брезенхема с целочисленными данными")
                setBrezIntegerFunctionLine(firstX, firstY, secondX, secondY, lineColor);
            else if (tempAlgStatus == "Алгоритм Брезенхема с устранением ступенчатости")
                setBrezStupFunctionLine(firstX, firstY, secondX, secondY, lineColor);
            else if (tempAlgStatus == "Алгоритм Ву")
                setVuFunctionLine(firstX, firstY, secondX, secondY, lineColor);

            System.out.print(tempAlgStatus);
        }
    }

    @FXML
    public void onGraph() {
        graphButton.setOnAction(actionEvent -> {

            try {
                graphComparator();
            }
            catch (Exception e) {
                e.printStackTrace();
                parameterErrorField.setText("Допущена ошибка.");
            }
        });
    }

    private long getTimeOfWorkingFunctionDrawingLine(int startCoordinate, int endCoordinate, int stepOfCountingCoordinates, int typeOfAlg)
    {
        long startTime = System.nanoTime();
        if (typeOfAlg == 0) {
            GraphicalLine line = new GraphicalLine(startCoordinate, endCoordinate, startCoordinate, endCoordinate, Color.RED);
        }
        else if (typeOfAlg == 1) {
            GraphicalDigitalAnalizerLinePixel graphicalDigitalAnalizerLinePixel = new GraphicalDigitalAnalizerLinePixel(startCoordinate, endCoordinate, startCoordinate, endCoordinate, Color.RED);
        }
        else if (typeOfAlg == 2){
            BrezDoubleFunctionLinePixel brezDoubleFunctionLinePixel = new BrezDoubleFunctionLinePixel(startCoordinate, endCoordinate, startCoordinate, endCoordinate, Color.RED);
        }
        else if (typeOfAlg == 3){
            BrezIntegerFunctionLinePixel brezIntegerFunctionLinePixel = new BrezIntegerFunctionLinePixel(startCoordinate, endCoordinate, startCoordinate, endCoordinate, Color.RED);
        }
        else if (typeOfAlg == 4){
            BrezStupFunctionLinePixel brezStupFunctionLinePixel = new BrezStupFunctionLinePixel(startCoordinate, endCoordinate, startCoordinate, endCoordinate, Color.RED);
        }
        else if (typeOfAlg == 5){
            VuFunctionLinePixel vuFunctionLinePixel = new VuFunctionLinePixel(startCoordinate, endCoordinate, startCoordinate, endCoordinate, Color.RED);
        }
        long endTime = System.nanoTime();
        return endTime - startTime;
    }

    @FXML
    private void onShowHistogramStats(long startStandartFunctionLineTime, long graphicalDigitalAnalizerLinePixelFunctionLineTime, long brezDoubleFunctionLinePixelFunctionLineTime,
                                      long brezIntegerFunctionLinePixel, long brezStupFunctionLinePixel, long vuFunctionLinePixel) {
        final BarChart<Number, String> barChart =
                new BarChart<>(new NumberAxis(), new CategoryAxis());
        barChart.setCategoryGap(0);
        barChart.setBarGap(0);

        XYChart.Series<Number, String> series = new XYChart.Series<>();
        series.setName("Сравнение времени работы алгоритмов");

        series.getData().add(new XYChart.Data<>(startStandartFunctionLineTime, "Алгоритм, использующий библиотечную функцию"));
        series.getData().add(new XYChart.Data<>(graphicalDigitalAnalizerLinePixelFunctionLineTime, "Алгоритм цифрового дифференциального анализатора"));
        series.getData().add(new XYChart.Data<>(brezDoubleFunctionLinePixelFunctionLineTime, "Алгоритм Брезенхема с действительными данными"));
        series.getData().add(new XYChart.Data<>(brezIntegerFunctionLinePixel, "Алгоритм Брезенхема с целочисленными данными"));
        series.getData().add(new XYChart.Data<>(brezStupFunctionLinePixel, "Алгоритм Брезенхема с устранением ступенчатости"));
        series.getData().add(new XYChart.Data<>(vuFunctionLinePixel, "Алгоритм Ву"));

        barChart.getData().add(series);

        VBox vBox = new VBox();
        vBox.getChildren().addAll(barChart);

        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Сравнение времени работы алгоритмов");
        alert.setHeaderText(null);
        alert.setGraphic(vBox);

        alert.showAndWait();
    }

    @FXML
    private void getTime()
    {
        int startCoordinate = 0, endCoordinate = 1000, stepOfCountingCoordinates = 100;

        timeButton.setOnAction(actionEvent -> {
            long startStandartFunctionLineTime = getTimeOfWorkingFunctionDrawingLine(startCoordinate, endCoordinate, stepOfCountingCoordinates, 0);
            long graphicalDigitalAnalizerLinePixelFunctionLineTime = getTimeOfWorkingFunctionDrawingLine(startCoordinate, endCoordinate, stepOfCountingCoordinates, 1);
            long brezDoubleFunctionLinePixelFunctionLineTime = getTimeOfWorkingFunctionDrawingLine(startCoordinate, endCoordinate, stepOfCountingCoordinates, 2);
            long brezIntegerFunctionLinePixel = getTimeOfWorkingFunctionDrawingLine(startCoordinate, endCoordinate, stepOfCountingCoordinates, 3);
            long brezStupFunctionLinePixel = getTimeOfWorkingFunctionDrawingLine(startCoordinate, endCoordinate, stepOfCountingCoordinates, 4);
            long vuFunctionLinePixel = getTimeOfWorkingFunctionDrawingLine(startCoordinate, endCoordinate, stepOfCountingCoordinates, 5);

            onShowHistogramStats(startStandartFunctionLineTime, graphicalDigitalAnalizerLinePixelFunctionLineTime, brezDoubleFunctionLinePixelFunctionLineTime,
                    brezIntegerFunctionLinePixel, brezStupFunctionLinePixel, vuFunctionLinePixel);
        });
    }
}
