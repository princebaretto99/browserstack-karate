package examples.favourites;

import com.intuit.karate.junit5.Karate;

class FavouriteRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("favourites").relativeTo(getClass());
    }    
}
