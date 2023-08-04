package com.example.jcf_duty_app;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

public class traffic extends AppCompatActivity {

    TextView offence , point, section, code, amount, email;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_traffic);

        Intent intent = getIntent();
        OffenceClass offenceClass  = intent.getParcelableExtra("offence");
        point = findViewById(R.id.Points);
        offence = findViewById(R.id.offence);
        section = findViewById(R.id.section);
        code = findViewById(R.id.code);
        amount = findViewById(R.id.FineAmount);
        email = findViewById(R.id.email);

        // Set the text for each TextView
        offence.setText(offenceClass.getOffence());
        section.setText("SECTION : "+offenceClass.getSection());
        point.setText(String.valueOf("POINTS : "+offenceClass.getPoints()));
        code.setText("CODE : " +offenceClass.getCode());
        float amountValue = offenceClass.findAmount;
        amount.setText("FINE : " +String.valueOf(amountValue));
        email.setText("Dwayne.Aitken@jcf.gov.jm");
    }
}