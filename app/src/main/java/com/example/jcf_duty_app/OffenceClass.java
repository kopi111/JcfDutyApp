package com.example.jcf_duty_app;


import android.os.Parcel;
import android.os.Parcelable;

import androidx.annotation.NonNull;

public class OffenceClass implements Parcelable {

    public String offence;
    public String code;
    public float findAmount;
    public int points ;
    public String section;

    public OffenceClass(String offence, String code, float findAmount, int points, String section) {


        this.offence = offence;
        this.code = code;
        this.findAmount = findAmount;
        this.points = points;
        this.section = section;
    }


    protected OffenceClass(Parcel in) {
        offence = in.readString();
        code = in.readString();
        findAmount = in.readFloat();
        points = in.readInt();
        section = in.readString();
    }

    public static final Creator<OffenceClass> CREATOR = new Creator<OffenceClass>() {
        @Override
        public OffenceClass createFromParcel(Parcel in) {
            return new OffenceClass(in);
        }

        @Override
        public OffenceClass[] newArray(int size) {
            return new OffenceClass[size];
        }
    };

    public String getOffence() {
        return offence;
    }

    public void setOffence(String offence) {
        this.offence = offence;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public float getFindAmount() {
        return findAmount;
    }

    public void setFindAmount(float findAmount) {
        this.findAmount = findAmount;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(@NonNull Parcel dest, int flags) {
        dest.writeString(offence);
        dest.writeString(code);
        dest.writeFloat(findAmount);
        dest.writeInt(points);
        dest.writeString(section);
    }
}
