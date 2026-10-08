package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.User;
import com.util.DBConnection;

public class UserDAO {

	public boolean registerUser(User user) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "INSERT INTO users(full_name,email,phone,gender,password) VALUES(?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhone());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getPassword());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public User loginUser(String email, String password) {

		User user = null;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT * FROM users WHERE email=? AND password=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				user = new User();

				user.setUserId(rs.getInt("user_id"));
				user.setFullName(rs.getString("full_name"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setGender(rs.getString("gender"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public User getUserById(int userId) {

		User user = null;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT * FROM users WHERE user_id=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				user = new User();

				user.setUserId(rs.getInt("user_id"));
				user.setFullName(rs.getString("full_name"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setGender(rs.getString("gender"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean updateUser(User user) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "UPDATE users SET full_name=?, email=?, phone=? WHERE user_id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhone());
			ps.setInt(4, user.getUserId());

			status = ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public boolean checkPassword(int userId, String currentPassword) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT * FROM users WHERE user_id=? AND password=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, userId);
			ps.setString(2, currentPassword);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				status = true;
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public boolean changePassword(int userId, String newPassword) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "UPDATE users SET password=? WHERE user_id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, newPassword);
			ps.setInt(2, userId);

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}public boolean verifyUser(String email) {

	    boolean status = false;

	    try {

	        Connection con = DBConnection.getConnection();

	        String sql = "SELECT * FROM users WHERE email=?";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setString(1, email);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            status = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	public boolean resetPassword(String email, String newPassword) {

	    boolean status = false;

	    try {

	        Connection con = DBConnection.getConnection();

	        String sql = "UPDATE users SET password=? WHERE email=?";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setString(1, newPassword);
	        ps.setString(2, email);

	        status = ps.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	public List<User> getAllUsers() {

		List<User> userList = new ArrayList<User>();

		try {

			Connection con = DBConnection.getConnection();

			String sql = "SELECT * FROM users ORDER BY user_id";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				User user = new User();

				user.setUserId(rs.getInt("user_id"));
				user.setFullName(rs.getString("full_name"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setGender(rs.getString("gender"));

				userList.add(user);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userList;
	}public boolean deleteUser(int userId) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String sql = "DELETE FROM users WHERE user_id=?";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, userId);

			int rows = ps.executeUpdate();

			if (rows > 0) {

				status = true;

			}

			con.close();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return status;
	}
}
