package profiles.api.services;

import org.springframework.stereotype.Service;
import profiles.api.place.Place;
import java.util.ArrayList;

@Service
public class PlacesService {

    public ArrayList<Place> getPlaces() {
        ArrayList<Place> places = new ArrayList<>();

        places.add(new Place("One"));
        places.add(new Place("Two"));
        places.add(new Place("Three"));

        return places;
    }

}