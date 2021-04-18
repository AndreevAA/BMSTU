package sample.graphical.entity;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;
import lombok.Data;
import sample.graphical.GraphicalObject;

import java.util.Arrays;
import java.util.stream.Collectors;

@Data
public class GraphicalLine extends GraphicalObject {
    private double startX;
    private double startY;
    private double endX;
    private double endY;
    Color lineColor;

    public GraphicalLine(double setStartX, double setStartY, double setEndX, double setEndY, Color lineColor) {
        this.startX = setStartX;
        this.startY = setStartY;
        this.endX = setEndX;
        this.endY = setEndY;
        this.lineColor = lineColor;
    }

    public static ObservableList<String> parametersToObservableList() {
        return FXCollections.observableArrayList(
                Arrays.stream(GraphicalLine.class.getDeclaredFields())
                        .map(field -> field.getName() + " =")
                        .collect(Collectors.toList()));
    }

    @Override
    public void draw(GraphicsContext context) {
        context.setStroke(lineColor);
        context.strokeLine(startX, startY, endX, endY);
    }

    @Override
    public boolean validate() {
        return startX > 0 && startY > 0 &&
                endX > 0 && endY > 0 &&
                !(startX == endX && startY == endY);
    }

    @Override
    public String toString() {
        return "Line{" +
                "startX=" + startX +
                ", startY=" + startY +
                ", endX=" + endX +
                ", endY=" + endY +
                '}';
    }
}
