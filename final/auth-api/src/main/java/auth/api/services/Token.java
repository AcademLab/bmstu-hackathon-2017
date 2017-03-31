package auth.api.services;

public class Token {

    private String token;

    Token() {
        setToken("LALALA");
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }

}
