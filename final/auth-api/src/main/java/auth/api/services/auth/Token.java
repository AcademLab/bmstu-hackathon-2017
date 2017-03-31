package auth.api.services.auth;

public class Token {

    private String token;

    public Token(String token) {
        setToken(token);
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }

}