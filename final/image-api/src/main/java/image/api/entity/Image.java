package image.api.entity;

public class Image {

    private String image;

    public Image() {

    }

    public Image(String image) {
        setImage(image);
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage() {
        return image;
    }

}