package profiles.api.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import profiles.api.exceptions.UnauthorizedException;

@Service
public class ProfilesService {

    @Autowired
    private UserRepository userRepository;

    public Profile getProfile(Login login) {
        User user = userRepository.findOne(login.getLogin());

        if (user == null)
            throw new UnauthorizedException();

        if (user.getPassword() != login.getPassword())
            throw new UnauthorizedException();

        return new Profile(user.getName(), user.getSurname(),
                user.getPatronicName(), user.getPhone());
    }

}