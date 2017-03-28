package profiles.api.services;

import profiles.api.controllers.UnauthorizedException;
import profiles.api.profile.Profile;
import profiles.api.profile.UserInfo;

public class ProfilesService {

    public Profile getProfile(UserInfo userInfo) {
        if (userInfo.getLogin().equals("Uno"))
            throw new UnauthorizedException();

        return new Profile();
    }

}