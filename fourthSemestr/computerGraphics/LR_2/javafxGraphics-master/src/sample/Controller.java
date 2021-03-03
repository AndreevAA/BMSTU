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
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;
import sample.graphical.GraphicalObject;
import sample.graphical.entity.GraphicalPoint;

import javax.imageio.ImageIO;
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

    // Кнопка вращения
    @FXML
    private Button turnButton;

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

    // Данные о угле
    @FXML
    private TextField angleOfRotationValue;

    // Данные о координатах, вокруг которых вращать
    @FXML
    private TextField tempRootPointValueX;

    @FXML
    private TextField tempRootPointValueY;

    @FXML
    private Button getFromFileButton;

    @FXML
    private TextField stepInformation;

    @FXML
        private TextField zoomSize;

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

    public boolean isTempZoomSizeValid(double tempZoomSize)
    {
        if (tempZoomSize < 100 && tempZoomSize > 0.001)
            return true;
        return false;
    }

    @FXML
    public void setZoomInPic()
    {
        try {
            double tempZoomSize = Double.parseDouble(zoomSize.getText().trim());

            if (isTempZoomSizeValid(tempZoomSize) == true)
            {
                for (int tempCur = 0; tempCur < objectList.size(); tempCur++)
                {
                    double updatedGraphicalPointValueX = objectList.get(tempCur).getxValue() * tempZoomSize;
                    objectList.get(tempCur).setxValue(updatedGraphicalPointValueX);

                    double updatedGraphicalPointValueY = objectList.get(tempCur).getyValue() * tempZoomSize;
                    objectList.get(tempCur).setyValue(updatedGraphicalPointValueY);
                }

                redrawElements();
            }
            else
                parameterErrorField.setText("Допущена ошибка при вводе зуммации.");
        }
        catch (Exception e) {
            e.printStackTrace();
            parameterErrorField.setText("Допущена ошибка при вводе зуммации.");
        }
    }

    @FXML
    public void setZoomOutPic()
    {
        try {
            double tempZoomSize = Double.parseDouble(zoomSize.getText().trim());

            if (isTempZoomSizeValid(tempZoomSize) == true)
            {
                for (int tempCur = 0; tempCur < objectList.size(); tempCur++)
                {
                    double updatedGraphicalPointValueX = objectList.get(tempCur).getxValue() / tempZoomSize;
                    objectList.get(tempCur).setxValue(updatedGraphicalPointValueX);

                    double updatedGraphicalPointValueY = objectList.get(tempCur).getyValue() / tempZoomSize;
                    objectList.get(tempCur).setyValue(updatedGraphicalPointValueY);
                }

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

    // Перемещение рисунка вверх
    @FXML
    public void onUpPicButton()
    {

    }

    public boolean isStepValid(double tempStep)
    {
        if (tempStep > 0)
            return true;
        return false;
    }

    @FXML
    public void onMovePicUp()
    {
        try {
            double tempStep = Double.parseDouble(stepInformation.getText().trim());

            if (isStepValid(tempStep) == true)
            {
                for (int tempCur = 0; tempCur < objectList.size(); tempCur++)
                {
                    double updatedGraphicalPointValueY = objectList.get(tempCur).getyValue() - tempStep;
                    objectList.get(tempCur).setyValue(updatedGraphicalPointValueY);
                }

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
    public void onMovePicDown()
    {
        try {
            double tempStep = Double.parseDouble(stepInformation.getText().trim());

            if (isStepValid(tempStep) == true)
            {
                for (int tempCur = 0; tempCur < objectList.size(); tempCur++)
                {
                    double updatedGraphicalPointValueY = objectList.get(tempCur).getyValue() + tempStep;
                    objectList.get(tempCur).setyValue(updatedGraphicalPointValueY);
                }

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
    public void onMovePicRight()
    {
        try {
            double tempStep = Double.parseDouble(stepInformation.getText().trim());

            if (isStepValid(tempStep) == true)
            {
                for (int tempCur = 0; tempCur < objectList.size(); tempCur++)
                {
                    double updatedGraphicalPointValueX = objectList.get(tempCur).getxValue() + tempStep;
                    objectList.get(tempCur).setxValue(updatedGraphicalPointValueX);
                }

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
    public void onMovePicLeft()
    {
        try {
            double tempStep = Double.parseDouble(stepInformation.getText().trim());

            if (isStepValid(tempStep) == true)
            {
                for (int tempCur = 0; tempCur < objectList.size(); tempCur++)
                {
                    double updatedGraphicalPointValueX = objectList.get(tempCur).getxValue() - tempStep;
                    objectList.get(tempCur).setxValue(updatedGraphicalPointValueX);
                }

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
    public void onMoveCanvasUp()
    {

    }

    @FXML
    public void onMoveCanvasDown()
    {

    }

    @FXML
    public void onMoveCanvasRight()
    {

    }

    @FXML
    public void onMoveCanvasLeft()
    {

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

        graphTable.setOnMouseClicked(event -> {
            double xMouseClickedPos = event.getX(), yMouseClickedPos = event.getY();

            tempRootPointValueX.setText(String.valueOf((xMouseClickedPos - DRAW_RADIUS / 2 - 300) / ZOMM_COFF));
            tempRootPointValueY.setText(String.valueOf((yMouseClickedPos - DRAW_RADIUS / 2 - 300) / ZOMM_COFF));

            createCopyFunction();
        });
    }

    // Перерисовка элементов экрана
    private void redrawElements()
    {
        graphTable.getGraphicsContext2D().clearRect(0, 0, graphTable.getWidth(), graphTable.getHeight());
        objectList.forEach(graphicalObject -> graphicalObject.draw(graphTable.getGraphicsContext2D(), ZOMM_COFF));


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
    }

    // Получение переверенутой на угол angleOfRotationValue точки по Х
    @FXML
    public double getTempPointRotatedByX(double t, double x, double y, double i, double j)
    {
        return i + (x - i) * Math.cos(t) - (y - j) * Math.sin(t);
    }

    // Получение переверенутой на угол angleOfRotationValue точки по Y
    @FXML
    public double getTempPointRotatedByY(double t, double x, double y, double i, double j)
    {
        return j + (x - i) * Math.sin(t) - (y - j) * Math.cos(t);
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

    // Вращение фигиры
    @FXML
    public void onTurn() {
        turnButton.setOnAction(actionEvent ->
        {
            try
            {
                double tempAngleValue = Double.parseDouble(angleOfRotationValue.getText().trim());

                for (int tempNumberOfTurnedPoint = 0; tempNumberOfTurnedPoint < objectList.size(); tempNumberOfTurnedPoint++)
                {
                    var rad = (Math.PI / 180) * tempAngleValue;

                    double updatedGraphicalPointValueX = getTempPointRotatedByX(rad, objectList.get(tempNumberOfTurnedPoint).getxValue(), objectList.get(tempNumberOfTurnedPoint).getyValue(), getTempRootPointValueX(), getTempRootPointValueY());
                    double updatedGraphicalPointValueY = getTempPointRotatedByY(rad, objectList.get(tempNumberOfTurnedPoint).getxValue(), objectList.get(tempNumberOfTurnedPoint).getyValue(), getTempRootPointValueX(), getTempRootPointValueY());

                    objectList.get(tempNumberOfTurnedPoint).setxValue(updatedGraphicalPointValueX);
                    objectList.get(tempNumberOfTurnedPoint).setxValue(updatedGraphicalPointValueY);
                }

                redrawElements();
                createCopyFunction();
            }
            catch (Exception e) {
                e.printStackTrace();
                parameterErrorField.setText("Допущена ошибка при вводе.");
            }
        });
    }

    // Чтение из файла данных рисунка
    @FXML
    public void onGetFromFile()
    {
        getFromFileButton.setOnAction(actionEvent ->
        {
            FileReader filereader = null;
            try {
                filereader = new FileReader("/Users/andreevalexander/Downloads/javafxGraphics-master/src/sample/input.txt");
                BufferedReader bufferedreader = new BufferedReader(filereader);
                String line = bufferedreader.readLine();

                //While we have read in a valid line
                while (line != null) {


                    int tempXDoubleValue = Integer.parseInt(line);
                    line = bufferedreader.readLine();
                    int tempYDoubleValue = Integer.parseInt(line);
                    line = bufferedreader.readLine();

                    GraphicalPoint tempPoint = new GraphicalPoint(tempXDoubleValue, tempYDoubleValue);

                    objectList.add(tempPoint);

                    graphTable.getGraphicsContext2D().fillOval((tempXDoubleValue - DRAW_RADIUS / 2 + 300) / ZOMM_COFF, (tempYDoubleValue - DRAW_RADIUS / 2 + 300) / ZOMM_COFF, DRAW_RADIUS, DRAW_RADIUS);
                }

                redrawElements();
                createCopyFunction();

            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }
}
