package sample.graphical.entity;

import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;

public class ColoredPixel {
    public double coordinateX;
    public double coordinateY;

    public javafx.scene.paint.Color tempColor;

    public ColoredPixel(double coordinateX, double coordinateY, Color tempColor)
    {
        this.coordinateX = coordinateX;
        this.coordinateY = coordinateY;
        this.tempColor = tempColor;
    }

    public void draw(GraphicsContext context) {
//        throw new ExecutionControl.NotImplementedException("Not implemented");
    }
}
