package token.api.cache;

import org.springframework.stereotype.Service;
import token.api.entity.Token;
import token.api.entity.UserInfo;

import java.util.HashMap;

@Service
public class TokenCache {

    private HashMap<String, UserInfo> cache;

    public TokenCache() {
        cache = new HashMap<>();
    }

    public void setUserInfo(Token token, UserInfo userInfo) {
        cache.putIfAbsent(token.getToken(), userInfo);
    }

    public UserInfo getUserInfo(Token token) {
        return cache.get(token.getToken());
    }

}