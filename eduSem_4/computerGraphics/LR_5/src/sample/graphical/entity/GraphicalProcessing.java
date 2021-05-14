package sample.graphical.entity;

import javafx.geometry.Rectangle2D;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.Scene;
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
import static sample.graphical.entity.CanvasOperations.redrawElements;
import static sample.graphical.entity.CanvasOperations.redrawElementsPix;
import static sample.graphical.entity.Pixel.getPixelInPixelListPosition;

public class GraphicalProcessing extends GraphicalObject
{

    // Закрашивание области между двумя точками
    public static List <ColoredPixel> colorField(List<GraphicalObject> objectList, List <ColoredPixel> pixelList, Canvas graphTable, GraphicalPoint firstPoint, GraphicalPoint secondPoint, int borderPosition, Color endColor, boolean timeDelayStatus) throws InterruptedException {
//        SnapshotParameters SP = new SnapshotParameters();
//        WritableImage WI = new WritableImage(1, 1);
//        PixelReader PR = WI.getPixelReader();
//
//        Color backgroundColor = getColor(graphTable, 10, 10, WI, SP, PR);

        int yStep = 1;

        if (firstPoint.yValue > secondPoint.yValue)
            yStep = -1;

        for (int pixelNumberY = (int) floor(firstPoint.yValue); yStep * pixelNumberY <= yStep * (int) ceil(secondPoint.yValue); pixelNumberY += yStep){

            //Group root = new Group();

            if ((int) secondPoint.yValue - (int) firstPoint.yValue != 0) {
                int pixelNumberX = ((pixelNumberY - (int) firstPoint.yValue) *
                        ((int) secondPoint.xValue - (int) firstPoint.xValue) / ((int) secondPoint.yValue - (int) firstPoint.yValue) + (int) firstPoint.xValue);

                for (; pixelNumberX <= borderPosition; pixelNumberX++) {
                    int pixelInPixelListPosition = getPixelInPixelListPosition(pixelList, pixelNumberX, pixelNumberY);

                    if (pixelInPixelListPosition == -1) {
                        pixelList.add(new ColoredPixel(pixelNumberX, pixelNumberY, endColor));
                        graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, endColor);
                    } else {
                        if (pixelList.get(pixelInPixelListPosition).tempColor == Color.rgb(244, 244, 244)) {
                            pixelList.get(pixelInPixelListPosition).tempColor = endColor;
                            graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, endColor);
                        } else {
                            pixelList.get(pixelInPixelListPosition).tempColor = Color.rgb(244, 244, 244);
                            graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, Color.rgb(244, 244, 244));
                        }
                    }
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

//            Thread.sleep(100, 0);
            //redrawElementsPix(graphTable, objectList, pixelList);
//            objectList.forEach(graphicalObject -> graphicalObject.draw(graphTable.getGraphicsContext2D()));
        }

        for (int pixelNumberY = (int) floor(firstPoint.yValue); yStep * pixelNumberY <= yStep * (int) floor(secondPoint.yValue); pixelNumberY += yStep){

            if ((int) secondPoint.yValue - (int) firstPoint.yValue != 0) {
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

//            Thread.sleep(10, 0);
//            redrawElementsPix(graphTable, objectList, pixelList);
            //objectList.forEach(graphicalObject -> graphicalObject.draw(graphTable.getGraphicsContext2D()));
            //graphTable.getGraphicsContext2D();
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
