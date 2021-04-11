package sample.graphical.entity;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.canvas.GraphicsContext;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import sample.graphical.GraphicalObject;

import java.util.Arrays;
import java.util.stream.Collectors;

@Data
@Builder
public class GraphicalLine extends GraphicalObject {
    private int startX;
    private int startY;
    private int endX;
    private int endY;

    public static ObservableList<String> parametersToObservableList() {
        return FXCollections.observableArrayList(
                Arrays.stream(GraphicalLine.class.getDeclaredFields())
                        .map(field -> field.getName() + " =")
                        .collect(Collectors.toList()));
    }

    @Override
    public void draw(GraphicsContext context) {
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
