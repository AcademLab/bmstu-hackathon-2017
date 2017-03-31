package token.api.entity;

public class UserInfo {

    private String login;

    public UserInfo() {

    }

    public UserInfo(String login) {
        setLogin(login);
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getLogin() {
        return login;
    }

}
