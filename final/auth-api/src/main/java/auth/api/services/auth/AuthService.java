package auth.api.services.auth;

import auth.api.exceptions.FailedPasswordException;
import auth.api.exceptions.LoginNotFoundException;
import auth.api.userinfo.UserInfo;
import auth.api.userinfo.UserInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    @Autowired
    private UserInfoRepository userInfoRepository;

    public Token auth(UserInfo receivedInfo) {

        UserInfo authInfo = userInfoRepository.findOne(receivedInfo.getLogin());

        if (authInfo == null)
            throw new LoginNotFoundException();

        Cryptographer cryptographer = new Cryptographer();

        if (!authInfo.getPasswordHash().equals(cryptographer.encrypt(receivedInfo.getPasswordHash()))) {
            // todo Инкрементировать количество неуспешных попыток и тд
            throw new FailedPasswordException();
        }

        // todo вызвать сервис для шифрования токена

        return new Token("some_token");
    }

}



