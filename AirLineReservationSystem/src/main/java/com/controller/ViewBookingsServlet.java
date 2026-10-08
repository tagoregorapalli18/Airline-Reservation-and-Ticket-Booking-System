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

@WebServlet("/ViewBookingsServlet")
public class ViewBookingsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BookingDAO dao = new BookingDAO();

		List<Booking> bookings = dao.getAllBookings();

		request.setAttribute("bookings", bookings);

		request.getRequestDispatcher("admin/viewBookings.jsp").forward(request, response);
	}
}