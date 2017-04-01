package image.api.controllers;

import image.api.entity.Image;
import image.api.entity.Token;
import image.api.exceptions.ImageNotFoundException;
import image.api.exceptions.TokenNotFoundException;
import image.api.services.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
public class ImageController {

    @Autowired
    private ImageService imageService;

    @ResponseStatus(value=HttpStatus.NOT_FOUND,
            reason="image not found")
    @ExceptionHandler(ImageNotFoundException.class)
    public void imageNotFoundException() {

    }

    @ResponseStatus(value=HttpStatus.UNAUTHORIZED,
            reason="token not found")
    @ExceptionHandler(TokenNotFoundException.class)
    public void tokenNotFoundException() {

    }

    @RequestMapping(value = "/getImage", method = RequestMethod.GET)
    public Image getImage(@RequestHeader(value="X-Auth-Token") String token) {
        return imageService.getImage(new Token(token));
    }

    @RequestMapping(value = "/setImage", method = RequestMethod.POST)
    public Image setImage(@RequestBody Image image, @RequestHeader(value="X-Auth-Token") String token) {
        return imageService.setImage(new Token(token), image);
    }

}