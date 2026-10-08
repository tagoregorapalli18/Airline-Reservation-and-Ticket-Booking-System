package com.controller;

import java.io.IOException;

import com.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		// Check Admin Session
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("admin") == null) {

			response.sendRedirect(request.getContextPath()
					+ "/admin/adminLogin.jsp");
			return;
		}

		// Read User ID
		int userId = Integer.parseInt(request.getParameter("userId"));

		// Delete User
		UserDAO dao = new UserDAO();

		boolean status = dao.deleteUser(userId);

		if (status) {

			response.sendRedirect(request.getContextPath()
					+ "/ViewUsersServlet?success=User Deleted Successfully");

		} else {

			response.sendRedirect(request.getContextPath()
					+ "/ViewUsersServlet?error=Unable to Delete User");

		}
	}
}