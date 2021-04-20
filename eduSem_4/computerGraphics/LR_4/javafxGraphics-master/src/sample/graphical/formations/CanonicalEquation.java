package sample.graphical.formations;

import com.sun.jdi.IntegerType;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;

import static java.lang.StrictMath.*;
import static java.lang.StrictMath.pow;

public class CanonicalEquation extends GraphicalObject
{

    double tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious;
    boolean isOval;

    Color tempColor;

    public CanonicalEquation(double tempCenterX, double tempCenterY, double tempLeftRadious, double tempTopRadious, boolean isOval, Color tempColor)
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
        context.setStroke(tempColor);
        context.setLineWidth(1);

        if (isOval == false)
        {
            int numberOfPoints = 2000;

            double startCoordinateX = tempCenterX, startCoordinateY = tempCenterY, endCoordinateX = startCoordinateX + tempLeftRadious, endCoordinateY = startCoordinateY;
            double tempStep = 360.0 / (double) numberOfPoints;

            for (int tempNumberOfLine = 0; tempNumberOfLine < numberOfPoints; tempNumberOfLine++)
            {
                double tempDegree = tempStep * (double) tempNumberOfLine;
                double tempData[] = rotateLine(startCoordinateX, startCoordinateY, endCoordinateX, endCoordinateY, Math.toRadians(tempDegree));

                context.strokeOval((int) tempData[0], (int) tempData[1], 1, 1);
            }
        }
        else
        {
            double differenceRadious = tempTopRadious / tempLeftRadious;

            for (double tempCoordinateX = tempCenterX - tempLeftRadious; tempCoordinateX <= tempCenterY + tempLeftRadious; tempCoordinateX += 0.001)
            {
                double tempCoordinateY = differenceRadious * sqrt(pow(tempLeftRadious, 2) - pow(tempCoordinateX - tempCenterX, 2));

                // Отрисовка пиксела по границе
                context.strokeOval((int) tempCoordinateX, (int) (tempCenterY + tempCoordinateY), 1, 1);
                context.strokeOval((int) tempCoordinateX, (int) (tempCenterY - tempCoordinateY), 1, 1);
            }
        }
    }
}
