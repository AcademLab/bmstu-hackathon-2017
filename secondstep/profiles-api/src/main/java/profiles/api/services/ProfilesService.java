package profiles.api.services;

import profiles.api.profile.Profile;

public class ProfilesService {

    public Profile getProfile() {
        return new Profile();
    }

}