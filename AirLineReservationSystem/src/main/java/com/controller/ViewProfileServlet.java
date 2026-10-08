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

@WebServlet("/ViewProfileServlet")
public class ViewProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("user/login.jsp");
			return;
		}

		User sessionUser = (User) session.getAttribute("user");

		UserDAO userDAO = new UserDAO();

		User user = userDAO.getUserById(sessionUser.getUserId());

		request.setAttribute("user", user);

		request.getRequestDispatcher("user/profile.jsp").forward(request, response);
	}
}