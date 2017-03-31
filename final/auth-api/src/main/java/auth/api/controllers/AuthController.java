package auth.api.controllers;

import auth.api.services.Token;
import auth.api.services.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import auth.api.services.AuthService;

@RestController
public class AuthController {

    @Autowired
    private AuthService service;

    @RequestMapping(value = "/auth", method = RequestMethod.POST)
    public Token getProfile(@RequestBody UserInfo userInfo) {
        return service.getToken(userInfo);
    }

}