package token.api.entity;

public class Token {

    private String token;

    public Token() {

    }

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
