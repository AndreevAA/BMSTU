package sample.graphical.entity;

import sample.graphical.GraphicalObject;

import java.util.List;

public class Pixel extends GraphicalObject {
    public static int getPixelInPixelListPosition(List<ColoredPixel> pixelList, int pixelNumberX, int pixelNumberY){
        int pixelInPixelListPosition = -1;

        for (int pixelNumber = 0; pixelNumber < pixelList.size(); pixelNumber++){
            ColoredPixel tempPixel = pixelList.get(pixelNumber);

            if (tempPixel.coordinateX == pixelNumberX && tempPixel.coordinateY == pixelNumberY)
                return pixelNumber;
        }

        return pixelInPixelListPosition;
    }
}
