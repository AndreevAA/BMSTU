package sample.graphical.entity;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.canvas.Canvas;
import lombok.Builder;
import sample.graphical.GraphicalObject;

import java.util.Arrays;
import java.util.Objects;
import java.util.stream.Collectors;

@Builder
public class GraphicalCircle extends GraphicalObject {
    private int centerX;
    private int centerY;
    private int radius;

    public static ObservableList<String> parametersToObservableList() {
        return FXCollections.observableArrayList(
                Arrays.stream(GraphicalCircle.class.getDeclaredFields())
                        .map(field -> field.getName() + " = ")
                        .collect(Collectors.toList()));
    }

    @Override
    public void draw(Canvas canvas) {
        canvas.getGraphicsContext2D().fillOval(centerX * canvas.getScaleZ() - radius * canvas.getScaleZ() / 2, canvas.getHeight() - centerY * canvas.getScaleZ() - radius * canvas.getScaleZ() / 2,
                radius * canvas.getScaleZ(), radius * canvas.getScaleZ());
    }

    @Override
    public boolean validate() {
        return centerX > 0 && centerY > 0 && radius > 0;
    }

    @Override
    public int getMaxXCoordinate() {
        return centerX + radius;
    }

    @Override
    public int getMaxYCoordinate() {
        return centerY + radius;
    }

    @Override
    public String toString() {
        return "Circle{" +
                "centerX=" + centerX +
                ", centerY=" + centerY +
                ", radius=" + radius +
                '}';
    }

    @Override
    public GraphicalObject clone() {
        return GraphicalCircle.builder()
                .centerX(this.centerX)
                .centerY(this.centerY)
                .radius(this.radius)
                .build();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GraphicalCircle that = (GraphicalCircle) o;
        return centerX == that.centerX &&
                centerY == that.centerY &&
                radius == that.radius;
    }

    @Override
    public int hashCode() {
        return Objects.hash(centerX, centerY, radius);
    }
}
