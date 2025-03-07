import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpClientExample {

    public static String sendGetRequest(String urlString) throws Exception {
        URL url = new URL(urlString); // Deprecated since version 20
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        BufferedReader in = new BufferedReader(new InputStreamReader(
            connection.getInputStream()));
        String inputLine;
        StringBuilder response = new StringBuilder();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        return response.toString();
    }

    private String combineHttpResponse(String str1, String str2){ // Method never used locally
        try {
            String response1 = sendGetRequest(str1);
            String response2 = sendGetRequest(str2);
            return response1 + "\n" + response2;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    

    public static void main(String[] args) {
        try {
            String response = sendGetRequest("https://example.com");
            System.out.println("Response: " + response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
