package com.example.jcf_duty_app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class custombaseAdopter extends BaseAdapter {

    private Context context;
    private ArrayList<OffenceClass> originalArraylist;
    private ArrayList<OffenceClass> filteredArraylist;
    private LayoutInflater inflater;
    private CustomFilter filter;

    private Activity activityContext;
    public custombaseAdopter(Activity activityContext, ArrayList<OffenceClass> arraylist) {
        this.activityContext = activityContext;
        this.originalArraylist = arraylist;
        this.filteredArraylist = new ArrayList<>(arraylist);
        this.inflater = LayoutInflater.from(activityContext);
    }

    @Override
    public int getCount() {
        return filteredArraylist.size();
    }

    @Override
    public OffenceClass getItem(int position) {
        return filteredArraylist.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if (convertView == null) {
            convertView = inflater.inflate(R.layout.mylistview, parent, false);
        }

        TextView codeTextView = convertView.findViewById(R.id.code);
        TextView offenceTextView = convertView.findViewById(R.id.offence);
        OffenceClass offenceClass = filteredArraylist.get(position);
        codeTextView.setText(offenceClass.getCode());
        offenceTextView.setText(offenceClass.getOffence());

        // Set the click listener for the item
        convertView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // Display a toast message with the clicked item's offence description
                String clickedOffence = offenceClass.getOffence();
                Toast.makeText(activityContext, "Clicked item: " + clickedOffence, Toast.LENGTH_SHORT).show();


                // Open the OffenceDetailsActivity when an item is clicked
           //     Intent intent = new Intent(activityContext, OffenceDetailsActivity.class);
            //    intent.putExtra("KEY_NAME", offenceClass);
            //    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK); // Add the FLAG_ACTIVITY_NEW_TASK flag
              //  activityContext.startActivity(intent);

                Intent intent = new Intent(activityContext, traffic.class);
                intent.putExtra("offence", offenceClass);
                activityContext.startActivity(intent);

            }
        });

        return convertView;
    }


    public Filter getFilter() {
        if (filter == null) {
            filter = new CustomFilter();
        }
        return filter;
    }

    private class CustomFilter extends Filter {
        @Override
        protected FilterResults performFiltering(CharSequence constraint) {
            FilterResults results = new FilterResults();
            List<OffenceClass> filteredList = new ArrayList<>();

            // Perform filtering logic here
            if (constraint == null || constraint.length() == 0) {
                // If the search text is empty, show all offences
                filteredList.addAll(originalArraylist);
            } else {
                String filterPattern = constraint.toString().toLowerCase().trim();
                for (OffenceClass offence : originalArraylist) {
                    if (offence.getOffence().toLowerCase().contains(filterPattern)) {
                        filteredList.add(offence);
                    }
                }
            }

            results.values = filteredList;
            results.count = filteredList.size();
            return results;
        }

        @Override
        protected void publishResults(CharSequence constraint, FilterResults results) {
            // Clear the current filtered list and add the filtered results
            filteredArraylist.clear();
            filteredArraylist.addAll((ArrayList<OffenceClass>) results.values);

            // Notify the adapter that the data has changed
            notifyDataSetChanged();
        }
    }
}
