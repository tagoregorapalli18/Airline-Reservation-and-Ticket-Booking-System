package com.controller;

import java.io.IOException;

import com.dao.DashboardDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

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

		DashboardDAO dao = new DashboardDAO();

		// Existing Dashboard Statistics
		request.setAttribute("totalFlights", dao.getTotalFlights());
		request.setAttribute("totalUsers", dao.getTotalUsers());
		request.setAttribute("totalBookings", dao.getTotalBookings());
		request.setAttribute("activeBookings", dao.getActiveBookings());

		// New Dashboard Statistics
		request.setAttribute("totalRevenue", dao.getTotalRevenue());
		request.setAttribute("todayBookings", dao.getTodayBookings());
		request.setAttribute("monthlyBookings", dao.getMonthlyBookings());

		request.getRequestDispatcher("admin/adminDashboard.jsp")
				.forward(request, response);
	}
}