package profiles.api.services;

import org.springframework.beans.factory.annotation.Autowired;
import profiles.api.controllers.UnauthorizedException;
import profiles.api.profile.Profile;
import profiles.api.user.User;
import profiles.api.user.UserRepository;

public class ProfilesService {

    @Autowired
    UserRepository userRepository;

    public Profile getProfile(User user) {
        if (user.getLogin().equals("Uno"))
            throw new UnauthorizedException();

        return new Profile();
    }

}