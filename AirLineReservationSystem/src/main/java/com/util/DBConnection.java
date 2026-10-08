package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static Connection con;
	public static Connection getConnection() {
       try {
    	   if(con==null||con.isClosed()) {
    		   Class.forName("com.mysql.cj.jdbc.Driver");
    		   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_db","root","root");
    		   System.out.println("Database connected");
    	   }
       }
       catch(Exception e) {
    	   System.out.println(e);
       }
	   return con;
}
}
