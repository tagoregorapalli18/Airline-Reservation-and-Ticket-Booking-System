package com.test;

import com.dao.AdminDAO;
import com.model.Admin;

public class TestAdminLogin {

    public static void main(String[] args) {

        AdminDAO dao = new AdminDAO();

        Admin admin = dao.login("admin", "admin123");

        if (admin != null) {
            System.out.println("Login Successful");
            System.out.println("Welcome " + admin.getUsername());
        } else {
            System.out.println("Invalid Username or Password");
        }
    }
}