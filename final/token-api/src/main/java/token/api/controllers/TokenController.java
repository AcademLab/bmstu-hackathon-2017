package token.api.controllers;

import token.api.Token;
import token.api.UserInfo;
import token.api.services.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class TokenController {

    @Autowired
    private TokenService tokenService;

    @RequestMapping(value = "/wrap", method = RequestMethod.POST)
    public Token wrap(@RequestBody UserInfo userInfo) {
        return tokenService.wrap(userInfo);
    }

    @RequestMapping(value = "/unWrap", method = RequestMethod.POST)
    public UserInfo unWrap(@RequestBody Token token) {
        return tokenService.unWrap(token);
    }

}