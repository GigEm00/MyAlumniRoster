package com.webapp.myalumniroster.dto;




import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;







public class HttpBasicAuth {

    public static void main(String[] args) {

        try {
            URL url = new URL ("https://api.mysportsfeeds.com/v2.1/pull/nfl/players.json");
           // String encoding = Base64.encode("141ef627-9a60-4705-97cd-0e3d05:MYSPORTSFEEDS");

            Base64.Encoder encoder = Base64.getEncoder();
            String encoding = "141ef627-9a60-4705-97cd-0e3d05:MYSPORTSFEEDS";
            String encodedString = encoder.encodeToString(
            		encoding.getBytes(StandardCharsets.UTF_8));
            
            
          
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setRequestProperty("Authorization", "Basic " + encodedString);
            InputStream content = (InputStream)connection.getInputStream();
            BufferedReader in = 
                new BufferedReader(new InputStreamReader(content));
            String line;
            while ((line = in.readLine()) != null) {
                System.out.println(line);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }

    }

}