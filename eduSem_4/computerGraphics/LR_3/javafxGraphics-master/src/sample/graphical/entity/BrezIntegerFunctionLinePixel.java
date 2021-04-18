package sample.graphical.entity;

        import javafx.scene.canvas.GraphicsContext;
        import javafx.scene.paint.Color;
        import sample.graphical.GraphicalObject;

public class BrezIntegerFunctionLinePixel extends GraphicalObject {

    double firstX, secondX;
    double firstY, secondY;
    Color lineColor;

    public BrezIntegerFunctionLinePixel(double firstX, double firstY, double secondX, double secondY, Color lineColor) {
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

        int error = 0;
        int deltaError = (int) (Math.abs(secondX - firstX) + 1);
        int y = (int) firstY;
        int delta = (int) (secondY - firstY);
        if (delta > 0)
            delta = 1;
        else if (delta < 0)
            delta = -1;

        int deltaX = (int) Math.abs(secondY - firstY);
        for (double x = firstX; x < secondX; x++) {
            drawPixel(context, (int) x, y);
            error = error + deltaError;
            if (error >= deltaX + 1) {
                y = y + delta;
                error -= deltaX = 1;
            }
        }
    }
}
