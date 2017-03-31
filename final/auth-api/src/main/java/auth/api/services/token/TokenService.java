package auth.api.services.token;

public class TokenService {

    public Token createToken(String login) {
        // Тут будет создание токена с помощью key/value хранилища
        return new Token();
    }

    public String decodeToken(Token token) {
        return "login";
    }

}