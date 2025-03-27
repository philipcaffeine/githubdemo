import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JavaHttpJsonClient {

    private static final HttpClient client = HttpClient.newHttpClient();

    public static String sendGetRequest(String url) throws IOException, InterruptedException {
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Accept", "application/json")
                .GET()
                .build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        if (response.statusCode() == 200) {
            return response.body();
        } else {
            throw new RuntimeException("HTTP GET failed with status code: " + response.statusCode());
        }
    }

    public static void main(String[] args) {
        String url = "https://jsonplaceholder.typicode.com/posts/1";

        try {
            String jsonResponse = sendGetRequest(url);
            System.out.println("JSON Response:");
            System.out.println(jsonResponse);
        } catch (IOException | InterruptedException e) {
            System.err.println("Request failed: " + e.getMessage());
        }
    }
}