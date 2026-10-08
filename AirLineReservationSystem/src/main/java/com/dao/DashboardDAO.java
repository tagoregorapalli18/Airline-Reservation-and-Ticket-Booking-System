package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBConnection;

public class DashboardDAO {

    public int getTotalFlights() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM flights");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public int getTotalUsers() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM users");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public int getTotalBookings() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM bookings");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public int getActiveBookings() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                            "SELECT COUNT(*) FROM bookings WHERE booking_status='Booked'");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }public double getTotalRevenue() {

    	double totalRevenue = 0;

    	try {

    		Connection con = DBConnection.getConnection();

    		String sql = "SELECT SUM(total_fare) AS revenue FROM bookings WHERE booking_status='Booked'";

    		PreparedStatement ps = con.prepareStatement(sql);

    		ResultSet rs = ps.executeQuery();

    		if (rs.next()) {

    			totalRevenue = rs.getDouble("revenue");

    		}

    		con.close();

    	} catch (Exception e) {

    		e.printStackTrace();

    	}

    	return totalRevenue;
    }public int getTodayBookings() {

    	int total = 0;

    	try {

    		Connection con = DBConnection.getConnection();

    		String sql = "SELECT COUNT(*) FROM bookings WHERE DATE(booking_date)=CURDATE()";

    		PreparedStatement ps = con.prepareStatement(sql);

    		ResultSet rs = ps.executeQuery();

    		if (rs.next()) {

    			total = rs.getInt(1);

    		}

    		con.close();

    	} catch (Exception e) {

    		e.printStackTrace();

    	}

    	return total;
    }public int getMonthlyBookings() {

    	int total = 0;

    	try {

    		Connection con = DBConnection.getConnection();

    		String sql = "SELECT COUNT(*) FROM bookings "
    				+ "WHERE MONTH(booking_date)=MONTH(CURDATE()) "
    				+ "AND YEAR(booking_date)=YEAR(CURDATE())";

    		PreparedStatement ps = con.prepareStatement(sql);

    		ResultSet rs = ps.executeQuery();

    		if (rs.next()) {

    			total = rs.getInt(1);

    		}

    		con.close();

    	} catch (Exception e) {

    		e.printStackTrace();

    	}

    	return total;
    }

}
