package profiles.api.place;

public class Place {

    private String name;

    public Place(String name) {
        setName(name);
    }

    public void setName(String str) {
        name = str;
    }

    public String getName() {
        return name;
    }

}
