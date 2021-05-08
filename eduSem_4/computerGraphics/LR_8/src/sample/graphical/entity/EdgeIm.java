package sample.graphical.entity;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;

import java.util.Arrays;
import java.util.stream.Collectors;

public class EdgeIm extends GraphicalObject {
    public double startX;
    public double startY;

    public double endX;
    public double endY;

    public boolean isUsed;

    public EdgeIm(double setStartX, double setStartY, double setEndX, double setEndY, boolean isUsed) {
        this.startX = setStartX;
        this.startY = setStartY;
        this.endX = setEndX;
        this.endY = setEndY;
        this.isUsed = isUsed;
    }
}
