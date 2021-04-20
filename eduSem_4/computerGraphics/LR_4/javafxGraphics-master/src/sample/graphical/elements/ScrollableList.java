package sample.graphical.elements;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.control.ListView;
import lombok.Data;
import lombok.EqualsAndHashCode;
import sample.graphical.GraphicalObject;

import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class ScrollableList<T extends GraphicalObject> extends GraphicalObject {
    private List<T> objectList;
    private ObservableList<String> objectNames;
    private ListView<String> objectListView;

    public ScrollableList() {
        objectList = new ArrayList<>();
        objectNames = FXCollections.observableArrayList();
        objectListView = new ListView<>(objectNames);
    }

    public void addObject(T object) {
        objectList.add(object);
        objectNames.add(object.toString());
    }


}
