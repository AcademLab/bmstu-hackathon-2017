package image.api.services;

import image.api.entity.Image;
import image.api.entity.Token;
import image.api.entity.UserImage;
import image.api.entity.UserInfo;
import image.api.exceptions.ImageNotFoundException;
import image.api.exceptions.TokenNotFoundException;
import image.api.repository.UserImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class ImageService {

    @Value("${tokenServiceHost}")
    private String tokenServiceHost;

    @Value("${tokenServicePort}")
    private String tokenServicePort;

    @Autowired
    private UserImageRepository userImageRepository;

    public Image getImage(Token token) {
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://" + tokenServiceHost + ":" + tokenServicePort + "/unWrap";
        UserInfo userInfo = restTemplate.postForObject(url, token, UserInfo.class);

        if (userInfo == null)
            throw new TokenNotFoundException();

        UserImage userImage = userImageRepository.findOne(userInfo.getLogin());

        if (userImage == null)
            throw new ImageNotFoundException();

        return new Image(userImage.getImage());
    }

    public Image setImage(Token token, Image image) {
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://" + tokenServiceHost + ":" + tokenServicePort + "/unWrap";
        UserInfo userInfo = restTemplate.postForObject(url, token, UserInfo.class);

        if (userInfo == null)
            throw new TokenNotFoundException();

        UserImage userImage = userImageRepository.findOne(userInfo.getLogin());

        if (userImage != null) {
            userImageRepository.delete(userInfo.getLogin());
            userImageRepository.save(new UserImage(userInfo.getLogin(), image.getImage()));
        }
        else {
            userImageRepository.save(new UserImage(userInfo.getLogin(), image.getImage()));
        }

        return image;
    }

}