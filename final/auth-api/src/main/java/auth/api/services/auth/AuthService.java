package auth.api.services.auth;

import auth.api.exceptions.FailedPasswordException;
import auth.api.exceptions.LoginNotFoundException;
import auth.api.services.UserInfo;
import auth.api.services.UserInfoRepository;
import auth.api.services.token.Token;
import auth.api.services.token.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    @Autowired
    private UserInfoRepository userInfoRepository;

    @Autowired
    private TokenService tokenService;

    public Token auth(UserInfo receivedInfo) {

        UserInfo authInfo = userInfoRepository.findOne(receivedInfo.getLogin());

        if (authInfo == null)
            throw new LoginNotFoundException();

        Cryptographer cryptographer = new Cryptographer();

        if (!authInfo.getPasswordHash().equals(cryptographer.encrypt(receivedInfo.getPasswordHash()))) {
            // Инкрементировать количество неуспешных попыток
            // Заблокировать ip, если превышает

            throw new FailedPasswordException();
        }

        return tokenService.createToken(authInfo.getLogin());
    }

}



