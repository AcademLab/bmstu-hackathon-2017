package profiles.api.controllers;

import org.springframework.web.bind.annotation.*;
import profiles.api.profile.Profile;
import profiles.api.profile.UserInfo;
import profiles.api.services.ProfilesService;

@RestController
public class ProfilesController {

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public Profile getProfile(@RequestBody UserInfo userInfo) {
        ProfilesService service = new ProfilesService();
        return service.getProfile();
    }

}