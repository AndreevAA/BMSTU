package sample.graphical.formations;

import javafx.fxml.FXML;
import javafx.scene.canvas.Canvas;
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

    public static long getTimeOfWorkingFunctionDrawingLine(double tempCenterX, double tempCenterY, double tempLeftRadious, double tempTopRadious, Color tempColor, String tempAlgStatus, boolean isOval, Canvas canvas)
    {
        long startTime = System.nanoTime();
        if (tempAlgStatus.equals("Каноническое уравнение")) {
            new CanonicalEquation(tempCenterX, tempCenterY, tempLeftRadious, tempLeftRadious, isOval, tempColor).draw(canvas.getGraphicsContext2D());
        }
        else if (tempAlgStatus.equals("Параметрическое уравнение")) {
            new ParametricEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor).draw(canvas.getGraphicsContext2D());
        }
        else if (tempAlgStatus.equals("Алгоритм Брезенхема")){
            new BrezenchemsEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor).draw(canvas.getGraphicsContext2D());
        }
        else if (tempAlgStatus.equals("Алгоритм средней точки")){

            new MiddlePointAlgorithmEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor).draw(canvas.getGraphicsContext2D());
        }
        else if (tempAlgStatus.equals("Построение при помощи библиотечной функции")){
            new LibraryEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor).draw(canvas.getGraphicsContext2D());
        }

        long endTime = System.nanoTime();
        canvas.getGraphicsContext2D().clearRect(0, 0, canvas.getWidth(), canvas.getHeight());
        return endTime - startTime;
    }
}
