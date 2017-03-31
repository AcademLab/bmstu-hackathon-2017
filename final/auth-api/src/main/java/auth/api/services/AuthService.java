package auth.api.services;

import auth.api.entity.Token;
import auth.api.exceptions.FailedPasswordException;
import auth.api.exceptions.LoginNotFoundException;
import auth.api.entity.UserInfo;
import auth.api.repository.UserInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class AuthService {

    // todo параметризовать
    private final String host = "localhost";
    private final String port = "8091";

    @Autowired
    private UserInfoRepository userInfoRepository;

    public Token auth(UserInfo receivedInfo) {

        UserInfo authInfo = userInfoRepository.findOne(receivedInfo.getLogin());

        if (authInfo == null)
            throw new LoginNotFoundException();

        CryptographyService cryptographer = new CryptographyService();

        if (!authInfo.getPasswordHash().equals(cryptographer.encrypt(receivedInfo.getPasswordHash()))) {
            // todo Инкрементировать количество неуспешных попыток и тд
            throw new FailedPasswordException();
        }

        RestTemplate restTemplate = new RestTemplate();
        String url = "http://" + host + ":" + port + "/wrap";
        return restTemplate.postForObject(url, authInfo, Token.class);
    }

}



