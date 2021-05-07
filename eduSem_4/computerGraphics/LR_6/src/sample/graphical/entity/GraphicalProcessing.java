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


    // Закрашивание области между двумя точками
    public static List <ColoredPixel> colorField(List <ColoredPixel> pixelList, Canvas graphTable, GraphicalPoint firstPoint, GraphicalPoint secondPoint, int borderPosition, Color endColor)
    {
//        SnapshotParameters SP = new SnapshotParameters();
//        WritableImage WI = new WritableImage(1, 1);
//        PixelReader PR = WI.getPixelReader();
//
//        Color backgroundColor = getColor(graphTable, 10, 10, WI, SP, PR);

        int yStep = 1;

        if (firstPoint.yValue > secondPoint.yValue)
            yStep = -1;

        for (int pixelNumberY = (int) ceil(firstPoint.yValue); yStep * pixelNumberY <= yStep * (int) floor(secondPoint.yValue); pixelNumberY += yStep){

            int pixelNumberX = ((pixelNumberY - (int) firstPoint.yValue) *
                    ((int) secondPoint.xValue - (int) firstPoint.xValue) / ((int) secondPoint.yValue - (int) firstPoint.yValue) + (int) firstPoint.xValue);

            for (; pixelNumberX <= borderPosition; pixelNumberX++) {
                int pixelInPixelListPosition = getPixelInPixelListPosition(pixelList, pixelNumberX, pixelNumberY);

                if (pixelInPixelListPosition == -1) {
                    pixelList.add(new ColoredPixel(pixelNumberX, pixelNumberY, endColor));
                    graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, endColor);
                }
                else {
                    if (pixelList.get(pixelInPixelListPosition).tempColor == Color.rgb(244,244,244)){
                        pixelList.get(pixelInPixelListPosition).tempColor = endColor;
                        graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, endColor);
                    }
                    else{
                        pixelList.get(pixelInPixelListPosition).tempColor = Color.rgb(244,244,244);
                        graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, Color.rgb(244,244,244));
                    }
                }

//                SP = new SnapshotParameters();
//                WI = new WritableImage(1, 1);
//                PR = WI.getPixelReader();
//
//                Color tempPixelColor = getColor(graphTable, pixelNumberX, pixelNumberY, WI, SP, PR), finalColor;
//
//                if (tempPixelColor == endColor)
//                    finalColor = backgroundColor;
//                else
//                    finalColor = endColor;
//
//                graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, finalColor);
            }
        }

        for (int pixelNumberY = (int) floor(firstPoint.yValue); yStep * pixelNumberY <= yStep * (int) floor(secondPoint.yValue); pixelNumberY += yStep){

            int pixelNumberX = ((pixelNumberY - (int) firstPoint.yValue) *
                    ((int) secondPoint.xValue - (int) firstPoint.xValue) / ((int) secondPoint.yValue - (int) firstPoint.yValue) + (int) firstPoint.xValue);

            for (; pixelNumberX > borderPosition; pixelNumberX--) {

//                SP = new SnapshotParameters();
//                WI = new WritableImage(1, 1);
//                PR = WI.getPixelReader();
//
//                Color tempPixelColor = getColor(graphTable, pixelNumberX, pixelNumberY, WI, SP, PR), finalColor;
//
//                if (tempPixelColor == endColor)
//                    finalColor = backgroundColor;
//                else
//                    finalColor = endColor;
//
//                graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, finalColor);

                int pixelInPixelListPosition = getPixelInPixelListPosition(pixelList, pixelNumberX, pixelNumberY);

                if (pixelInPixelListPosition == -1) {
                    pixelList.add(new ColoredPixel(pixelNumberX, pixelNumberY, endColor));
                    graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, endColor);
                }
                else {
                    if (pixelList.get(pixelInPixelListPosition).tempColor == Color.rgb(244,244,244)){
                        pixelList.get(pixelInPixelListPosition).tempColor = endColor;
                        graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, endColor);
                    }
                    else{
                        pixelList.get(pixelInPixelListPosition).tempColor = Color.rgb(244,244,244);
                        graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, Color.rgb(244,244,244));
                    }
                }
            }
        }

        return pixelList;
    }

    public static Color getColor(Node n, double x, double y, WritableImage WI, SnapshotParameters SP, PixelReader PR)
    {
        synchronized (WI)
        {
            Rectangle2D r = new Rectangle2D(x, y, 1, 1);
            SP.setViewport(r);
            n.snapshot(SP, WI);
            return PR.getColor(0, 0);
        }
    }

}
