package sample.graphical.formations;

import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import sample.graphical.GraphicalObject;

import static java.lang.StrictMath.cos;
import static java.lang.StrictMath.sin;

public class LibraryEquation extends GraphicalObject
{

    double tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious;
    boolean isOval;

    Color tempColor;

    public LibraryEquation(double tempCenterX, double tempCenterY, double tempLeftRadious, double tempTopRadious, boolean isOval, Color tempColor)
    {
        this.tempCenterX = tempCenterX;
        this.tempCenterY = tempCenterY;
        this.tempLeftRadious = tempLeftRadious;
        this.tempTopRadious = tempTopRadious;
        this.isOval = isOval;
        this.tempColor = tempColor;
    }

    // Отрисовка пикселя
    private void drawPixel(GraphicsContext context, int tempCoordinateX, int tempCoordinateY) {
        context.getPixelWriter().setColor(tempCoordinateX, tempCoordinateY, tempColor);
    }

    // Поворто линии на градус
    private double[] rotateLine(double startCoordinateX, double startCoordinateY, double endCoordinateX, double endCoordinateY, double degreeOfRotation)
    {

        // Высисление поворота координат
        double rotatedEndCoordinateX = startCoordinateX + (((endCoordinateX - startCoordinateX) * cos(degreeOfRotation) - (endCoordinateY - startCoordinateY) * sin(degreeOfRotation)));
        double rotatedEndCoordinateY = startCoordinateY + (((endCoordinateX - startCoordinateX) * sin(degreeOfRotation)) + (endCoordinateY - startCoordinateY) * cos(degreeOfRotation));

        return new double[] {rotatedEndCoordinateX, rotatedEndCoordinateY};
    }

    @Override
    public void draw(GraphicsContext context) {

        // Установка цвета
        context.setStroke(tempColor);

        // Установка настроек линии
        context.setLineWidth(1);

        // Отрисовка
        context.strokeOval(tempCenterX - tempLeftRadious, tempCenterY - tempTopRadious, tempLeftRadious * 2, tempTopRadious * 2);
    }
}