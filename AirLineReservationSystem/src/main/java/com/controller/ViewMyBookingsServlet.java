package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.BookingDAO;
import com.model.Booking;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ViewMyBookingsServlet")
public class ViewMyBookingsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("user/login.jsp");
			return;
		}

		User user = (User) session.getAttribute("user");

		BookingDAO dao = new BookingDAO();

		List<Booking> bookings = dao.getBookingsByUserId(user.getUserId());

		request.setAttribute("bookings", bookings);

		request.getRequestDispatcher("user/myBookings.jsp").forward(request, response);
	}
}