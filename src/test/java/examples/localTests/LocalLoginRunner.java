package examples.localTests;

import com.intuit.karate.junit5.Karate;

class LocalLoginRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("localLogin").relativeTo(getClass());
    }    

}