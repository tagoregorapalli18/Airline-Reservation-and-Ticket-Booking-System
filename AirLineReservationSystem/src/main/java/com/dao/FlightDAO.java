package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Flight;
import com.util.DBConnection;

public class FlightDAO {

    public boolean addFlight(Flight flight) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO flights(flight_number, airline_name, source, destination, departure_date, departure_time, arrival_time, ticket_price, total_seats, available_seats, status) VALUES(?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, flight.getFlightNumber());
            ps.setString(2, flight.getAirlineName());
            ps.setString(3, flight.getSource());
            ps.setString(4, flight.getDestination());
            ps.setDate(5, flight.getDepartureDate());
            ps.setTime(6, flight.getDepartureTime());
            ps.setTime(7, flight.getArrivalTime());
            ps.setBigDecimal(8, flight.getTicketPrice());
            ps.setInt(9, flight.getTotalSeats());
            ps.setInt(10, flight.getAvailableSeats());
            ps.setString(11, flight.getStatus());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public List<Flight> getAllFlights() {

        List<Flight> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM flights";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Flight flight = new Flight();

                flight.setFlightId(rs.getInt("flight_id"));
                flight.setFlightNumber(rs.getString("flight_number"));
                flight.setAirlineName(rs.getString("airline_name"));
                flight.setSource(rs.getString("source"));
                flight.setDestination(rs.getString("destination"));
                flight.setDepartureDate(rs.getDate("departure_date"));
                flight.setDepartureTime(rs.getTime("departure_time"));
                flight.setArrivalTime(rs.getTime("arrival_time"));
                flight.setTicketPrice(rs.getBigDecimal("ticket_price"));
                flight.setTotalSeats(rs.getInt("total_seats"));
                flight.setAvailableSeats(rs.getInt("available_seats"));
                flight.setStatus(rs.getString("status"));

                list.add(flight);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }public Flight getFlightById(int id) {

        Flight flight = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM flights WHERE flight_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                flight = new Flight();

                flight.setFlightId(rs.getInt("flight_id"));
                flight.setFlightNumber(rs.getString("flight_number"));
                flight.setAirlineName(rs.getString("airline_name"));
                flight.setSource(rs.getString("source"));
                flight.setDestination(rs.getString("destination"));
                flight.setDepartureDate(rs.getDate("departure_date"));
                flight.setDepartureTime(rs.getTime("departure_time"));
                flight.setArrivalTime(rs.getTime("arrival_time"));
                flight.setTicketPrice(rs.getBigDecimal("ticket_price"));
                flight.setTotalSeats(rs.getInt("total_seats"));
                flight.setAvailableSeats(rs.getInt("available_seats"));
                flight.setStatus(rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flight;
    }public boolean updateFlight(Flight flight) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE flights SET flight_number=?, airline_name=?, source=?, destination=?, departure_date=?, departure_time=?, arrival_time=?, ticket_price=?, total_seats=?, available_seats=?, status=? WHERE flight_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, flight.getFlightNumber());
            ps.setString(2, flight.getAirlineName());
            ps.setString(3, flight.getSource());
            ps.setString(4, flight.getDestination());
            ps.setDate(5, flight.getDepartureDate());
            ps.setTime(6, flight.getDepartureTime());
            ps.setTime(7, flight.getArrivalTime());
            ps.setBigDecimal(8, flight.getTicketPrice());
            ps.setInt(9, flight.getTotalSeats());
            ps.setInt(10, flight.getAvailableSeats());
            ps.setString(11, flight.getStatus());
            ps.setInt(12, flight.getFlightId());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }public boolean deleteFlight(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM flights WHERE flight_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }public List<Flight> searchFlights(String source, String destination, String departureDate) {

        List<Flight> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM flights WHERE source=? AND destination=? AND departure_date=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, source);
            ps.setString(2, destination);
            ps.setString(3, departureDate);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Flight flight = new Flight();

                flight.setFlightId(rs.getInt("flight_id"));
                flight.setFlightNumber(rs.getString("flight_number"));
                flight.setAirlineName(rs.getString("airline_name"));
                flight.setSource(rs.getString("source"));
                flight.setDestination(rs.getString("destination"));
                flight.setDepartureDate(rs.getDate("departure_date"));
                flight.setDepartureTime(rs.getTime("departure_time"));
                flight.setArrivalTime(rs.getTime("arrival_time"));
                flight.setTicketPrice(rs.getBigDecimal("ticket_price"));
                flight.setTotalSeats(rs.getInt("total_seats"));
                flight.setAvailableSeats(rs.getInt("available_seats"));
                flight.setStatus(rs.getString("status"));

                list.add(flight);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }public boolean increaseAvailableSeats(int flightId, int seats) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE flights SET available_seats = available_seats + ? WHERE flight_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, seats);
            ps.setInt(2, flightId);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }public boolean updateAvailableSeats(int flightId, int seatCount) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE flights SET available_seats = available_seats - ? WHERE flight_id = ? AND available_seats >= ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, seatCount);
            ps.setInt(2, flightId);
            ps.setInt(3, seatCount);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}