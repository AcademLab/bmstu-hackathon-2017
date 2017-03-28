package profiles.api.profile;

public class Profile {

    private String name;
    private String surname;
    private String patronicName;
    private String phone;

    public Profile() {
        name = "Default";
        surname = "Default";
        patronicName = "Default";
        phone = "+7 (999) 990 19 96";
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

    public void setPhone(String str) {
        phone = str;
    }

    public String getPhone() {
        return phone;
    }

}