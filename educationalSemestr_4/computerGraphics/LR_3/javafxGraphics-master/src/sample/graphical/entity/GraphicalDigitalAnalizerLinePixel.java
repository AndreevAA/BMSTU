package sample.graphical.entity;

import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;

public class GraphicalDigitalAnalizerLinePixel extends GraphicalObject {

    int firstX, secondX;
    int firstY, secondY;
    Color lineColor;

    public GraphicalDigitalAnalizerLinePixel(int firstX, int firstY, int secondX, int secondY, Color lineColor) {
        this.firstX = firstX;
        this.firstY = firstY;
        this.secondX = secondX;
        this.secondY = secondY;
        this.lineColor = lineColor;
    }

    private void drawPixel(GraphicsContext context, int x, int y) {
        context.getPixelWriter().setColor(x, y, lineColor);
    }

    @Override
    public void draw(GraphicsContext context) {

        double deltaX = Math.abs(firstX - secondX);
        double deltaY = Math.abs(firstY - secondY);
        int length = (int) Math.max(deltaX, deltaY);

        if (length == 0) {
            drawPixel(context, (int) firstX, (int) firstY);
        } else {
            double dX = (double) (secondX - firstX) / length;
            double dY = (double) (secondY - firstY) / length;

            double x = firstX;
            double y = firstY;

            length++;
            while (--length != 0) {
                x += dX;
                y += dY;
                drawPixel(context, (int) x, (int) y);
            }
        }

        super.draw(context);
    }
}
