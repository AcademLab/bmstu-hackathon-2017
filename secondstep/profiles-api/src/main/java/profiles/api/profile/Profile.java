package profiles.api.profile;

public class Profile {

    private String name;
    private String surname;
    private String patronicName;

    public Profile() {
        name = "Default";
        surname = "Default";
        patronicName = "Default";
    }

    public void setName(String str) {
        name = str;
    }

    public String getName() {
        return name;
    }

    public void setSurname(String str) {
        surname = str;
    }

    public String getSurname() {
        return surname;
    }

    public void setPatronicName(String str) {
        patronicName = str;
    }

    public String getPatronicName() {
        return patronicName;
    }

}