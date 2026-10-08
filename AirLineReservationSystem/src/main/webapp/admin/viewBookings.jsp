<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.model.Booking"%>

<%
List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Flight Bookings</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>

body{
	background:linear-gradient(rgba(0,30,60,.75),rgba(0,30,60,.75)),
	url("https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=1600&q=80");
	background-size:cover;
	background-position:center;
	background-attachment:fixed;
	font-family:Arial, Helvetica, sans-serif;
}

.navbar{
	background:#002b5c;
}

.card{
	border:none;
	border-radius:15px;
	background:rgba(255,255,255,.96);
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

.badge-booked{
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

</div>

</nav>

<div class="container mt-5">

<div class="card shadow-lg">

<div class="card-header">

<h3>
<i class="bi bi-ticket-perforated-fill"></i>
All Flight Bookings
</h3>

</div>

<div class="card-body">

<div class="table-responsive">

<table class="table table-bordered table-hover align-middle">

<thead>

<tr>

<th>ID</th>
<th>Reference</th>
<th>User ID</th>
<th>Flight ID</th>
<th>Passenger</th>
<th>Seats</th>
<th>Total Fare</th>
<th>Status</th>
<th>Booking Date</th>

</tr>

</thead>

<tbody>

<%
if (bookings != null && !bookings.isEmpty()) {

	for (Booking booking : bookings) {
%>

<tr>

<td><%=booking.getBookingId()%></td>

<td>
<strong><%=booking.getBookingReference()%></strong>
</td>

<td><%=booking.getUserId()%></td>

<td><%=booking.getFlightId()%></td>

<td>
<i class="bi bi-person-fill"></i>
<%=booking.getPassengerName()%>
</td>

<td><%=booking.getSeatCount()%></td>

<td>
₹ <%=booking.getTotalFare()%>
</td>

<td>

<%
if("Booked".equalsIgnoreCase(booking.getBookingStatus())){
%>

<span class="badge-booked">
<%=booking.getBookingStatus()%>
</span>

<%
}else{
%>

<span class="badge-cancelled">
<%=booking.getBookingStatus()%>
</span>

<%
}
%>

</td>

<td><%=booking.getBookingDate()%></td>

</tr>

<%
}

} else {
%>

<tr>

<td colspan="9" class="text-center text-danger">

<i class="bi bi-exclamation-circle-fill"></i>
No bookings found.

</td>

</tr>

<%
}
%>

</tbody>

</table>

</div>

<div class="text-center mt-4">

<a href="<%=request.getContextPath()%>/AdminDashboardServlet"
class="btn btn-secondary btn-lg">

<i class="bi bi-arrow-left-circle"></i>
Back to Dashboard

</a>

</div>

</div>

</div>

<div class="footer">

✈ Airline Reservation System • Flight Booking Management

</div>

</div>

</body>
</html>