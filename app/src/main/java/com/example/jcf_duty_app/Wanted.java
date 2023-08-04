package com.example.jcf_duty_app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkError;
import com.android.volley.NoConnectionError;
import com.android.volley.ParseError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Wanted extends AppCompatActivity {
    // Declare member variables for storing data
    private int[] images;
    private String[] version;
    private String[] versionNumber;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_wanted);

        ListView lView;
        final ListAdapter[] lAdapter = new ListAdapter[1];

        lView = findViewById(R.id.list_item);


        String url = "http://192.168.62.194//andriod/database.php";

        JsonArrayRequest jsonArrayRequest = new JsonArrayRequest(
                Request.Method.GET,
                url,
                null,
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        try {
                            // Process the JSON response and filter the data based on your criteria
                            int[] images;
                            String[] version;
                            String[] versionNumber;

                            // Assuming your JSON response has "picture_path", "item_name", and "item_description" keys
                            int length = response.length();
                            images = new int[length];
                            version = new String[length];
                            versionNumber = new String[length];

                            for (int i = 0; i < length; i++) {
                                JSONObject item = response.getJSONObject(i);
                                images[i] = R.drawable.bg_view; // Set a default image or load it from "item.getString("picture_path")"
                                version[i] = item.getString("item_name");
                                versionNumber[i] = item.getString("item_description");
                            }

                            lAdapter[0] = new ListAdapter(Wanted.this, version, versionNumber, images);
                            lView.setAdapter(lAdapter[0]);
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        // Show an error message in case of connection failure


                                               // Log the Volley error with more details
                        if (error instanceof NetworkError) {
                            Log.e("Volley Error", "NetworkError: Unable to connect to the server. Please check your internet connection.");
                        } else if (error instanceof ServerError) {
                            Log.e("Volley Error", "ServerError: The server returned an error response.");
                        } else if (error instanceof AuthFailureError) {
                            Log.e("Volley Error", "AuthFailureError: Authentication failure while making the request.");
                        } else if (error instanceof ParseError) {
                            Log.e("Volley Error", "ParseError: Error parsing the server response.");
                        } else if (error instanceof NoConnectionError) {
                            Log.e("Volley Error", "NoConnectionError: No connection to the server.");
                        } else if (error instanceof TimeoutError) {
                            Log.e("Volley Error", "TimeoutError: Connection timeout. Please try again later.");
                        } else {
                            // For other types of errors, you can log the error message
                            if (error.getMessage() != null) {
                                Log.e("Volley Error", "UnknownError: " + error.getMessage());
                            }
                        }
                    }
                });

        // Add the request to the RequestQueue
        Volley.newRequestQueue(this).add(jsonArrayRequest);

        lView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                // Handle item click here
                Toast.makeText(Wanted.this, version[i] + " " + versionNumber[i], Toast.LENGTH_SHORT).show();
            }
        });
    }
}