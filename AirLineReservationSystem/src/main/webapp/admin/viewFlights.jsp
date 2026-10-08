<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.model.Flight"%>
<%@ page import="com.model.Admin"%>

<%
Admin admin = (Admin) session.getAttribute("admin");

if (admin == null) {
	response.sendRedirect("adminLogin.jsp");
	return;
}

List<Flight> flights = (List<Flight>) request.getAttribute("flights");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flight Management | Airline Reservation System</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>

body{
	background:linear-gradient(rgba(0,25,60,.75),rgba(0,25,60,.75)),
	url("https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=1600&q=80");
	background-size:cover;
	background-position:center;
	background-attachment:fixed;
	font-family:Arial, Helvetica, sans-serif;
}

.navbar{
	background:#002b5c !important;
}

.flight-card{
	background:rgba(255,255,255,.96);
	border:none;
	border-radius:15px;
}

.card-header{
	background:#0d6efd;
	color:white;
}

.table thead{
	background:#003366;
	color:white;
}

.table tbody tr:hover{
	background:#e8f4ff;
}

.badge-available{
	background:#198754;
	color:white;
	padding:6px 12px;
	border-radius:20px;
}

.badge-cancelled{
	background:#dc3545;
	color:white;
	padding:6px 12px;
	border-radius:20px;
}

.btn-edit{
	background:#ffc107;
	color:black;
}

.btn-delete{
	background:#dc3545;
	color:white;
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

<div class="container-fluid">

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

<div class="card shadow-lg flight-card">

<div class="card-header d-flex justify-content-between align-items-center">

<h3 class="mb-0">
<i class="bi bi-airplane-fill"></i>
Flight Management
</h3>

<a href="<%=request.getContextPath()%>/AdminDashboardServlet"
class="btn btn-light">

<i class="bi bi-arrow-left-circle"></i>
Back

</a>

</div>

<div class="card-body">

<div class="table-responsive">

<table class="table table-bordered table-hover align-middle">

<thead>

<tr>

<th>ID</th>
<th>Flight No</th>
<th>Airline</th>
<th>Source</th>
<th>Destination</th>
<th>Date</th>
<th>Departure</th>
<th>Arrival</th>
<th>Price</th>
<th>Available Seats</th>
<th>Status</th>
<th>Action</th>

</tr>

</thead>

<tbody>

<%
if (flights != null && !flights.isEmpty()) {

	for (Flight flight : flights) {
%>

<tr>

<td><%=flight.getFlightId()%></td>

<td>
<strong><%=flight.getFlightNumber()%></strong>
</td>

<td><%=flight.getAirlineName()%></td>

<td>
<i class="bi bi-geo-alt-fill text-primary"></i>
<%=flight.getSource()%>
</td>

<td>
<i class="bi bi-geo-fill text-danger"></i>
<%=flight.getDestination()%>
</td>

<td><%=flight.getDepartureDate()%></td>

<td><%=flight.getDepartureTime()%></td>

<td><%=flight.getArrivalTime()%></td>

<td>
₹ <%=flight.getTicketPrice()%>
</td>

<td><%=flight.getAvailableSeats()%></td>

<td>

<%
if("Available".equalsIgnoreCase(flight.getStatus())){
%>

<span class="badge-available">
<%=flight.getStatus()%>
</span>

<%
}else{
%>

<span class="badge-cancelled">
<%=flight.getStatus()%>
</span>

<%
}
%>

</td>

<td>

<a href="<%=request.getContextPath()%>/EditFlightServlet?id=<%=flight.getFlightId()%>"
class="btn btn-edit btn-sm">

<i class="bi bi-pencil-square"></i>
Edit

</a>

<a href="<%=request.getContextPath()%>/DeleteFlightServlet?id=<%=flight.getFlightId()%>"
class="btn btn-delete btn-sm"
onclick="return confirm('Are you sure you want to delete this flight?');">

<i class="bi bi-trash-fill"></i>
Delete

</a>

</td>

</tr>

<%
}

}else{
%>

<tr>

<td colspan="12" class="text-center text-danger">

<i class="bi bi-exclamation-circle-fill"></i>

No Flights Available

</td>

</tr>

<%
}
%>

</tbody>

</table>

</div>

</div>

</div>

<div class="footer">

✈ Airline Reservation System • Flight Management Portal

</div>

</div>

</body>
</html>