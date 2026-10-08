<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.model.Admin"%>

<%
Admin admin = (Admin) session.getAttribute("admin");

if (admin == null) {
	response.sendRedirect("adminLogin.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>✈ Add Flight</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body{
	background: linear-gradient(rgba(0,0,0,.55),rgba(0,0,0,.55)),
	url("https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=1600&q=80");
	background-size:cover;
	background-attachment:fixed;
	font-family:Arial, Helvetica, sans-serif;
}

.card{
	border:none;
	border-radius:15px;
	background:rgba(255,255,255,.95);
}

.card-header{
	background:#0d6efd;
}

.navbar{
	background:#001f3f !important;
}

.form-control,
.form-select{
	border-radius:8px;
}

.btn-primary{
	border-radius:8px;
}

.btn-secondary{
	border-radius:8px;
}

label{
	font-weight:bold;
}

h3{
	margin:0;
}

.footer{
	text-align:center;
	color:white;
	margin-top:20px;
	font-size:15px;
}
</style>

</head>

<body>

<nav class="navbar navbar-dark shadow">

<div class="container">

<span class="navbar-brand fs-4">
<i class="bi bi-airplane-engines-fill"></i>
Airline Reservation System
</span>

<span class="text-white">
<i class="bi bi-person-circle"></i>
Welcome,
<b><%=admin.getUsername()%></b>
</span>

</div>

</nav>

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-lg-10">

<div class="card shadow-lg">

<div class="card-header text-white">

<h3>
<i class="bi bi-airplane-fill"></i>
Add New Flight
</h3>

</div>

<div class="card-body">

<%
String success = request.getParameter("success");
String error = request.getParameter("error");

if(success!=null){
%>

<div class="alert alert-success">
<i class="bi bi-check-circle-fill"></i>
<%=success%>
</div>

<%
}

if(error!=null){
%>

<div class="alert alert-danger">
<i class="bi bi-exclamation-triangle-fill"></i>
<%=error%>
</div>

<%
}
%>

<form action="../AddFlightServlet" method="post">

<div class="row">

<div class="col-md-6 mb-3">
<label><i class="bi bi-hash"></i> Flight Number</label>
<input type="text"
name="flightNumber"
class="form-control"
maxlength="10"
placeholder="AI101"
required>
</div>

<div class="col-md-6 mb-3">
<label><i class="bi bi-building"></i> Airline Name</label>
<input type="text"
name="airlineName"
class="form-control"
placeholder="IndiGo"
required>
</div>

<div class="col-md-6 mb-3">
<label><i class="bi bi-geo-alt-fill"></i> Source</label>
<input type="text"
name="source"
class="form-control"
placeholder="Visakhapatnam"
required>
</div>

<div class="col-md-6 mb-3">
<label><i class="bi bi-geo-fill"></i> Destination</label>
<input type="text"
name="destination"
class="form-control"
placeholder="Hyderabad"
required>
</div>

<div class="col-md-6 mb-3">
<label><i class="bi bi-calendar-event"></i> Departure Date</label>
<input type="date"
name="departureDate"
class="form-control"
required>
</div>

<div class="col-md-6 mb-3">
<label><i class="bi bi-clock"></i> Departure Time</label>
<input type="time"
name="departureTime"
class="form-control"
required>
</div>

<div class="col-md-6 mb-3">
<label><i class="bi bi-clock-history"></i> Arrival Time</label>
<input type="time"
name="arrivalTime"
class="form-control"
required>
</div>

<div class="col-md-6 mb-3">
<label><i class="bi bi-currency-rupee"></i> Ticket Price</label>
<input type="number"
step="0.01"
name="ticketPrice"
class="form-control"
placeholder="4500"
required>
</div>

<div class="col-md-6 mb-3">
<label><i class="bi bi-people-fill"></i> Total Seats</label>
<input type="number"
name="totalSeats"
class="form-control"
placeholder="180"
required>
</div>

<div class="col-md-6 mb-3">
<label><i class="bi bi-info-circle-fill"></i> Flight Status</label>

<select name="status" class="form-select">

<option value="Available">Available</option>

<option value="Cancelled">Cancelled</option>

</select>

</div>

</div>

<div class="text-center mt-4">

<button class="btn btn-primary btn-lg">
<i class="bi bi-plus-circle"></i>
Add Flight
</button>

<a href="adminDashboard.jsp" class="btn btn-secondary btn-lg">
<i class="bi bi-arrow-left-circle"></i>
Back
</a>

</div>

</form>

</div>

</div>

<div class="footer">
✈ Safe Journey • Secure Booking • Aviation Management System
</div>

</div>

</div>

</div>

</body>
</html>