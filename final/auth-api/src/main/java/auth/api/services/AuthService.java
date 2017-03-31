package auth.api.services;

import org.springframework.stereotype.Service;

@Service
public class AuthService {

    public Token getToken(UserInfo userInfo) {
        return new Token();
    }

}