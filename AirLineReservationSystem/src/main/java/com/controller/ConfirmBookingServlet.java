package com.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.UUID;

import com.dao.BookingDAO;
import com.dao.FlightDAO;
import com.model.Booking;
import com.model.Flight;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("user/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        int flightId = Integer.parseInt(request.getParameter("flightId"));
        String passengerName = request.getParameter("passengerName");
        int passengerAge = Integer.parseInt(request.getParameter("passengerAge"));
        String passengerGender = request.getParameter("passengerGender");
        int seatCount = Integer.parseInt(request.getParameter("seatCount"));

        FlightDAO flightDAO = new FlightDAO();

        Flight flight = flightDAO.getFlightById(flightId);

        BigDecimal totalFare =
                flight.getTicketPrice().multiply(BigDecimal.valueOf(seatCount));

        Booking booking = new Booking();

        booking.setBookingReference(
                "BK" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());

        booking.setUserId(user.getUserId());
        booking.setFlightId(flightId);
        booking.setPassengerName(passengerName);
        booking.setPassengerAge(passengerAge);
        booking.setPassengerGender(passengerGender);
        booking.setSeatCount(seatCount);
        booking.setTotalFare(totalFare);
        booking.setBookingStatus("Booked");

        BookingDAO bookingDAO = new BookingDAO();

        boolean bookingSaved = bookingDAO.addBooking(booking);

        if (bookingSaved) {

            flightDAO.updateAvailableSeats(flightId, seatCount);

            request.setAttribute("booking", booking);

            request.getRequestDispatcher("user/bookingSuccess.jsp")
                   .forward(request, response);

        } else {

            response.sendRedirect("user/bookFlight.jsp?error=Booking Failed");

        }

    }
}