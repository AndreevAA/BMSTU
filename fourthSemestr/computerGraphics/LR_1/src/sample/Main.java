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


public class Main extends Application {

    @Override
    public void start(Stage stage) throws Exception
    {

        Group group = new Group();
        group.autoSizeChildrenProperty().setValue(true);
        group.autoSizeChildrenProperty().set(true);
        group.setAutoSizeChildren(true);

        Parent content = FXMLLoader.load(getClass().getResource("sample.fxml"));
        Scene scene = new Scene(content, -1, -1);

        stage.setTitle("computerGraphics, LR_1, Andreev A.A.");
        stage.setScene(scene);
        stage.sizeToScene();
        stage.setResizable(true);
        stage.show();
    }


    public static void main(String[] args) {
        launch(args);
    }
}