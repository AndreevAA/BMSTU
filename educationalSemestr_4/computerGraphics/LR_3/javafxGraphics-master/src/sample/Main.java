package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Group;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.SceneAntialiasing;
import javafx.scene.control.Button;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.paint.Color;
import javafx.scene.shape.Line;
import javafx.scene.shape.LineTo;
import javafx.scene.shape.MoveTo;
import javafx.scene.shape.Path;
import javafx.stage.Stage;
import sample.graphical.entity.GraphicalLine;
import sample.graphical.entity.GraphicalPoint;


public class Main extends Application {

    @Override
    public void start(Stage stage) throws Exception {

        Group group = new Group();
        group.autoSizeChildrenProperty().setValue(true);
        group.autoSizeChildrenProperty().set(true);
        group.setAutoSizeChildren(true);

        Parent content = FXMLLoader.load(getClass().getResource("sample.fxml"));
        Scene scene = new Scene(content, -1, -1);

        stage.setTitle("Computer Graphics");
        stage.setScene(scene);
        stage.sizeToScene();
        stage.setResizable(true);
        stage.show();






//        Parent root = FXMLLoader.load(getClass().getResource("sample.fxml"));
//        primaryStage.setTitle("Hello World");
//        primaryStage.setScene(new Scene(root, 300, 275));
//        primaryStage.show();

//        Path path = new Path();
//
//        //Moving to the starting point
//        MoveTo moveTo = new MoveTo(0, 0);
//
//        //Creating 1st line
//        LineTo line1 = new LineTo(321, 161);
//
//        //Creating 2nd line
//        LineTo line2 = new LineTo(126, 232);
//
//        //Creating 3rd line
//        LineTo line3 = new LineTo(232, 52);
//
//        //Creating 4th line
//        LineTo line4 = new LineTo(269, 250);
//
//        LineTo line5 = new LineTo(108, 71);
//
//        path.getElements().add(moveTo);
//        path.getElements().addAll(line1);
//
//        Group root = new Group(path);
//
//        stage.setTitle("Drawing an arc through a path");
//
////        TextField xCoordField
//
//        Button buttonLeft = new Button("Move Left");
//        buttonLeft.setOnAction(event -> {
//            line1.setX(line1.getX() + 10);
////            buttonLeft.setText("THIS BUTTON IS TESTED");
//        });
//        Button buttonRight = new Button("Move Right");
//        buttonRight.setOnAction(event -> {
//            line1.setX(line1.getX() - 10);
//
////            buttonRight.setText("THIS BUTTON IS TESTED");
//        });
//
//        ScrollableList<GraphicalLine> list = new ScrollableList<>();
//
//
//        HBox hbox = new HBox(buttonLeft, buttonRight, list.getObjectListView(), root);
//
//        Scene scene = new Scene(hbox, 600, 300);
//
//        stage.setScene(scene);
//        stage.show();
//        list.addObject(GraphicalLine.builder()
//                .startPoint(GraphicalPoint.builder().x(0).y(0).build())
//                .endPoint(GraphicalPoint.builder().x(10).y(10).build())
//                .build());
//



    }


    public static void main(String[] args) {
        launch(args);
    }
}
