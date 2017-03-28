package profiles.api.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import profiles.api.exceptions.UnauthorizedException;
import profiles.api.services.Profile;
import profiles.api.services.Login;
import profiles.api.services.ProfilesService;

@RestController
public class ProfilesController {

    @Autowired
    private ProfilesService service;

    @ResponseStatus(value=HttpStatus.UNAUTHORIZED,
            reason="Unauthorized")  // 401
    @ExceptionHandler(UnauthorizedException.class)
    public void unauthorized() {
        
    }

    @RequestMapping(value = "/getProfile", method = RequestMethod.POST)
    public Profile getProfile(@RequestBody Login login) {
        return service.getProfile(login);
    }

}