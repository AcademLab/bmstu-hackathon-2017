package auth.api.services.token;

public class Token {

    private String token;

    public Token() {
        setToken("LALALA");
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }

}