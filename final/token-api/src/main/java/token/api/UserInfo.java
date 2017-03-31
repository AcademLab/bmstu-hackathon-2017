package token.api;

public class UserInfo {

    private String login;

    public UserInfo(String login) {
        setLogin(login);
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

}
