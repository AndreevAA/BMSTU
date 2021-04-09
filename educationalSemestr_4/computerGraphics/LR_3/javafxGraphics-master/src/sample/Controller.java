package sample;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.canvas.Canvas;
import javafx.scene.control.*;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Pair;
import lombok.SneakyThrows;
import sample.graphical.GraphicalObject;
import sample.graphical.algorithm.QuickHull;
import sample.graphical.entity.GraphicalCircle;
import sample.graphical.entity.GraphicalLine;
import sample.graphical.entity.GraphicalLineSection;
import sample.graphical.entity.GraphicalPoint;

import java.net.URL;
import java.text.DecimalFormat;
import java.util.*;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Controller implements Initializable {

    private Map<String, ObservableList<String>> objectsFields;
    private Map<String, GraphicalObject> objectNamesToClassReference;
    private GraphicalObject currentObject;
    private List<GraphicalObject> objectList;
    private ParameterEditAction parameterEditAction = new ParameterEditAction();

    private boolean inited = false;

    private static final int GRID_INTERVALS = 10;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        objectsFields = new HashMap<>();
        objectsFields.put("Point", GraphicalPoint.parametersToObservableList());
        objectsFields.put("Line", GraphicalLine.parametersToObservableList());
        objectsFields.put("Line(section)", GraphicalLineSection.parametersToObservableList());
        objectsFields.put("Circle", GraphicalCircle.parametersToObservableList());

        objectNamesToClassReference = new HashMap<>();
        objectNamesToClassReference.put("Point", GraphicalPoint.builder().build());
        objectNamesToClassReference.put("Line", GraphicalLine.builder().build());
        objectNamesToClassReference.put("Line(section)", GraphicalLineSection.builder().build());
        objectNamesToClassReference.put("Circle", GraphicalCircle.builder().build());

        objectList = new ArrayList<>();

        System.out.println(fitAllObjectsButton == null);
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
    private Button fitAllObjectsButton;

    @FXML
    private Button applyNewScaleButton;

    @FXML
    private Label parameterErrorField;

    @FXML
    private Label fixInErrorTextHolder;

    @FXML
    private Label executionErrorsLabel;

    @FXML
    private TextField parameterValueInput;

    @FXML
    private TextField scaleValueInput;

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

        if (!inited) {
            graphTable.getGraphicsContext2D().setFont(new Font(Font.getDefault().getName(), 10));

            redrawElements();
            graphTable.setOnMouseClicked(event -> {
                GraphicalObject object = GraphicalPoint.builder()
                        .x((int) (event.getX() / (graphTable.getScaleZ())))
                        .y((int) ((graphTable.getHeight() - event.getY()) / (graphTable.getScaleZ())))
                        .build();

                if (objectList.stream().anyMatch(o -> o.equals(object))) {
                    executionErrorsLabel.setText("Object with these params already exists");
                } else {
                    objectList.add(object);
                    objectsPlacedList.getItems().add(object.toString());

                    object.draw(graphTable);
                }
            });
            inited = true;
        }
    }


    @FXML
    public void onObjectsToPlaceListReload() {
        objectsToPlaceList.setItems(FXCollections.observableArrayList(objectsFields.keySet()));
        objectsToPlaceList.getSelectionModel().selectedItemProperty()
                .addListener((observableValue, oldValue, newValue) -> {
                    objectsParametersList.setItems(objectsFields.get(observableValue.getValue()));
                });
    }

    @FXML
    public void onObjectToPlaceSelected() {
        createElementButton.setText("Create");
        createElementButton.setOnAction(anotherEvent -> onDrawElement());
        currentObject = objectNamesToClassReference.get(objectsToPlaceList.getSelectionModel().getSelectedItem());
    }

    @FXML
    public void onParameterSelected() {
        objectsParametersList.getSelectionModel().selectedItemProperty()
                .addListener((observableValue, oldValue, newValue) -> {
                    parameterValueInput.setPromptText("Value of " + observableValue.getValue());
                    parameterValueInput.setOnAction(parameterEditAction);
                    setParameterValueButton.setOnAction(parameterEditAction);
                });
    }

    @FXML
    public void onHighlightElement() {
        graphTable.getGraphicsContext2D().setFill(Color.RED);
        objectList.get(objectsPlacedList.getSelectionModel().getSelectedIndex()).draw(graphTable);
        graphTable.getGraphicsContext2D().setFill(Color.BLACK);
    }

    @FXML
    public void onExecuteGoal() {
        List<GraphicalPoint> points = objectList.stream()
                .filter(o -> o instanceof GraphicalPoint)
                .map(o -> (GraphicalPoint) o)
                .collect(Collectors.toList());

        if (points.size() < 6) {
            executionErrorsLabel.setText("Not enough points for drawing two hulls. Need at least 6, got " + points.size());
        } else {
            executionErrorsLabel.setText("");
            for (GraphicalPoint point1 : points)
                for (GraphicalPoint point2 : points)
                    if (!point1.equals(point2)) {
                        Supplier<Stream<Pair<GraphicalPoint, Integer>>> resultsSupplier = () -> points.stream()
                                .filter(obj -> !obj.equals(point1) && !obj.equals(point2))
                                .map(obj -> new Pair<>(obj, (obj.getX() - point1.getX()) * (point2.getY() - point1.getY())
                                        - (obj.getY() - point1.getY()) * (point2.getX() - point1.getX())));

                        long belowZero = resultsSupplier.get().filter(o -> o.getValue() < 0).count();
                        if (resultsSupplier.get().anyMatch(o -> o.getValue().equals(0))) {
                            continue; // нахрена это нужно?
                        } else if (resultsSupplier.get().count() % 2 == 0 && belowZero == resultsSupplier.get().count() - belowZero) {
                            resizeElements();
                            drawHullsOnFound(point1, point2, resultsSupplier);

                            return;
                        } else if (resultsSupplier.get().count() % 2 == 1 && Math.abs(2 * belowZero - resultsSupplier.get().count()) == 1) {
                            resizeElements();
                            drawHullsOnFound(point1, point2, resultsSupplier);

                            return;
                        }
                    }
        }

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

        createElementButton.setText("Edit");
        createElementButton.setOnAction(event -> {
            if (objectList.stream().filter(o -> o.equals(currentObject)).count() > 1) {
                parameterErrorField.setText("Another object with same params already exists");
            } else {
                objectsPlacedList.getItems().set(objectsPlacedList.getSelectionModel().getSelectedIndex(), currentObject.toString());
                objectsParametersList.setItems(FXCollections.emptyObservableList());
                createElementButton.setText("Create");
                createElementButton.setOnAction(anotherEvent -> onDrawElement());

                redrawElements();
            }
        });
    }

    @FXML
    public void obDeleteElement() {
        objectList.remove(objectsPlacedList.getSelectionModel().getSelectedIndex());
        objectsPlacedList.setItems(
                FXCollections.observableList(objectList.stream().map(Object::toString).collect(Collectors.toList())));

        redrawElements();
    }

    @FXML
    public void onDeleteAllElements() {
        objectList.clear();
        objectsPlacedList.getItems().clear();

        redrawElements();
    }

    @SneakyThrows
    @FXML
    public void onDrawElement() {
        if (currentObject.validate()) {
            if (objectList.stream().anyMatch(o -> o.equals(currentObject))) {
                parameterErrorField.setText("Object with these params already exists");
            } else {
                objectList.add(currentObject.clone());
                objectsPlacedList.getItems().add(currentObject.toString());

                currentObject.draw(graphTable);
                currentObject = objectNamesToClassReference.get(objectsToPlaceList.getSelectionModel().getSelectedItem());
            }
        } else {
            parameterErrorField.setText("Errors in parameters` values, check if they are above zero");
        }
    }

    @FXML
    private void resizeElements() {
        double resizeScaleX = objectList.stream().mapToDouble(GraphicalObject::getMaxXCoordinate).max().orElse(0);
        double resizeScaleY = objectList.stream().mapToDouble(GraphicalObject::getMaxYCoordinate).max().orElse(0);
        if (resizeScaleX * resizeScaleY == 0) {
            fixInErrorTextHolder.setText("Nothing to fit in");
        } else {
            System.out.println("//>> Math.max(resizeScaleX, resizeScaleY) = " + Math.max(resizeScaleX, resizeScaleY));
            System.out.println("//>> Math.min(graphTable.getScaleX(), graphTable.getScaleY()) = " + Math.min(graphTable.getHeight(), graphTable.getWidth()));
            double newScale = Math.min(graphTable.getHeight(), graphTable.getWidth()) / Math.max(resizeScaleX, resizeScaleY);
            System.out.println("//> " + newScale);
            fixInErrorTextHolder.setText("Fitted in [~" + new DecimalFormat("#.##").format(newScale) + "]");
            rescale(newScale);
        }
    }

    @FXML
    private void applyNewScale() {
        try {
            double newScale = Double.parseDouble(scaleValueInput.getText());
            rescale(newScale);
        } catch (Exception e) {
            fixInErrorTextHolder.setText(e.getMessage());
        }
    }

    @FXML
    private void onShowAbout() {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("About");
        alert.setHeaderText("Piece of software");
        alert.setContentText("Simple program to create two hulls\nthat do not intersect. " +
                "\nPoints can be placed with Create-Edit\nmenu and mouse left-click.");

        alert.showAndWait();
    }


    private void rescale(double newScale) {
        graphTable.setScaleZ(newScale);
        scaleValueInput.setPromptText("Scale: " + newScale);
        redrawElements();
    }

    private class ParameterEditAction implements EventHandler<ActionEvent> {
        @Override
        public void handle(ActionEvent event) {
            Arrays.stream(currentObject.getClass().getDeclaredFields())
                    .filter(field -> objectsParametersList.getSelectionModel().getSelectedItem().startsWith(field.getName()))
                    .forEach(field -> {
                        try {
                            field.setAccessible(true);
                            field.set(currentObject, Integer.parseInt(parameterValueInput.getText().trim()));
                            objectsParametersList.getItems()
                                    .set(objectsParametersList.getSelectionModel().getSelectedIndex(),
                                            field.getName() + " = " + parameterValueInput.getText());
                            parameterErrorField.setText("");
                        } catch (Exception e) {
                            parameterErrorField.setText("Invalid value of " + field.getName() + ": " + e.getMessage());
                        }
                    });
        }
    }

    private void redrawElements() {
        graphTable.getGraphicsContext2D().clearRect(0, 0, graphTable.getWidth(), graphTable.getHeight());

        double lineParameter = GRID_INTERVALS * graphTable.getScaleZ();

        int counter = 0;

        graphTable.getGraphicsContext2D().setStroke(Color.DARKGRAY);
        for (double i = 0; i < graphTable.getWidth(); i += lineParameter) {
            graphTable.getGraphicsContext2D().strokeLine(i, 0, i, graphTable.getHeight());
//            graphTable.getGraphicsContext2D().strokeText(String.valueOf(counter), i, graphTable.getHeight());
//            counter += 10;
        }

        graphTable.getGraphicsContext2D().setStroke(Color.DARKGRAY);
        for (double i = graphTable.getHeight(); i > 0; i -= lineParameter) {
            graphTable.getGraphicsContext2D().strokeLine(0, i, graphTable.getWidth(), i);
            graphTable.getGraphicsContext2D().strokeText(String.valueOf(counter), 0, i);
            counter += 10;
        }

        objectList.forEach(graphicalObject -> graphicalObject.draw(graphTable));
        objectList.forEach(System.out::println);

    }

    private void drawHullsOnFound(GraphicalPoint point1, GraphicalPoint point2, Supplier<Stream<Pair<GraphicalPoint, Integer>>> resultsSupplier) {
                redrawElements();
        drawHull(resultsSupplier.get()
                .filter(o -> o.getValue() < 0)
                .map(Pair::getKey)
                .collect(Collectors.toList()), point1);
        drawHull(resultsSupplier.get()
                .filter(o -> o.getValue() > 0)
                .map(Pair::getKey)
                .collect(Collectors.toList()), point2);
    }

    private void drawHull(List<GraphicalPoint> points, GraphicalPoint additionalPoint) {
        points.add(additionalPoint);
        QuickHull quickHull = new QuickHull(points.toArray(new GraphicalPoint[0]));
        graphTable.getGraphicsContext2D().beginPath();
        quickHull.getHullPointsAsVector().forEach(o ->
                graphTable.getGraphicsContext2D().lineTo(o.getX() * graphTable.getScaleZ(),
                        graphTable.getHeight() - o.getY() * graphTable.getScaleZ()));

        graphTable.getGraphicsContext2D().closePath();
//        graphTable.getGraphicsContext2D().setFill(Color.GRAY);
//        graphTable.getGraphicsContext2D().setStroke(Color.DARKGRAY);
        graphTable.getGraphicsContext2D().stroke();
    }


}
