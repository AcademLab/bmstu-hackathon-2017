package profiles.api.services;

import org.springframework.beans.factory.annotation.Autowired;
import profiles.api.exceptions.UnauthorizedException;

public class ProfilesService {

    @Autowired
    UserRepository userRepository;

    public Profile getProfile(Login login) {
        if (login.getLogin().equals("Uno"))
            throw new UnauthorizedException();

        return new Profile();
    }

}