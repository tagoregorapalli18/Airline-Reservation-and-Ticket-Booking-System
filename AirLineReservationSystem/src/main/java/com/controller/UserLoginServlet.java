package com.controller;

import java.io.IOException;

import com.dao.UserDAO;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read form data
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // ===== Server-Side Validation =====

        // Email Validation
        if (email == null || email.trim().isEmpty()) {
            response.sendRedirect("user/login.jsp?error=Email is required");
            return;
        }

        // Email Format Validation
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            response.sendRedirect("user/login.jsp?error=Invalid Email Format");
            return;
        }

        // Password Validation
        if (password == null || password.trim().isEmpty()) {
            response.sendRedirect("user/login.jsp?error=Password is required");
            return;
        }

        UserDAO dao = new UserDAO();

        User user = dao.loginUser(email, password);

        if (user != null) {

            HttpSession session = request.getSession();

            session.setAttribute("user", user);

            response.sendRedirect("user/userDashboard.jsp");

        } else {

            response.sendRedirect("user/login.jsp?error=Invalid Email or Password");

        }
    }
}