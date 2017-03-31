package auth.api.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class UserInfo {

    @Id
    private String login;
    private String passwordHash;

    public UserInfo() {

    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getLogin() {
        return this.login;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getPasswordHash() {
        return this.passwordHash;
    }

}