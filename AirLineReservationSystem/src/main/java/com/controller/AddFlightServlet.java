package com.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;

import com.dao.FlightDAO;
import com.model.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddFlightServlet")
public class AddFlightServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Flight flight = new Flight();

        flight.setFlightNumber(request.getParameter("flightNumber"));
        flight.setAirlineName(request.getParameter("airlineName"));
        flight.setSource(request.getParameter("source"));
        flight.setDestination(request.getParameter("destination"));

        flight.setDepartureDate(Date.valueOf(request.getParameter("departureDate")));
        flight.setDepartureTime(Time.valueOf(request.getParameter("departureTime") + ":00"));
        flight.setArrivalTime(Time.valueOf(request.getParameter("arrivalTime") + ":00"));

        flight.setTicketPrice(new BigDecimal(request.getParameter("ticketPrice")));

        flight.setTotalSeats(Integer.parseInt(request.getParameter("totalSeats")));

        // Initially available seats = total seats
        flight.setAvailableSeats(Integer.parseInt(request.getParameter("totalSeats")));

        flight.setStatus(request.getParameter("status"));

        FlightDAO dao = new FlightDAO();

        boolean status = dao.addFlight(flight);

        if (status) {

            response.sendRedirect("admin/addFlight.jsp?success=Flight Added Successfully");

        } else {

            response.sendRedirect("admin/addFlight.jsp?error=Unable to Add Flight");

        }

    }
}