package sample.graphical.entity;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.paint.Color;
import sample.graphical.GraphicalObject;
import sample.graphical.formations.*;

import java.awt.*;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class CanvasOperations extends GraphicalObject
{
    // Преобразование значение цвета
    public static Color getColor(String tempColorStatus)
    {
        if (tempColorStatus == "Красный")
            return Color.RED;
        else if (tempColorStatus == "Зеленый")
            return Color.GREEN;
        else if (tempColorStatus == "Серый")
            return Color.GREY;
        else if (tempColorStatus == "Синий")
            return Color.BLUE;
        else if (tempColorStatus == "Желтый")
            return Color.YELLOW;
        else
            return Color.BLACK;
    }
}
