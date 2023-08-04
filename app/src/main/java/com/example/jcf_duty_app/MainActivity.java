package com.example.jcf_duty_app;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

import com.example.jcf_duty_app.R;


public class MainActivity extends AppCompatActivity {

    private Activity activityContext = this;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Find the CardView items by their IDs
        View trafficOffenceCard = findViewById(R.id.traffic);
        View wantedCard = findViewById(R.id.wanted);
        View missingCard = findViewById(R.id.missing);
        View stolenCarCard = findViewById(R.id.stolenCar);
        View newsCard = findViewById(R.id.News);
        View stationContactCard = findViewById(R.id.contact);

        // Set click listeners for each CardView
        trafficOffenceCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (activityContext != null) {
                    showToast("Traffic Offence");
                    Intent intent = new Intent(activityContext, Trafficoffencedisplay.class);
                    activityContext.startActivity(intent);
                } else {
                    // Handle the case when activityContext is null (e.g., log an error, show a fallback, etc.)
                    Log.e("MainActivity", "activityContext is null. Unable to start the activity.");
                }
            }
        });

        wantedCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showToast("Wanted");
            }
        });

        missingCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showToast("Missing");
            }
        });

        stolenCarCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showToast("Stolen Car");
            }
        });

        newsCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showToast("News");
            }
        });

        stationContactCard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showToast("Station Contact");
            }
        });
    }

    // Helper method to show toast messages
    private void showToast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
    }
}