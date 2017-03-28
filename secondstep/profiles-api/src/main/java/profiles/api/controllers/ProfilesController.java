package profiles.api.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import profiles.api.profile.Profile;
import profiles.api.user.User;
import profiles.api.services.ProfilesService;

@RestController
public class ProfilesController {

    @ResponseStatus(value=HttpStatus.UNAUTHORIZED,
            reason="Unauthorized")  // 401
    @ExceptionHandler(UnauthorizedException.class)
    public void unauthorized() {
        
    }

    @RequestMapping(value = "/getProfile", method = RequestMethod.POST)
    public Profile getProfile(@RequestBody User user) {
        ProfilesService service = new ProfilesService();
        return service.getProfile(user);
    }

}