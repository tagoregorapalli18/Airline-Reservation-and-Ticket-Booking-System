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

@WebServlet("/ViewFlightsServlet")
public class ViewFlightsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FlightDAO dao = new FlightDAO();

        List<Flight> flights = dao.getAllFlights();

        request.setAttribute("flights", flights);

        request.getRequestDispatcher("admin/viewFlights.jsp")
               .forward(request, response);
    }
}