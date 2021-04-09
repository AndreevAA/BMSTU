package sample.graphical.entity;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.canvas.Canvas;
import javafx.scene.paint.Color;
import lombok.Builder;
import lombok.Data;
import sample.graphical.GraphicalObject;

import java.util.Arrays;
import java.util.Objects;
import java.util.stream.Collectors;

@Data
@Builder
public class GraphicalPoint extends GraphicalObject {
    private static final double DRAW_RADIUS = 5.0D;

    private int x;
    private int y;

    @Override
    public void draw(Canvas canvas) {
        super.draw(canvas);
//        System.out.println("x " + (x < canvas.getWidth() / 2 ? -1 : 1));
//        System.out.println("y " + (y < canvas.getHeight() / 2 ? -1 : 1));
        canvas.getGraphicsContext2D().fillOval((x * (canvas.getScaleZ())/* * (x < canvas.getWidth() / 2 ? -1 : 1))*/ - DRAW_RADIUS / 2),
                (canvas.getHeight() - y * (canvas.getScaleZ())/* * (y < canvas.getHeight() / 2 ? -1 : 1))*/ - DRAW_RADIUS / 2),
                DRAW_RADIUS, DRAW_RADIUS);
    }

    public static ObservableList<String> parametersToObservableList() {
        return FXCollections.observableArrayList(
                Arrays.stream(GraphicalPoint.class.getDeclaredFields())
                        .filter(field -> !field.getName().equals("DRAW_RADIUS"))
                        .map(field -> field.getName() + " =")
                        .collect(Collectors.toList()));
    }

    @Override
    public boolean validate() {
        return x > 0 && y > 0;
    }

    @Override
    public int getMaxXCoordinate() {
        return x;
    }

    @Override
    public int getMaxYCoordinate() {
        return y;
    }

    @Override
    public String toString() {
        return "Point{" +
                "x=" + x +
                ", y=" + y +
                '}';
    }

    @Override
    public GraphicalPoint clone() {
        return GraphicalPoint.builder()
                .x(this.x)
                .y(this.y)
                .build();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GraphicalPoint point = (GraphicalPoint) o;
        return x == point.x &&
                y == point.y;
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y);
    }
}
