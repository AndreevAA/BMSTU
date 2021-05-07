package sample.graphical.entity;

import javafx.geometry.Rectangle2D;
import javafx.scene.Node;
import javafx.scene.SnapshotParameters;
import javafx.scene.canvas.Canvas;
import javafx.scene.image.PixelReader;
import javafx.scene.image.WritableImage;
import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;

import java.util.ArrayList;
import java.util.List;

import static java.lang.StrictMath.ceil;
import static java.lang.StrictMath.floor;
import static sample.graphical.entity.Pixel.getPixelInPixelListPosition;

public class GraphicalProcessing extends GraphicalObject
{

    // Закрашивание области под границами
    public static List <ColoredPixel> colorField(List <ColoredPixel> pixelList, Canvas graphTable, GraphicalPoint firstPoint, GraphicalPoint secondPoint, Color endColor)
    {

        int yStep = 1;

        if (firstPoint.yValue > secondPoint.yValue)
            yStep = -1;

        for (int pixelNumberY = (int) ceil(firstPoint.yValue); yStep * pixelNumberY <= yStep * (int) floor(secondPoint.yValue); pixelNumberY += yStep){

            int pixelNumberX = ((pixelNumberY - (int) firstPoint.yValue) *
                    ((int) secondPoint.xValue - (int) firstPoint.xValue) / ((int) secondPoint.yValue - (int) firstPoint.yValue) + (int) firstPoint.xValue);

            pixelList.add(new ColoredPixel(pixelNumberX, pixelNumberY, endColor));
            graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, endColor);
        }

        return pixelList;
    }
}
