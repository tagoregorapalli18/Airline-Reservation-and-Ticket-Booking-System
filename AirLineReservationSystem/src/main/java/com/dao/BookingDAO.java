package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Booking;
import com.util.DBConnection;

public class BookingDAO {

    // Add Booking
    public boolean addBooking(Booking booking) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO bookings "
                    + "(booking_reference, user_id, flight_id, passenger_name, passenger_age, passenger_gender, seat_count, total_fare, booking_status) "
                    + "VALUES (?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, booking.getBookingReference());
            ps.setInt(2, booking.getUserId());
            ps.setInt(3, booking.getFlightId());
            ps.setString(4, booking.getPassengerName());
            ps.setInt(5, booking.getPassengerAge());
            ps.setString(6, booking.getPassengerGender());
            ps.setInt(7, booking.getSeatCount());
            ps.setBigDecimal(8, booking.getTotalFare());
            ps.setString(9, booking.getBookingStatus());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // View bookings of a particular user
    public List<Booking> getBookingsByUserId(int userId) {

        List<Booking> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM bookings WHERE user_id=? ORDER BY booking_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Booking booking = new Booking();

                booking.setBookingId(rs.getInt("booking_id"));
                booking.setBookingReference(rs.getString("booking_reference"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setFlightId(rs.getInt("flight_id"));
                booking.setPassengerName(rs.getString("passenger_name"));
                booking.setPassengerAge(rs.getInt("passenger_age"));
                booking.setPassengerGender(rs.getString("passenger_gender"));
                booking.setSeatCount(rs.getInt("seat_count"));
                booking.setTotalFare(rs.getBigDecimal("total_fare"));
                booking.setBookingStatus(rs.getString("booking_status"));
                booking.setBookingDate(rs.getTimestamp("booking_date"));

                list.add(booking);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Cancel booking
    public boolean cancelBooking(int bookingId) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE bookings SET booking_status='Cancelled' WHERE booking_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, bookingId);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }public Booking getBookingById(int bookingId) {

        Booking booking = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM bookings WHERE booking_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, bookingId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                booking = new Booking();

                booking.setBookingId(rs.getInt("booking_id"));
                booking.setBookingReference(rs.getString("booking_reference"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setFlightId(rs.getInt("flight_id"));
                booking.setPassengerName(rs.getString("passenger_name"));
                booking.setPassengerAge(rs.getInt("passenger_age"));
                booking.setPassengerGender(rs.getString("passenger_gender"));
                booking.setSeatCount(rs.getInt("seat_count"));
                booking.setTotalFare(rs.getBigDecimal("total_fare"));
                booking.setBookingStatus(rs.getString("booking_status"));
                booking.setBookingDate(rs.getTimestamp("booking_date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return booking;
    }public List<Booking> getAllBookings() {

        List<Booking> bookings = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM bookings ORDER BY booking_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Booking booking = new Booking();

                booking.setBookingId(rs.getInt("booking_id"));
                booking.setBookingReference(rs.getString("booking_reference"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setFlightId(rs.getInt("flight_id"));
                booking.setPassengerName(rs.getString("passenger_name"));
                booking.setPassengerAge(rs.getInt("passenger_age"));
                booking.setPassengerGender(rs.getString("passenger_gender"));
                booking.setSeatCount(rs.getInt("seat_count"));
                booking.setTotalFare(rs.getBigDecimal("total_fare"));
                booking.setBookingStatus(rs.getString("booking_status"));
                booking.setBookingDate(rs.getTimestamp("booking_date"));

                bookings.add(booking);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookings;
    }
}