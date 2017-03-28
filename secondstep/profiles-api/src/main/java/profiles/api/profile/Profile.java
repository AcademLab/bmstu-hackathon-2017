package profiles.api.profile;

public class Profile {

    private String name;
    private String surname;
    private String patronicName;
    private String phone;

    public Profile(String name, String surname,
                   String patronicName, String phone) {
        setName(name);
        setSurname(surname);
        setPatronicName(patronicName);
        setPhone(phone);
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