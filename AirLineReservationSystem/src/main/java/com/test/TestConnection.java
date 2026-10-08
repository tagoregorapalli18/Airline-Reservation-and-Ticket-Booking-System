package com.test;

import java.sql.Connection;

import com.util.DBConnection;

public class TestConnection {
	public static void main(String[] args) {
		Connection con=DBConnection.getConnection();
		if(con!=null) {
			System.out.println("connection succesfully");
		}
		else {
			System.out.println("Connection failed");
		}
	}

}
