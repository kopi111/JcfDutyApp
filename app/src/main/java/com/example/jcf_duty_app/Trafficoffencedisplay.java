package com.example.jcf_duty_app;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ListView;
import android.widget.SearchView;

import java.util.ArrayList;

public class Trafficoffencedisplay extends AppCompatActivity {


    SearchView mysearchView;
    ListView mylistView;
    custombaseAdopter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_trafficoffencedisplay);


        mylistView = findViewById(R.id.listViewMain);
        mysearchView = findViewById(R.id.searchViewMain);

        offence off = new offence();
        code cod = new code();
        Fine fine = new Fine();
        section sec = new section();
        points point = new points();
        ArrayList<OffenceClass> arraylist = new ArrayList<>();

        for (int i = 0; i < off.offenceDescription.length; i++) {
            OffenceClass offenceInstance = new OffenceClass(off.offenceDescription[i], cod.code[i], fine.fineAmount[i], point.fineAmount[i], sec.sectionOfRTA[i]);
            arraylist.add(offenceInstance);
        }

        // Use MainActivity.this instead of getApplicationContext()
        adapter = new custombaseAdopter(Trafficoffencedisplay.this, arraylist);
        mylistView.setAdapter(adapter);

        // Set the search query listener for filtering the list based on the search text
        mysearchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                adapter.getFilter().filter(newText);
                return false;
            }
        });
    }
}