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

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userId = Integer.parseInt(request.getParameter("userId"));
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		User user = new User();
		user.setUserId(userId);
		user.setFullName(fullName);
		user.setEmail(email);
		user.setPhone(phone);

		UserDAO userDAO = new UserDAO();

		boolean status = userDAO.updateUser(user);

		if (status) {

			// Update session with latest user details
			HttpSession session = request.getSession();
			User updatedUser = userDAO.getUserById(userId);
			session.setAttribute("user", updatedUser);

			response.sendRedirect(request.getContextPath() + "/ViewProfileServlet?success=Profile Updated");

		} else {

			response.sendRedirect(request.getContextPath() + "/ViewProfileServlet?error=Update Failed");

		}
	}
}