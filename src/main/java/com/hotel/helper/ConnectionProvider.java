//@author ADITYA
package com.hotel.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {

        try {
            if (con == null) {

//            Class Loader
            //Class.forName("oracle.jdbc.driver.OracleDriver");
                Class.forName("org.postgresql.Driver");

//            create a connection
              //con = DriverManager.getConnection("jdbc:oracle:thin:@Aditya:1521:XE", "H1", "H1");
              //con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/H1", "postgres", "root");
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
