package sample.graphical.entity;

import javafx.animation.PauseTransition;
import javafx.geometry.Rectangle2D;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.SnapshotParameters;
import javafx.scene.canvas.Canvas;
import javafx.scene.image.PixelReader;
import javafx.scene.image.WritableImage;
import javafx.scene.paint.Color;
import javafx.util.Duration;
import lombok.SneakyThrows;
import sample.graphical.GraphicalObject;

import java.util.ArrayList;
import java.util.List;

import static java.lang.Math.round;
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

        for (int pixelNumberY = (int) floor(firstPoint.yValue); yStep * pixelNumberY <= yStep * (int) secondPoint.yValue; pixelNumberY += yStep){
            if (timeDelayStatus) {
                int finalPixelNumberY = pixelNumberY;
                int finalYStep = yStep;
                new Thread() {
                    @SneakyThrows
                    @Override
                    public synchronized void start() {
                        super.start();
                        PauseTransition pause = new PauseTransition(Duration.seconds(10));
                        pause.setOnFinished((v) -> {
                            if ((int) secondPoint.yValue - (int) firstPoint.yValue != 0) {
                                int pixelNumberX = ((finalPixelNumberY - (int) firstPoint.yValue) *
                                        ((int) secondPoint.xValue - (int) firstPoint.xValue) / ((int) secondPoint.yValue - (int) firstPoint.yValue) + (int) firstPoint.xValue);

                                for (; pixelNumberX <= borderPosition; pixelNumberX++) {
                                    int pixelInPixelListPosition = getPixelInPixelListPosition(pixelList, pixelNumberX, finalPixelNumberY);

                                    if (pixelInPixelListPosition == -1) {
                                        pixelList.add(new ColoredPixel(pixelNumberX, finalPixelNumberY, endColor));
                                        graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, finalPixelNumberY, endColor);
                                        //graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, finalPixelNumberY + 1, endColor);
                                    } else {
                                        if (pixelList.get(pixelInPixelListPosition).tempColor.equals(Color.rgb(244, 244, 244))) {
                                            pixelList.get(pixelInPixelListPosition).tempColor = endColor;
                                            graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, finalPixelNumberY, endColor);
                                            //graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, finalPixelNumberY + 1, endColor);
                                        } else if (finalPixelNumberY != (int) secondPoint.yValue && (finalPixelNumberY != ((int) secondPoint.yValue + 1))){
                                            pixelList.get(pixelInPixelListPosition).tempColor = Color.rgb(244, 244, 244);
                                            graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, finalPixelNumberY, Color.rgb(244, 244, 244));
                                        }
                                    }
                                }
                            }
                        });
                        Thread.sleep(20);
                        pause.play();
                    }
                }.start();
            }
            else {
                if ((int) secondPoint.yValue - (int) firstPoint.yValue != 0) {
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
                            else if (pixelNumberY != (int) secondPoint.yValue && (pixelNumberY != ((int) secondPoint.yValue + yStep))){
                                pixelList.get(pixelInPixelListPosition).tempColor = Color.rgb(244,244,244);
                                graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, Color.rgb(244,244,244));
                            }
                        }
                    }
                }
            }
        }

        for (int pixelNumberY = (int) floor(firstPoint.yValue); yStep * pixelNumberY <= yStep * (int) secondPoint.yValue; pixelNumberY += yStep){
            if (timeDelayStatus) {
                int finalPixelNumberY = pixelNumberY;
                int finalYStep1 = yStep;
                new Thread() {
                    @SneakyThrows
                    @Override
                    public synchronized void start() {
                        super.start();
                        PauseTransition pause = new PauseTransition(Duration.seconds(10));
                        pause.setOnFinished((v) -> {
                            if ((int) secondPoint.yValue - (int) firstPoint.yValue != 0) {
                                int pixelNumberX = ((finalPixelNumberY - (int) firstPoint.yValue) *
                                        ((int) secondPoint.xValue - (int) firstPoint.xValue) / ((int) secondPoint.yValue - (int) firstPoint.yValue) + (int) firstPoint.xValue);

                                for (; pixelNumberX > borderPosition; pixelNumberX--) {

                                    int pixelInPixelListPosition = getPixelInPixelListPosition(pixelList, pixelNumberX, finalPixelNumberY);

                                    if (pixelInPixelListPosition == -1) {
                                        pixelList.add(new ColoredPixel(pixelNumberX, finalPixelNumberY, endColor));
                                        graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, finalPixelNumberY, endColor);
                                    }
                                    else {
                                        if (pixelList.get(pixelInPixelListPosition).tempColor == Color.rgb(244,244,244)){
                                            pixelList.get(pixelInPixelListPosition).tempColor = endColor;
                                            graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, finalPixelNumberY, endColor);
                                        }
                                        else if (finalPixelNumberY != (int) secondPoint.yValue && (finalPixelNumberY != ((int) secondPoint.yValue + finalYStep1))){
                                            pixelList.get(pixelInPixelListPosition).tempColor = Color.rgb(244,244,244);
                                            graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, finalPixelNumberY, Color.rgb(244,244,244));
                                        }
                                    }
                                }
                            }
                        });
                        Thread.sleep(20);
                        pause.play();
                    }
                }.start();
            }
            else {
                if ((int) secondPoint.yValue - (int) firstPoint.yValue != 0) {
                    int pixelNumberX = ((pixelNumberY - (int) firstPoint.yValue) *
                            ((int) secondPoint.xValue - (int) firstPoint.xValue) / ((int) secondPoint.yValue - (int) firstPoint.yValue) + (int) firstPoint.xValue);

                    for (; pixelNumberX > borderPosition; pixelNumberX--) {

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
                            else if (pixelNumberY != (int) secondPoint.yValue && (pixelNumberY != ((int) secondPoint.yValue + yStep))){
                                pixelList.get(pixelInPixelListPosition).tempColor = Color.rgb(244,244,244);
                                graphTable.getGraphicsContext2D().getPixelWriter().setColor(pixelNumberX, pixelNumberY, Color.rgb(244,244,244));
                            }
                        }
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