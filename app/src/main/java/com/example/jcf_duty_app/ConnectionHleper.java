package com.example.jcf_duty_app;

import android.annotation.SuppressLint;
import android.os.StrictMode;
import android.util.Log;

import java.sql.Connection;
import java.sql.DriverManager;
@SuppressLint("NewApi")
public class ConnectionHleper {
    Connection conn;
    String  ip,dataBase,uname,pass,port;

    public Connection ConnectionClass(){
      ip = " 192.168.0.4";
      dataBase = "Wanted";
      uname="test";
      pass="test";
      port="1433";


        StrictMode. ThreadPolicy policy = new StrictMode. ThreadPolicy.Builder ().permitAll().build();
        StrictMode.setThreadPolicy
                (policy);
        Connection connection= null;
        String ConnectionURL = null;
        try
        {
            Class.forName("net.sourceforge.jtds.jdbc.Driver");
            ConnectionURL= "jdbc: jtds: sqlserver://"+ ip + ":"+ port+";"+ "databasename="+ dataBase+";user="+uname+"; password="+pass+"; ";
            connection = DriverManager.getConnection(ConnectionURL);
        }
        catch (Exception ex) {
            Log.e(  "Error ", ex.getMessage());
        }
        return connection;
    }


}
