package sample.graphical.algorithm;

import lombok.SneakyThrows;
import sample.graphical.entity.GraphicalPoint;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class QuickHull {
    GraphicalPoint[] originalPoints;
    int fullSteps = 0;
    List<GraphicalPoint> hullPoints = new ArrayList<>();

    /*
     * constructor for <code>QuickHull</code> class
     * @param originalPoints {@link GraphicalPoint}[] initial points
     */
    public QuickHull(GraphicalPoint[] originalPoints) {
        this.originalPoints = originalPoints;
        qhull(originalPoints, 0, 0);
        reorderPoints(hullPoints);
    }

    /**
     * Returns original {@link GraphicalPoint} array.
     *
     * @return original {@link GraphicalPoint} array
     */
    public GraphicalPoint[] getOriginalPoints() {
        return originalPoints;
    }

    /**
     * Returns convex hull points as {@link List<GraphicalPoint>}.
     *
     * @return convex hull points as {@link List<GraphicalPoint>}.
     */
    public List<GraphicalPoint> getHullPointsAsVector() {
        return new ArrayList<>(hullPoints);
    }

    /**
     * Returns convex hull points as {@link GraphicalPoint}[].
     *
     * @return convex hull points as {@link GraphicalPoint}[].
     */
    public GraphicalPoint[] getHullPointsAsArray() {
        if (hullPoints == null) return null;
        GraphicalPoint[] hulldots = new GraphicalPoint[hullPoints.size()];
        for (int i = 0; i < hulldots.length; i++) {
            hulldots[i] = hullPoints.get(i);
        }
        return hulldots;
    }


    void reorderPoints(List<GraphicalPoint> v) {
        AngleWrapper[] angleWrappers = new AngleWrapper[v.size()];
        double xc = 0;
        double yc = 0;
        for (GraphicalPoint pt : v) {
            xc += pt.getX();
            yc += pt.getY();
        }

        xc /= v.size();
        yc /= v.size();

        for (int i = 0; i < angleWrappers.length; i++) {
            angleWrappers[i] = createAngleWrapper(v.get(i), xc, yc);
        }
        java.util.Arrays.sort(angleWrappers, new AngleComparator());
        v.clear();
        for (AngleWrapper angleWrapper : angleWrappers) {
            v.add(angleWrapper.pt);
        }
    }

    void qhull(Object[] dots0, int up, int step) {
        fullSteps++;
        if (dots0 == null || dots0.length < 1 || step > 200) return;
        if (dots0.length < 2) {
            addHullPoint((GraphicalPoint) dots0[0]);
            return;
        }
        try {
            int leftIndex = 0;
            int rightIndex = 0;
            for (int i = 1; i < dots0.length; i++) {
                if (((GraphicalPoint) dots0[i]).getX() < ((GraphicalPoint) dots0[leftIndex]).getX()) {
                    leftIndex = i;
                }
                if (((GraphicalPoint) dots0[i]).getX() > ((GraphicalPoint) dots0[rightIndex]).getX()) {
                    rightIndex = i;
                }
            }
            GraphicalPoint leftPoint = (GraphicalPoint) dots0[leftIndex];
            GraphicalPoint rightPoint = (GraphicalPoint) dots0[rightIndex];
            addHullPoint(leftPoint);
            addHullPoint(rightPoint);
            if (dots0.length == 3) {
                int middlePoint = -1;
                for (int i = 0; i < dots0.length; i++) {
                    if (i == leftIndex || i == rightIndex) continue;
                    middlePoint = i;
                    break;
                }
                addHullPoint((GraphicalPoint) dots0[middlePoint]);
            } else if (dots0.length > 3) {
                List<GraphicalPoint> vIn = new ArrayList<>();
                List<GraphicalPoint> vOut = new ArrayList<>();
                if (up >= 0) {
                    int upIndex = selectPoints(dots0, leftPoint, rightPoint, true, vIn);
                    if (upIndex >= 0 && vIn.size() > 0) {
                        GraphicalPoint upPoint = vIn.get(upIndex);
                        vOut.clear();
                        selectPoints(vIn, leftPoint, upPoint, true, vOut);
                        qhull(vOut.toArray(), 1, step + 1);
                        vOut.clear();
                        selectPoints(vIn, upPoint, rightPoint, true, vOut);
                        qhull(vOut.toArray(), 1, step + 1);
                    }
                }
                if (up <= 0) {
                    vIn.clear();
                    int downIndex = selectPoints(dots0, rightPoint, leftPoint, false, vIn);
                    if (downIndex >= 0 && vIn.size() > 0) {
                        GraphicalPoint downPoint = vIn.get(downIndex);
                        vOut.clear();
                        selectPoints(vIn, rightPoint, downPoint, false, vOut);
                        qhull(vOut.toArray(), -1, step + 1);
                        vOut.clear();
                        selectPoints(vIn, downPoint, leftPoint, false, vOut);
                        qhull(vOut.toArray(), -1, step + 1);
                    }
                }
            }
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

    void addHullPoint(GraphicalPoint pt) {
        if (!hullPoints.contains(pt)) hullPoints.add(pt);
    }

    static int selectPoints(Object[] pIn, GraphicalPoint pLeft, GraphicalPoint pRight, boolean up, List<GraphicalPoint> vOut) {
        int retValue = -1;
        if (pIn == null || vOut == null) return retValue;
        double k = (double) (pRight.getY() - pLeft.getY()) / (double) (pRight.getX() - pLeft.getX());
        double A = -k;
        double B = 1;
        double C = k * pLeft.getX() - pLeft.getY();
        double dup = 0;
        for (int i = 0; i < pIn.length; i++) {
            GraphicalPoint pt = (GraphicalPoint) pIn[i];
            if (pt.equals(pLeft) || pt.equals(pRight)) continue;
            int px = pt.getX();
            int py = pt.getY();
            double y = pLeft.getY() + k * (px - pLeft.getX());
            if ((!up && y < py) || (up && y > py)) {
                vOut.add(pt);
                double d = (A * px + B * py + C);
                if (d < 0) d = -d;
                if (d > dup) {
                    dup = d;
                    retValue = vOut.size() - 1;
                }
            }
        }
        vOut.add(pLeft);
        vOut.add(pRight);
        return retValue;
    }

    static int selectPoints(List<GraphicalPoint> vIn, GraphicalPoint pLeft, GraphicalPoint pRight, boolean up, List<GraphicalPoint> vOut) {
        int retValue = -1;
        if (vIn == null || vOut == null) return retValue;
        double k = (double) (pRight.getY() - pLeft.getY()) / (double) (pRight.getX() - pLeft.getX());
        double A = -k;
        double B = 1;
        double C = k * pLeft.getX() - pLeft.getY();
        double dup = 0;
        for (GraphicalPoint pt : vIn) {
            if (pt.equals(pLeft) || pt.equals(pRight)) continue;
            int px = pt.getX();
            int py = pt.getY();
            double y = pLeft.getY() + k * (px - pLeft.getX());
            if ((!up && y < py) || (up && y > py)) {
                vOut.add(pt);
                double d = (A * px + B * py + C);
                if (d < 0) d = -d;
                if (d > dup) {
                    dup = d;
                    retValue = vOut.size() - 1;
                }
            }
        }
        vOut.add(pLeft);
        vOut.add(pRight);
        return retValue;
    }

    @SneakyThrows
    static AngleWrapper createAngleWrapper(GraphicalPoint pt, double xc, double yc) {
        double angle = Math.atan2(pt.getY() - yc, pt.getX() - xc);
        if (angle < 0) angle += 2 * Math.PI;
        return new AngleWrapper(angle, pt.clone());
    }

    static class AngleComparator implements Comparator<AngleWrapper> {
        public int compare(AngleWrapper obj1, AngleWrapper obj2) {
            if (obj1 == null || obj2 == null) return 0;
            return (obj1.angle < obj2.angle) ? -1 : 1;
        }
    }

    static class AngleWrapper implements Comparable<AngleWrapper> {
        double angle;
        GraphicalPoint pt;

        AngleWrapper(double angle, GraphicalPoint pt) {
            this.angle = angle;
            this.pt = pt;
        }

        public int compareTo(AngleWrapper obj) {
            if (obj == null) return 0;
            return (obj.angle < angle) ? -1 : 1;
        }
    }
}
