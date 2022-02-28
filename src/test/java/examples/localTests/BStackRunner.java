package examples.localTests;

import java.io.IOException;
import java.util.HashMap;

import com.intuit.karate.driver.WebDriver;
import com.browserstack.local.Local;

import okhttp3.Credentials;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

public class BStackRunner {

    public static Local bsLocal = new Local();

    public String markTestStatus(WebDriver driver) throws IOException {
        if (driver.getTitle().equals("StackDemo")) {

            // USING REST API TO MARK TEST
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

    public static Local startLocal() throws Exception {

        if(BStackRunner.bsLocal.isRunning()){
            return BStackRunner.bsLocal;
        }

        // You can also set an environment variable - "BROWSERSTACK_ACCESS_KEY".
        HashMap<String, String> bsLocalArgs = new HashMap<String, String>();
        bsLocalArgs.put("key", "BROWSERSTACK_ACCESS_KEY");
        bsLocalArgs.put("binarypath" , "/Users/princeton99/Desktop/BrowserStackLocal");

        // Starts the Local instance with the required arguments
        BStackRunner.bsLocal.start(bsLocalArgs);

        // Check if BrowserStack local instance is running
        System.out.println(BStackRunner.bsLocal.isRunning());

        return BStackRunner.bsLocal;
    }

    public static boolean stopLocal() throws Exception {

        BStackRunner.bsLocal.stop();

        if (BStackRunner.bsLocal.isRunning()) {
            return false;
        }

        return true;
    }
}
