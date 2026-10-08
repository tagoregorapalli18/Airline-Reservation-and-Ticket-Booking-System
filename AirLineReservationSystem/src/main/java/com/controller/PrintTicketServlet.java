package com.controller;

import java.io.IOException;

import com.dao.BookingDAO;
import com.dao.FlightDAO;
import com.model.Booking;
import com.model.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PrintTicketServlet")
public class PrintTicketServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        BookingDAO bookingDAO = new BookingDAO();
        Booking booking = bookingDAO.getBookingById(bookingId);

        if (booking == null) {
            response.sendRedirect(request.getContextPath()
                    + "/ViewMyBookingsServlet?error=Booking Not Found");
            return;
        }

        FlightDAO flightDAO = new FlightDAO();
        Flight flight = flightDAO.getFlightById(booking.getFlightId());

        request.setAttribute("booking", booking);
        request.setAttribute("flight", flight);

        request.getRequestDispatcher("user/ticket.jsp")
               .forward(request, response);
    }
}