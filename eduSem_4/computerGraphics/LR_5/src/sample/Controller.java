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
import sample.graphical.formations.*;

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
import static sample.graphical.entity.GraphicalProcessing.graphProcessing;
import static sample.graphical.formations.TimeRecording.getTimeOfWorkingFunctionDrawingLine;
import static sample.graphical.formations.TimeRecording.onShowHistogramStats;

public class Controller implements Initializable {

    private final double DRAW_RADIUS = 10.0D;

    Map<String, ObservableList<String>> objectsFields;
    Map<String, GraphicalObject> objectNamesToClassReference;

    List<GraphicalObject> objectList;

    List<GraphicalPoint> tempFigure;

    List<List<GraphicalPoint>> allFigures;

    List<ColoredPixel> pixelList;

    List<GraphicalObject> copyObjectList;


    final public int NEEDED_NUMBER_OF_POINTS_FOR_COUNTING = 2;
    final public int OVER_LINE = 1;
    final public int ON_LINE = 0;
    final public int UNDER_LINE  = -1;

    public double ZOMM_COFF = 1.0;
    public double START_CANVAS_X = 0;
    public double START_CANVAS_Y = 0;

    // Координаты предыдущей точки
    public double previousCoordinateX = -1, previousCoordinateY = -1;

    @FXML
    private ChoiceBox timeDelayType = new ChoiceBox(), colorFillingType = new ChoiceBox();

    public Controller() {
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        objectsFields = new HashMap<>();
        objectsFields.put("Point", GraphicalPoint.parametersToObservableList());

        objectNamesToClassReference = new HashMap<>();
        objectNamesToClassReference.put("Point", GraphicalPoint.builder().build());

        objectList = new ArrayList<>();

        // Массив точек текущей фигуры
        tempFigure = new ArrayList<>();

        // Массив всех фигур
        allFigures = new ArrayList<>();

        // Массив пикселей
        pixelList = new ArrayList<>();

        allEdges = new ArrayList<>();
        allColoredPoints = new ArrayList<>();
        copyObjectList = new ArrayList<>();

        timeDelayType.getItems().addAll("С задержкой",
                "Без задержки");

        colorFillingType.getItems().addAll("Черный", "Красный", "Зеленый", "Серый", "Желтый", "Синий");
    }

    @FXML
    private Label parameterErrorField, workingTime;

    @FXML
    private ListView<String> objectsPlacedList, objectsToPlaceList;

    @FXML
    private List <EdgeIm> allEdges;

    @FXML
    private  List <ColoredPoints> allColoredPoints;

    @FXML
    private Canvas graphTable;

    @FXML
    private Button addFigureButton;

    @FXML
    private ScrollPane scrollPanel;

    @FXML Button graphCircleButton, graphOvalButton, spectrCircleButton, spectrOvalButton;

    // Кнопка очистки канваса от всех данных и возврат обратно
    @FXML
    private Button clearAllButton, comeBack, fillButton;

    int numberOfVertex = 0;

    @FXML
    public void onComeBack() {
        comeBack.setOnAction(actionEvent -> {
            getCopyFunction();
            objectsPlacedList.setItems(
                    FXCollections.observableList(objectList.stream().map(Object::toString).collect(Collectors.toList())));
            redrawElements(graphTable, objectList);
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

            redrawElements(graphTable, objectList);

            previousCoordinateX = -1;
            previousCoordinateY = -1;

            numberOfVertex = 0;
        });
    }

    @FXML
    public void onCreateCanvas()
    {
        scrollPanel.widthProperty().addListener(event -> {
            graphTable.setWidth(scrollPanel.getWidth());
            redrawElements(graphTable, objectList);
        });

        scrollPanel.heightProperty().addListener(event -> {
            graphTable.setHeight(scrollPanel.getHeight());
            redrawElements(graphTable, objectList);
        });

        graphTable.setOnMouseClicked(event -> {
            double xMouseClickedPos = event.getX(), yMouseClickedPos = event.getY();

            // Отрисовка поставленной точки
            GraphicalPoint tempPoint = new GraphicalPoint(xMouseClickedPos, yMouseClickedPos, Color.BLACK);
            objectList.add(tempPoint);

            if (tempFigure.size() != 0)
            {
                // Отрисовка линии
                GraphicalLine tempLine = new GraphicalLine(tempFigure.get(tempFigure.size() - 1).xValue, tempFigure.get(tempFigure.size() - 1).yValue,
                        xMouseClickedPos, yMouseClickedPos, Color.BLACK);
                objectList.add(tempLine);
            }

            // Добавление точки к текущей фигуре
            tempFigure.add(tempPoint);

            createCopyFunction();

            redrawElements(graphTable, objectList);
        });
    }

    // Перерисовка элементов экрана
    private void redrawElements(Canvas graphTable, List<GraphicalObject> objectList)
    {
        graphTable.getGraphicsContext2D().clearRect(0, 0, graphTable.getWidth(), graphTable.getHeight());
        objectList.forEach(graphicalObject -> graphicalObject.draw(graphTable.getGraphicsContext2D()));
    }

    // Отрисовка линии
    List <GraphicalObject> addLine(List <GraphicalObject> objectList, double firstX, double firstY, double secondX, double secondY, Color tempolor)
    {
        // Создание линии
        GraphicalLine tempLine = new GraphicalLine(firstX, firstY, secondX, secondY, tempolor);

         // Добавление линии
        objectList.add(tempLine);

        redrawElements(graphTable, objectList);

        return objectList;
    }

    // Добавление грани
    List <EdgeIm> addEdge(List <EdgeIm> allEdges, double firstX, double firstY, double secondX, double secondY, boolean isUsed)
    {
        // Создание грани
        EdgeIm tempEdge = new EdgeIm(previousCoordinateX, previousCoordinateY, allEdges.get(0).startX, allEdges.get(0).startY, false);

        // Добавление последней грани грани
        allEdges.add(tempEdge);

        redrawElements(graphTable, objectList);

        return allEdges;
    }

    double getCoordinateBorderX(List <EdgeIm> allEdges)
    {
        double minCoordinateBorderX = allEdges.get(0).startX, maxCoordinateBorderX = allEdges.get(0).startX;

        for (int tempNumberOfEdge = 1; tempNumberOfEdge < numberOfVertex; tempNumberOfEdge++)
        {
            //System.out.println(allEdges.get(tempNumberOfEdge).startX);

            if (minCoordinateBorderX > allEdges.get(tempNumberOfEdge).startX)
                minCoordinateBorderX = allEdges.get(tempNumberOfEdge).startX;

            if (maxCoordinateBorderX < allEdges.get(tempNumberOfEdge).startX)
                maxCoordinateBorderX = allEdges.get(tempNumberOfEdge).startX;
        }

        //System.out.println("Разделитель: " + minCoordinateBorderX + " " + maxCoordinateBorderX);

        return (maxCoordinateBorderX + minCoordinateBorderX) * 0.5;
    }

    // Поиск самой левой неиспользованной наклонной
    int getLeftestEdgeNumber()
    {
        int leftestEdgeNumber = -1;

        double minCoordinateBorderX = allEdges.get(0).startX;

        for (int tempNumberOfEdge = 0; tempNumberOfEdge < numberOfVertex; tempNumberOfEdge++)
        {
            if (minCoordinateBorderX > allEdges.get(tempNumberOfEdge).startX && !allEdges.get(tempNumberOfEdge).isUsed)
            {
                minCoordinateBorderX = allEdges.get(tempNumberOfEdge).startX;
                leftestEdgeNumber = tempNumberOfEdge;
            }
        }

        return leftestEdgeNumber;
    }

    // Рефакторинг данных
    public void refactorEdges()
    {
        for (int tempNumberOfEdge = 0; tempNumberOfEdge < numberOfVertex; tempNumberOfEdge++)
        {
            if (allEdges.get(tempNumberOfEdge).endX < allEdges.get(tempNumberOfEdge).startX)
            {
                double tempStartX = allEdges.get(tempNumberOfEdge).endX, tempStartY = allEdges.get(tempNumberOfEdge).endY;
                double tempEndX = allEdges.get(tempNumberOfEdge).startX, tempEndY = allEdges.get(tempNumberOfEdge).startY;

                EdgeIm tempEdge = new EdgeIm(tempStartX, tempStartY, tempEndX, tempEndY, allEdges.get(tempNumberOfEdge).isUsed);

                allEdges.set(tempNumberOfEdge, tempEdge);
            }
        }
    }

    boolean isPointExist(int tempCoordinateX, int tempPointCoordinateY)
    {
        for (int tempNumberOfPoint = 0; tempNumberOfPoint < allColoredPoints.size(); tempNumberOfPoint++)
        {
            if (allColoredPoints.get(tempNumberOfPoint).coordinateX == tempCoordinateX &&
                    allColoredPoints.get(tempNumberOfPoint).coordinateY == tempPointCoordinateY)
                return true;
        }

        return false;
    }

    private int getNumberOfColoredPoint(int tempCoordinateX, int tempPointCoordinateY)
    {
        int tempNumberOfPoint = 0;

        for (; tempNumberOfPoint < allColoredPoints.size(); tempNumberOfPoint++)
        {
            if (allColoredPoints.get(tempNumberOfPoint).coordinateX == tempCoordinateX &&
                    allColoredPoints.get(tempNumberOfPoint).coordinateY == tempPointCoordinateY)
                return tempNumberOfPoint;
        }

        return tempNumberOfPoint;
    }

//    public void reverseColor(Color tempColor, int tempLeftestEdgeNumber, double coordinateBorderX) throws InterruptedException {
//        EdgeIm tempEdge = allEdges.get(tempLeftestEdgeNumber);
//
//        System.out.println((int) tempEdge.startY + " -> " + tempEdge.endY + " ");
//
//        int yStepper = 1;
//
//        if (tempEdge.startY > tempEdge.endY)
//            yStepper = -1;
//
//        for (int tempCoordinateY = (int) tempEdge.startY; tempCoordinateY < tempEdge.endY; tempCoordinateY += yStepper)
//        {
//            int tempCoordinateX = (int) ((tempCoordinateY - tempEdge.startY) *
//                    (tempEdge.endX - tempEdge.startX) / (tempEdge.endY - tempEdge.startY) + tempEdge.startX);
//
//            for (; tempCoordinateX < coordinateBorderX; tempCoordinateX++)
//            {
//
//                System.out.println("(" + tempCoordinateX + ", " + tempCoordinateY + "), " + coordinateBorderX);
//
//                graphTable.getGraphicsContext2D().getPixelWriter().setColor(tempCoordinateX, tempCoordinateY, Color.BLACK);
//
//                //redrawElements(graphTable, objectList);
//            }
//        }
//    }

    boolean isAvailiableEdges(double coordinateBorderX)
    {
        for (int tempNumberOfEdge = 0; tempNumberOfEdge < numberOfVertex; tempNumberOfEdge++)
            if (allEdges.get(tempNumberOfEdge).startX < coordinateBorderX && !allEdges.get(tempNumberOfEdge).isUsed)
                return true;

        return false;
    }

    int getPixelInPixelListPosition(List <ColoredPixel> pixelList, int pixelNumberX, int pixelNumberY){
        int pixelInPixelListPosition = -1;

        for (int pixelNumber = 0; pixelNumber < pixelList.size(); pixelNumber++){
            ColoredPixel tempPixel = pixelList.get(pixelNumber);

            if (tempPixel.coordinateX == pixelNumberX && tempPixel.coordinateY == pixelNumberY)
                return pixelNumber;
        }

        return pixelInPixelListPosition;
    }

    public static Color getColor(Node n, double x, double y, WritableImage WI, SnapshotParameters SP, PixelReader PR)
    {
        synchronized (WI)
        {
            Rectangle2D r = new Rectangle2D(x, y, 1, 1);
            SP.setViewport(r);
            n.snapshot(SP, WI);
            return PR.getColor(0, 0);
        }
    }

    // Закрашивание области между двумя точками
    private void colorField(GraphicalPoint firstPoint, GraphicalPoint secondPoint, int borderPosition, Color endColor)
    {
//        SnapshotParameters SP = new SnapshotParameters();
//        WritableImage WI = new WritableImage(1, 1);
//        PixelReader PR = WI.getPixelReader();
//
//        Color backgroundColor = getColor(graphTable, 10, 10, WI, SP, PR);

        int yStep = 1;

        if (firstPoint.yValue > secondPoint.yValue)
            yStep = -1;

        for (int pixelNumberY = (int) ceil(firstPoint.yValue); yStep * pixelNumberY <= yStep * (int) floor(secondPoint.yValue); pixelNumberY += yStep){

            int pixelNumberX = ((pixelNumberY - (int) firstPoint.yValue) *
                    ((int) secondPoint.xValue - (int) firstPoint.xValue) / ((int) secondPoint.yValue - (int) firstPoint.yValue) + (int) firstPoint.xValue);

            for (; pixelNumberX <= borderPosition; pixelNumberX++) {
                int pixelInPixelListPosition = getPixelInPixelListPosition(pixelList, pixelNumberX, pixelNumberY);

                if (pixelInPixelListPosition == -1) {
                    pixelList.add(new ColoredPixel(pixelNumberX, pixelNumberY, endColor));
                    graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, endColor);
                }
                else {
                    if (pixelList.get(pixelInPixelListPosition).tempColor == Color.rgb(244,244,244)){
                        pixelList.get(pixelInPixelListPosition).tempColor = endColor;
                        graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, endColor);
                    }
                    else{
                        pixelList.get(pixelInPixelListPosition).tempColor = Color.rgb(244,244,244);
                        graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, Color.rgb(244,244,244));
                    }
                }

//                SP = new SnapshotParameters();
//                WI = new WritableImage(1, 1);
//                PR = WI.getPixelReader();
//
//                Color tempPixelColor = getColor(graphTable, pixelNumberX, pixelNumberY, WI, SP, PR), finalColor;
//
//                if (tempPixelColor == endColor)
//                    finalColor = backgroundColor;
//                else
//                    finalColor = endColor;
//
//                graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, finalColor);
            }
        }

        for (int pixelNumberY = (int) floor(firstPoint.yValue); yStep * pixelNumberY <= yStep * (int) floor(secondPoint.yValue); pixelNumberY += yStep){

            int pixelNumberX = ((pixelNumberY - (int) firstPoint.yValue) *
                    ((int) secondPoint.xValue - (int) firstPoint.xValue) / ((int) secondPoint.yValue - (int) firstPoint.yValue) + (int) firstPoint.xValue);

            for (; pixelNumberX > borderPosition; pixelNumberX--) {

//                SP = new SnapshotParameters();
//                WI = new WritableImage(1, 1);
//                PR = WI.getPixelReader();
//
//                Color tempPixelColor = getColor(graphTable, pixelNumberX, pixelNumberY, WI, SP, PR), finalColor;
//
//                if (tempPixelColor == endColor)
//                    finalColor = backgroundColor;
//                else
//                    finalColor = endColor;
//
//                graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, finalColor);

                int pixelInPixelListPosition = getPixelInPixelListPosition(pixelList, pixelNumberX, pixelNumberY);

                if (pixelInPixelListPosition == -1) {
                    pixelList.add(new ColoredPixel(pixelNumberX, pixelNumberY, endColor));
                    graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, endColor);
                }
                else {
                    if (pixelList.get(pixelInPixelListPosition).tempColor == Color.rgb(244,244,244)){
                        pixelList.get(pixelInPixelListPosition).tempColor = endColor;
                        graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, endColor);
                    }
                    else{
                        pixelList.get(pixelInPixelListPosition).tempColor = Color.rgb(244,244,244);
                        graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, Color.rgb(244,244,244));
                    }
                }
            }
        }
    }

    // Получение позиции границы
    public int getBorderPosition(List<GraphicalPoint> pointList){
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

    // Заполнение многоугольника
    public void fillSquare(List<GraphicalPoint> pointList, Color tempColor) throws InterruptedException {

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
                colorField(firstPoint, secondPoint, borderPosition, tempColor);
            else
                colorField(secondPoint, firstPoint, borderPosition, tempColor);
        }
    }

    boolean isFigureAvailiableToCreate(List<GraphicalPoint>tempFigure){
        if (tempFigure.size() >= 3)
            return true;
        return false;
    }

    // Добавление фигуры
    public List <GraphicalPoint> addFigure(List <List <GraphicalPoint> > allFigures,
                          List <GraphicalPoint> tempFigure){
        allFigures.add(tempFigure);
        return new ArrayList<>();
    }

    @FXML
    public void onAddFigure() {

        // Нажатие на кнопку Замкнуть
        addFigureButton.setOnAction(actionEvent -> {
           if (isFigureAvailiableToCreate(tempFigure)) {
               objectList = addLine(objectList, tempFigure.get(0).xValue, tempFigure.get(0).yValue, tempFigure.get(tempFigure.size() - 1).xValue, tempFigure.get(tempFigure.size() - 1).yValue, Color.BLACK);
               tempFigure = addFigure(allFigures, tempFigure);
           }
        });
    }

    public boolean isAllFiguresAvailiableToBeFilles(List <List <GraphicalPoint> > allFigures){
        if (allFigures.size() != 0)
            return true;
        return false;
    }

    @FXML
    public void onFill() {

        // Нажатие операции над Окружностью
        fillButton.setOnAction(actionEvent -> {
            if (isAllFiguresAvailiableToBeFilles(allFigures))
                for (int numberOfFigure = 0; numberOfFigure < allFigures.size(); numberOfFigure++) {
                    try {
                        fillSquare(allFigures.get(numberOfFigure), CanvasOperations.getColor(colorFillingType.getValue().toString()));
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
        });
    }
}
