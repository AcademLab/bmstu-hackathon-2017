package image.api.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class UserImage {

    @Id
    private String login;
    private String image;

    public UserImage() {

    }

    public UserImage(String login, String image) {
        setImage(image);
        setLogin(login);
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getLogin() {
        return login;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage() {
        return image;
    }

}
