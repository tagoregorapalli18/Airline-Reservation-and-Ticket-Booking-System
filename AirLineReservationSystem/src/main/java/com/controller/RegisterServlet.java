package com.controller;

import java.io.IOException;

import com.dao.UserDAO;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Read form data
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");

		// ===== Server-Side Validation =====

		// Full Name
		if (fullName == null || fullName.trim().isEmpty()) {
			response.sendRedirect("user/register.jsp?error=Full Name is required");
			return;
		}

		// Email
		if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
			response.sendRedirect("user/register.jsp?error=Invalid Email");
			return;
		}

		// Phone
		if (phone == null || !phone.matches("\\d{10}")) {
			response.sendRedirect("user/register.jsp?error=Phone number must be exactly 10 digits");
			return;
		}

		// Gender
		if (gender == null || gender.trim().isEmpty()) {
			response.sendRedirect("user/register.jsp?error=Please select Gender");
			return;
		}

		// Password
		if (password == null || password.length() < 6) {
			response.sendRedirect("user/register.jsp?error=Password must be at least 6 characters");
			return;
		}

		// Create User Object
		User user = new User();

		user.setFullName(fullName);
		user.setEmail(email);
		user.setPhone(phone);
		user.setPassword(password);
		user.setGender(gender);

		UserDAO dao = new UserDAO();

		boolean status = dao.registerUser(user);

		if (status) {

			response.sendRedirect("user/login.jsp?success=Registration Successful");

		} else {

			response.sendRedirect("user/register.jsp?error=Registration Failed");

		}
	}
}