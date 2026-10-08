<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.model.User"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Aviation Reservation Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
rel="stylesheet">

<style>

body{
	background:linear-gradient(rgba(0,25,60,.80),rgba(0,25,60,.80)),
	url("https://images.unsplash.com/photo-1544016768-982d1554f0b9?auto=format&fit=crop&w=1600&q=80");
	background-size:cover;
	background-position:center;
	background-attachment:fixed;
	font-family:Arial, Helvetica, sans-serif;
}

.navbar{
	background:#002147;
}

.hero{
	background:rgba(255,255,255,.92);
	border-radius:15px;
	padding:30px;
}

.card{
	border:none;
	border-radius:15px;
	background:rgba(255,255,255,.95);
	transition:.3s;
}

.card:hover{
	transform:translateY(-8px);
	box-shadow:0 15px 30px rgba(0,0,0,.3);
}

.card h1{
	font-size:55px;
	color:#003366;
}

.footer{
	background:#00152e;
	color:white;
}

</style>

</head>

<body>

<nav class="navbar navbar-dark shadow">

<div class="container">

<span class="navbar-brand fs-3">

✈ Indian Aviation Reservation Portal

</span>

<span class="text-white">

<i class="bi bi-person-circle"></i>

Welcome,

<b><%=user.getFullName()%></b>

</span>

</div>

</nav>

<div class="container mt-4">

<div class="hero shadow">

<h2>

🛩 Welcome,
<%=user.getFullName()%>

</h2>

<p>

Manage flight reservations through the Indian Aviation inspired aviation
dashboard.

</p>

</div>

</div>

<div class="container mt-4">

<div class="row">

<div class="col-md-3 mb-4">

<div class="card shadow h-100">

<div class="card-body text-center">

<h1><i class="bi bi-airplane-fill"></i></h1>

<h5>Search Flights</h5>

<p>Search available flights.</p>

<a href="searchFlights.jsp"
class="btn btn-primary w-100">

Search Flights

</a>

</div>

</div>

</div>

<div class="col-md-3 mb-4">

<div class="card shadow h-100">

<div class="card-body text-center">

<h1><i class="bi bi-ticket-perforated-fill"></i></h1>

<h5>My Bookings</h5>

<p>View your booked flights.</p>

<a href="<%=request.getContextPath()%>/ViewMyBookingsServlet"
class="btn btn-success w-100">

My Bookings

</a>

</div>

</div>

</div>

<div class="col-md-3 mb-4">

<div class="card shadow h-100">

<div class="card-body text-center">

<h1><i class="bi bi-person-badge-fill"></i></h1>

<h5>My Profile</h5>

<p>Manage personal information.</p>

<a href="<%=request.getContextPath()%>/ViewProfileServlet"
class="btn btn-warning w-100">

My Profile

</a>

</div>

</div>

</div>

<div class="col-md-3 mb-4">

<div class="card shadow h-100">

<div class="card-body text-center">

<h1><i class="bi bi-shield-lock-fill"></i></h1>

<h5>Change Password</h5>

<p>Update your password securely.</p>

<a href="changePassword.jsp"
class="btn btn-info text-white w-100">

Change Password

</a>

</div>

</div>

</div>

<div class="col-md-3 mb-4">

<div class="card shadow h-100">

<div class="card-body text-center">

<h1><i class="bi bi-box-arrow-right"></i></h1>

<h5>Logout</h5>

<p>Sign out safely.</p>

<a href="<%=request.getContextPath()%>/UserLogoutServlet"
class="btn btn-danger w-100">

Logout

</a>

</div>

</div>

</div>

</div>

</div>

<footer class="footer text-center p-3 mt-5">

<p class="mb-0">

✈ Aviation Management System |
Java • JSP • Servlets • JDBC • MySQL

</p>

</footer>

</body>
</html>