package image.api.repository;

import image.api.entity.UserImage;
import org.springframework.data.repository.CrudRepository;

public interface UserImageRepository extends CrudRepository<UserImage, String> {
}
