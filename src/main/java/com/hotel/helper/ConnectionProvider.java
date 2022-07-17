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
                con = DriverManager.getConnection("jdbc:postgresql://ec2-52-205-61-230.compute-1.amazonaws.com/d2pdv0mvcodf8q", "aqjkftepzfnszu", "1e190c038c1158ea11853c48656e7227a9edf44dbd390690cf529cabd63a98d4");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
