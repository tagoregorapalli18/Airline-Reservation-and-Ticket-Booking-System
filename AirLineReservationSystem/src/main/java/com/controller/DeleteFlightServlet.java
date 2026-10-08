package com.controller;

import java.io.IOException;

import com.dao.FlightDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteFlightServlet")
public class DeleteFlightServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        FlightDAO dao = new FlightDAO();

        boolean status = dao.deleteFlight(id);

        if(status) {
            response.sendRedirect("ViewFlightsServlet");
        } else {
            response.getWriter().println("Failed to Delete Flight");
        }
    }
}