package com.controller;

import java.io.IOException;

import com.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Check whether new password and confirm password match
        if (!newPassword.equals(confirmPassword)) {

            response.sendRedirect(request.getContextPath()
                    + "/user/forgotPassword.jsp?error=Passwords do not match");
            return;
        }

        UserDAO dao = new UserDAO();

        // Verify email exists
        boolean validUser = dao.verifyUser(email);

        if (!validUser) {

            response.sendRedirect(request.getContextPath()
                    + "/user/forgotPassword.jsp?error=Invalid Email");
            return;
        }

        // Update password
        boolean updated = dao.resetPassword(email, newPassword);

        if (updated) {

            response.sendRedirect(request.getContextPath()
                    + "/user/login.jsp?success=Password Reset Successfully. Please Login.");

        } else {

            response.sendRedirect(request.getContextPath()
                    + "/user/forgotPassword.jsp?error=Password Reset Failed");
        }
    }
}