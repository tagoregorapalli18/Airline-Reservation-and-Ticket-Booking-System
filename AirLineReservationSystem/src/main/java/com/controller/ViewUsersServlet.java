package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.UserDAO;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/ViewUsersServlet")
public class ViewUsersServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("admin") == null) {

			response.sendRedirect(request.getContextPath()
					+ "/admin/adminLogin.jsp");
			return;
		}

		UserDAO dao = new UserDAO();

		List<User> users = dao.getAllUsers();

		request.setAttribute("users", users);

		request.getRequestDispatcher("admin/viewUsers.jsp")
				.forward(request, response);
	}
}