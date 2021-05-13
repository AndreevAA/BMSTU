package sample.graphical.elements;

import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;

public class RectangleCutter extends GraphicalObject {
    public int startPointCoordinateX, startPointCoordinateY;
    public int heightSide, widthSide;
    public Color color;

    public RectangleCutter(int startPointCoordinateX, int startPointCoordinateY, int widthSide,
                        int heightSide,
                           Color color)
    {
        this.startPointCoordinateX = startPointCoordinateX;
        this.startPointCoordinateY = startPointCoordinateY;
        this.heightSide = heightSide;
        this.widthSide = widthSide;
        this.color = color;
    }
}
