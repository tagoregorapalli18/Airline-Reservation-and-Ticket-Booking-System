package com.controller;

import java.io.IOException;

import com.dao.BookingDAO;
import com.dao.FlightDAO;
import com.model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int bookingId =
                Integer.parseInt(request.getParameter("bookingId"));

        BookingDAO bookingDAO = new BookingDAO();

        Booking booking = bookingDAO.getBookingById(bookingId);

        if (booking != null &&
                "Booked".equalsIgnoreCase(booking.getBookingStatus())) {

            bookingDAO.cancelBooking(bookingId);

            FlightDAO flightDAO = new FlightDAO();

            flightDAO.increaseAvailableSeats(
                    booking.getFlightId(),
                    booking.getSeatCount());
        }

        response.sendRedirect(
                request.getContextPath() +
                "/ViewMyBookingsServlet");
    }
}