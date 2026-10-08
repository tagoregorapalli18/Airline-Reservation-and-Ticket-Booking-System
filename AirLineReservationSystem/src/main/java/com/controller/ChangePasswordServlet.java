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

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("user") == null) {

			response.sendRedirect("user/login.jsp");
			return;
		}

		User user = (User) session.getAttribute("user");

		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");

		UserDAO dao = new UserDAO();

		// Check current password
		boolean validPassword = dao.checkPassword(user.getUserId(), currentPassword);

		if (!validPassword) {

			response.sendRedirect(
					request.getContextPath() + "/user/changePassword.jsp?error=Current Password is Incorrect");
			return;
		}

		// Check new password and confirm password
		if (!newPassword.equals(confirmPassword)) {

			response.sendRedirect(request.getContextPath()
					+ "/user/changePassword.jsp?error=New Password and Confirm Password do not match");
			return;
		}

		// Update password
		boolean updated = dao.changePassword(user.getUserId(), newPassword);

		if (updated) {

			response.sendRedirect(
					request.getContextPath() + "/user/changePassword.jsp?success=Password Updated Successfully");

		} else {

			response.sendRedirect(request.getContextPath() + "/user/changePassword.jsp?error=Password Update Failed");
		}
	}
}