package auth.api.services;

import auth.api.exceptions.FailedPasswordException;
import auth.api.exceptions.LoginNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    @Autowired
    UserInfoRepository userInfoRepository;

    public Token createToken(UserInfo receivedInfo) {

        UserInfo authInfo = userInfoRepository.findOne(receivedInfo.getLogin());

        if (authInfo == null)
            throw new LoginNotFoundException();

        Cryptographer cryptographer = new Cryptographer();

        if (!authInfo.getPasswordHash().equals(cryptographer.encrypt(receivedInfo.getPasswordHash())))
            throw new FailedPasswordException();

        return new Token();
    }

}