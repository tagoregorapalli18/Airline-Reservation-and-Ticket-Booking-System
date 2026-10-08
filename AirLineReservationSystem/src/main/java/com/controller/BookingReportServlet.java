package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.BookingDAO;

import com.model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BookingReportServlet")
public class BookingReportServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("admin") == null) {
			response.sendRedirect("admin/adminLogin.jsp");
			return;
		}

		BookingDAO bookingDAO = new BookingDAO();

		List<Booking> bookings = bookingDAO.getAllBookings();

		request.setAttribute("bookings", bookings);

		request.getRequestDispatcher("admin/bookingReport.jsp").forward(request, response);
	}
}