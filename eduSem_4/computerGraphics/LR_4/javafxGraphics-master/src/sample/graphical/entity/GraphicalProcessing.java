package sample.graphical.entity;

import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;
import sample.graphical.formations.*;

import java.util.List;

public class GraphicalProcessing extends GraphicalObject
{

    public static List<GraphicalObject> graphProcessing(List<GraphicalObject> objectList, double tempCenterX, double tempCenterY, double tempLeftRadious, double tempTopRadious, Color tempColor, String tempAlgStatus, boolean isOval)
    {
        if (tempAlgStatus == "Каноническое уравнение")
            objectList = setCanonicalEquation(objectList, tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);
        else if (tempAlgStatus == "Параметрическое уравнение")
            objectList = setParametricEquation(objectList, tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);
        else if (tempAlgStatus == "Алгоритм Брезенхема")
            objectList = setBrezenchemsEquation(objectList, tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);
        else if (tempAlgStatus == "Алгоритм средней точки")
            objectList = setMiddlePointAlgorithmEquation(objectList, tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);
        else if (tempAlgStatus == "Построение при помощи библиотечной функции")
            objectList = setLibraryEquation(objectList, tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);

        return objectList;
    }

    public static List<GraphicalObject> setMiddlePointAlgorithmEquation(List<GraphicalObject> objectList, double tempCenterX, double tempCenterY, double tempLeftRadious, double tempTopRadious, boolean isOval, Color tempColor)
    {
        MiddlePointAlgorithmEquation middlePointAlgorithmEquation = new MiddlePointAlgorithmEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);
        objectList.add(middlePointAlgorithmEquation);

        return objectList;
    }

    public static List<GraphicalObject>  setCanonicalEquation(List<GraphicalObject> objectList, double tempCenterX, double tempCenterY, double tempLeftRadious, double tempTopRadious, boolean isOval, Color tempColor)
    {
        CanonicalEquation canonicalEquation = new CanonicalEquation(tempCenterX, tempCenterY, tempLeftRadious, tempLeftRadious, isOval, tempColor);
        objectList.add(canonicalEquation);

        return objectList;
    }

    public static List<GraphicalObject> setParametricEquation(List<GraphicalObject> objectList, double tempCenterX, double tempCenterY, double tempLeftRadious, double tempTopRadious, boolean isOval, Color tempColor)
    {
        ParametricEquation parametricEquation = new ParametricEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);
        objectList.add(parametricEquation);

        return objectList;
    }

    public static List<GraphicalObject> setLibraryEquation(List<GraphicalObject> objectList, double tempCenterX, double tempCenterY, double tempLeftRadious, double tempTopRadious, boolean isOval, Color tempColor)
    {
        LibraryEquation libraryEquation = new LibraryEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);
        objectList.add(libraryEquation);

        return objectList;
    }

    public static List<GraphicalObject> setBrezenchemsEquation(List<GraphicalObject> objectList, double tempCenterX, double tempCenterY, double tempLeftRadious, double tempTopRadious, boolean isOval, Color tempColor)
    {
        BrezenchemsEquation brezenchemsEquation = new BrezenchemsEquation(tempCenterX, tempCenterY, tempLeftRadious, tempTopRadious, isOval, tempColor);
        objectList.add(brezenchemsEquation);

        return objectList;
    }
}
