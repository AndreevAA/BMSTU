package sample.graphical.entity;

        import javafx.scene.canvas.GraphicsContext;
        import javafx.scene.paint.Color;
        import sample.graphical.GraphicalObject;

public class BrezStupFunctionLinePixel extends GraphicalObject {

    double firstX, secondX;
    double firstY, secondY;
    Color lineColor;

    public BrezStupFunctionLinePixel(double firstX, double firstY, double secondX, double secondY, Color lineColor) {
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

        double error = 0;
        double deltaError = (double) (Math.abs(secondY - firstY) + 1) / (Math.abs(secondX - firstX) + 1);
        int y = (int) firstY;
        int delta = (int) (secondY - firstY);
        if (delta > 0)
            delta = 1;
        else if (delta < 0)
            delta = -1;

        for (double x = firstX; x < secondX; x++) {
            drawPixel(context, (int) x, y);
            error = error + deltaError;
            if (error >= 1.0) {
                y = y + delta;
                error = error - 1.0;
            }
        }
    }
}
