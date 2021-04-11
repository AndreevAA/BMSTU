package sample.graphical.entity;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import sample.graphical.GraphicalObject;

import java.util.Arrays;
import java.util.stream.Collectors;

@Data
public class GraphicalLine extends GraphicalObject {
    private int startX;
    private int startY;
    private int endX;
    private int endY;
    Color lineColor;

    public GraphicalLine(int setStartX, int setStartY, int setEndX, int setEndY, Color lineColor) {
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

        context.setStroke(Color.RED);
        context.strokeLine(startX, startY, endX, endY);
        System.out.println("Линия добавлена!" + startX + " | " + startY + " | " + endX + " | " + endY);
        System.out.println();
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
