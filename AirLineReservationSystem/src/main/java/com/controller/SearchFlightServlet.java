package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.FlightDAO;
import com.model.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchFlightServlet")
public class SearchFlightServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String departureDate = request.getParameter("departureDate");

        FlightDAO dao = new FlightDAO();

        List<Flight> flights = dao.searchFlights(source, destination, departureDate);

        request.setAttribute("flights", flights);

        request.getRequestDispatcher("user/searchResults.jsp")
               .forward(request, response);
    }
}