package places.api.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import places.api.place.Place;
import places.api.place.PlaceRepository;

import java.util.ArrayList;

@Service
public class PlacesService {

    @Autowired
    PlaceRepository repository;

    public ArrayList<Place> getPlaces() {
        ArrayList<Place> places = new ArrayList<>();

        for(Place place: repository.findAll()) {
            places.add(place);
        }

        return places;
    }

}