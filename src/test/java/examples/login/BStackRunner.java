package examples.login;

import java.io.IOException;

import com.intuit.karate.driver.WebDriver;

import okhttp3.Credentials;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

public class BStackRunner {
    public String markTestStatus(WebDriver driver) throws IOException {
        if (driver.getTitle().equals("StackDemo")) {

            //USING REST API TO MARK TEST
            OkHttpClient client = new OkHttpClient().newBuilder()
                    .build();
            String credential = Credentials.basic("BROWSERSTACK_USERNAME", "BROWSERSTACK_ACCESS_KEY");
            RequestBody formBody = new FormBody.Builder()
                    .add("status", "passed")
                    .add("reason", "Titles Matched!")
                    .build();
            Request request = new Request.Builder()
                    .url("https://api.browserstack.com/automate/sessions/" + driver.getSessionId() + ".json")
                    .put(formBody)
                    .addHeader("Authorization", credential)
                    .build();
            client.newCall(request).execute();
            return "Tests Passed";
        }
        return "Tests Failed";
    }
}
