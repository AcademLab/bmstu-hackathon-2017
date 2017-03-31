package token.api.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import token.api.entity.Token;
import token.api.entity.UserInfo;
import token.api.cache.TokenCache;
import java.util.GregorianCalendar;

@Service
public class TokenService {

    @Autowired
    private TokenCache cache;

    public Token wrap(UserInfo userInfo) {
        Token token = new Token(Long.toString(new GregorianCalendar().getTimeInMillis()));
        cache.setUserInfo(token, userInfo);
        return token;
    }

    public UserInfo unWrap(Token token) {
        return cache.getUserInfo(token);
    }
}