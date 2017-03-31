package auth.api.services.token;

import org.springframework.stereotype.Service;

@Service
public class TokenService {

    public Token createToken(String login) {
        // todo сделать генерацию токенов
        return new Token("some_token");
    }

    public String decodeToken(Token token) {
        return "some_login";
    }

}