package com.gemalto.testdb;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestJdbc {
    public static void main(String[] args) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/web_customer_tracker?useSSL=false";
        String user = "springstudent";
        String pass = "springstudent";

        try {
            System.out.println("Connecting to testjdbcconnection URL: " + jdbcUrl);
            Connection connection = DriverManager.getConnection(jdbcUrl, user, pass);
            System.out.println("Connection successful.!!!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
