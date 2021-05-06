package sample.graphical.entity;

import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;

import java.awt.*;

public class ColoredPoints extends GraphicalObject
{
    public double coordinateX;
    public double coordinateY;

    public javafx.scene.paint.Color tempColor;

    public ColoredPoints(double coordinateX, double coordinateY, Color tempColor)
    {
        this.coordinateX = coordinateX;
        this.coordinateY = coordinateY;
        this.tempColor = tempColor;
    }
}
