package sample.graphical.entity;

import javafx.scene.canvas.GraphicsContext;
import lombok.Builder;
import sample.graphical.GraphicalObject;

@Builder
public class GraphicalPoint extends GraphicalObject {
    public static final double DRAW_RADIUS = 10.0D;

    private double xValue;
    private double yValue;


    public GraphicalPoint(double xValue, double yValue) {
        this.xValue = xValue;
        this.yValue = yValue;
    }

    public double getxValue() {
        return xValue;
    }

    public void setxValue(double xValue) {
        this.xValue = xValue;
    }

    public double getyValue() {
        return yValue;
    }

    public void setyValue(double yValue) {
        this.yValue = yValue;
    }


    public void draw(GraphicsContext context, double ZOMM_COFF) {
        super.draw(context);

        context.fillOval(xValue * ZOMM_COFF + 300, yValue * ZOMM_COFF + 300, DRAW_RADIUS, DRAW_RADIUS);
    }

    @Override
    public boolean validate() {
        return xValue > 0 && yValue > 0;
    }

    @Override
    public String toString() {
        return "Точка, " +
                "x=" + xValue +
                ", y=" + yValue;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        GraphicalPoint that = (GraphicalPoint) o;

        if (Double.compare(that.xValue, xValue) != 0) return false;
        return Double.compare(that.yValue, yValue) == 0;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        temp = Double.doubleToLongBits(xValue);
        result = (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(yValue);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
