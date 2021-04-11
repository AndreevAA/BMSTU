package sample.graphical.entity;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import sample.graphical.GraphicalObject;

public class HorizontalBarChartDemo extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception {

        CategoryAxis xAxis = new CategoryAxis();
        xAxis.setLabel("Programming Language");

        NumberAxis yAxis = new NumberAxis();

        yAxis.setLabel("Percent");

        // Create a BarChart
        BarChart<Number, String> barChart = new BarChart<Number, String>(yAxis, xAxis);

        // Series 1 - Data of 2014
        XYChart.Series<Number, String> dataSeries1 = new XYChart.Series<Number, String>();
        dataSeries1.setName("2014");

        dataSeries1.getData().add(new XYChart.Data<Number, String>(20.973, "Java"));
        dataSeries1.getData().add(new XYChart.Data<Number, String>(4.429, "C#"));
        dataSeries1.getData().add(new XYChart.Data<Number, String>(2.792, "PHP"));

        // Series 2 - Data of 2015
        XYChart.Series<Number, String> dataSeries2 = new XYChart.Series<Number, String>();
        dataSeries2.setName("2015");

        dataSeries2.getData().add(new XYChart.Data<Number, String>(26.983, "Java"));
        dataSeries2.getData().add(new XYChart.Data<Number, String>(6.569, "C#"));
        dataSeries2.getData().add(new XYChart.Data<Number, String>(6.619, "PHP"));

        // Add Series to BarChart.
        barChart.getData().add(dataSeries1);
        barChart.getData().add(dataSeries2);

        barChart.setTitle("Some Programming Languages");

        VBox vbox = new VBox(barChart);

        primaryStage.setTitle("JavaFX BarChart (o7planning.org)");
        Scene scene = new Scene(vbox, 400, 200);

        primaryStage.setScene(scene);
        primaryStage.setHeight(300);
        primaryStage.setWidth(400);

        primaryStage.show();
    }

    public static void main(String[] args) {
        Application.launch(args);
    }
}
