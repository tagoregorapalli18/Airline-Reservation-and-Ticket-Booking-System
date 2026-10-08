package com.controller;

import java.io.IOException;

import com.dao.FlightDAO;
import com.model.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookFlightServlet")
public class BookFlightServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int flightId =
                Integer.parseInt(request.getParameter("flightId"));

        FlightDAO dao = new FlightDAO();

        Flight flight = dao.getFlightById(flightId);

        request.setAttribute("flight", flight);

        request.getRequestDispatcher("user/bookFlight.jsp")
               .forward(request, response);
    }
}