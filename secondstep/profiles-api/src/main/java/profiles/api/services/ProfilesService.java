package profiles.api.services;

import profiles.api.controllers.UnauthorizedException;
import profiles.api.profile.Profile;
import profiles.api.user.User;

public class ProfilesService {

    public Profile getProfile(User user) {
        if (user.getLogin().equals("Uno"))
            throw new UnauthorizedException();

        return new Profile();
    }

}