package sample.graphical.formations;

import javafx.fxml.FXML;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.control.Alert;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;

public class TimeRecording extends GraphicalObject
{
    @FXML
    public static void onShowHistogramStats(long canonicalEquation, long parametricalEquation, long brezenchemsEquation,
                                            long middlePointAlgorithmEquation, long libraryEquation)
    {
        final BarChart<Number, String> barChart =
                new BarChart<>(new NumberAxis(), new CategoryAxis());
        barChart.setCategoryGap(0);
        barChart.setBarGap(0);

        XYChart.Series<Number, String> series = new XYChart.Series<>();
        series.setName("Сравнение времени работы алгоритмов");

        series.getData().add(new XYChart.Data<>(canonicalEquation, "Каноническое уравнение"));
        series.getData().add(new XYChart.Data<>(parametricalEquation, "Параметрическое уравнение"));
        series.getData().add(new XYChart.Data<>(brezenchemsEquation, "Алгоритм Брезенхема"));
        series.getData().add(new XYChart.Data<>(middlePointAlgorithmEquation, "Алгоритм средней точки"));
        series.getData().add(new XYChart.Data<>(libraryEquation, "Построение при помощи библиотечной функции"));

        barChart.getData().add(series);

        VBox vBox = new VBox();
        vBox.getChildren().addAll(barChart);

        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Сравнение времени работы алгоритмов");
        alert.setHeaderText(null);
        alert.setGraphic(vBox);

        alert.showAndWait();
    }

    public static long getTimeOfWorkingFunctionDrawingLine(double tempCenterX, double tempCenterY, double tempLeftRadious, double tempTopRadious, Color tempColor, String tempAlgStatus, boolean isOval)
    {
        long startTime = System.nanoTime();
        if (tempAlgStatus == "Каноническое уравнение") {
            MiddlePointAlgorithmEquation middlePointAlgorithmEquation = new MiddlePointAlgorithmEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);;
        }
        else if (tempAlgStatus == "Параметрическое уравнение") {
            CanonicalEquation canonicalEquation = new CanonicalEquation(tempCenterX, tempCenterY, tempLeftRadious, tempLeftRadious, isOval, tempColor);
        }
        else if (tempAlgStatus == "Алгоритм Брезенхема"){
            ParametricEquation parametricEquation = new ParametricEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);
        }
        else if (tempAlgStatus == "Алгоритм средней точки"){
            LibraryEquation libraryEquation = new LibraryEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);
        }
        else if (tempAlgStatus == "Построение при помощи библиотечной функции"){
            BrezenchemsEquation brezenchemsEquation = new BrezenchemsEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);
        }

        long endTime = System.nanoTime();
        return endTime - startTime;
    }
}
