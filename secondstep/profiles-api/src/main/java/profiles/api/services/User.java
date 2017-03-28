package profiles.api.services;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

    @Id
    private String login;
    private String password;

    private String name;
    private String surname;
    private String patronicName;

    private String phone;

    public void setLogin(String str) {
        login = str;
    }

    public String getLogin() {
        return login;
    }

    public void setPassword(String str) {
        password = str;
    }

    public String getPassword() {
        return password;
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