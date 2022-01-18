package examples.multipleBrowser;

import com.intuit.karate.junit5.Karate;

class MultipleBrowser {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("multipleBrowser").relativeTo(getClass());
    }    
}
