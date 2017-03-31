package token.api.services;

import org.springframework.stereotype.Service;
import token.api.Token;
import token.api.UserInfo;

@Service
public class TokenService {

    public Token wrap(UserInfo userInfo) {
        return new Token("lala");
    }

    public UserInfo unWrap(Token token) {
        return new UserInfo("lala");
    }
}