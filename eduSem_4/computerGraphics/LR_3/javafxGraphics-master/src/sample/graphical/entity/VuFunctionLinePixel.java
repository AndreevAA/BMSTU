package sample.graphical.entity;

        import javafx.scene.canvas.GraphicsContext;
        import javafx.scene.paint.Color;
        import sample.graphical.GraphicalObject;

public class VuFunctionLinePixel extends GraphicalObject {

    double firstX, secondX;
    double firstY, secondY;
    Color lineColor;

    public VuFunctionLinePixel(double firstX, double firstY, double secondX, double secondY, Color lineColor) {
        this.firstX = firstX;
        this.firstY = firstY;
        this.secondX = secondX;
        this.secondY = secondY;
        this.lineColor = lineColor;
    }

    private void drawPixel(GraphicsContext context, int x, int y, int saturation) {
        context.getPixelWriter().setColor(x, y, Color.BLACK.equals(lineColor) ?
                Color.gray(saturation) : lineColor);
    }

    @Override
    public void draw(GraphicsContext context) {
        if (secondX < firstX)
            swap();

        double derivativeX = secondX - firstX;
        double derivativeY = secondY - firstY;
        double gradient = derivativeY / derivativeX;

        int endX = Math.toIntExact(Math.round(firstX));
        int startX = endX;
        double endY = firstY + gradient * (endX - firstX);
        double saturation = 1 - getFloatingPart(firstX + 0.5);
        drawPixel(context, startX, (int) Math.floor(endY), (int)((1 - getFloatingPart(endY)) * saturation));
        drawPixel(context, startX, (int) Math.floor(endY) + 1, (int) (getFloatingPart(endY) * saturation));

        double intery = endY + gradient;

        endX = Math.toIntExact(Math.round(secondX));
        endY = secondY + gradient * (endX - secondX);
        saturation = getFloatingPart(secondX + 0.5);
        drawPixel(context, endX, (int) Math.floor(endY), (int)((1 - getFloatingPart(endY)) * saturation));
        drawPixel(context, endX, (int) Math.floor(endY) + 1, (int)(getFloatingPart(endY) * saturation));


        for (int x = startX + 1; x < endX - 1; x++) {
            drawPixel(context, x, (int) Math.floor(intery), (int)(1 - getFloatingPart(intery)));
            drawPixel(context, x, (int) (Math.floor(intery) + 1), (int)(getFloatingPart(intery)));
            intery += gradient;
        }
    }

    private double getFloatingPart(double value) {
        return value - Math.floor(value);
    }

    private void swap() {
        double temp = firstX;
        firstX = secondX;
        secondX = (int) temp;
        temp = firstY;
        firstY = secondY;
        secondY = (int) temp;
    }
}
