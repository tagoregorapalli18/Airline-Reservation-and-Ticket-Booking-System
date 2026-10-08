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
<title>Flight Booking Report</title>

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
	background-attachment:fixed;
	font-family:Arial, Helvetica, sans-serif;
}

.report-card{
	background:rgba(255,255,255,.97);
	border:none;
	border-radius:15px;
}

.card-header{
	background:#003366;
	color:white;
}

.table thead{
	background:#0056b3;
	color:white;
}

.table tbody tr:hover{
	background:#e8f4ff;
}

.badge-booked{
	background:#198754;
	color:white;
	padding:6px 10px;
	border-radius:20px;
}

.badge-cancelled{
	background:#dc3545;
	color:white;
	padding:6px 10px;
	border-radius:20px;
}

.btn-print{
	background:#0d6efd;
	color:white;
}

.btn-print:hover{
	background:#084298;
	color:white;
}

.footer{
	text-align:center;
	color:white;
	margin-top:20px;
	font-size:15px;
}

@media print{

	body{
		background:white;
	}

	.no-print{
		display:none;
	}

	.footer{
		display:none;
	}

}

</style>

</head>

<body>

<div class="container mt-5">

<div class="card shadow-lg report-card">

<div class="card-header">

<h3>
<i class="bi bi-airplane-fill"></i>
Flight Booking Report
</h3>

</div>

<div class="card-body">

<div class="table-responsive">

<table class="table table-bordered table-hover align-middle">

<thead>

<tr>

<th><i class="bi bi-upc-scan"></i> Booking Ref</th>
<th><i class="bi bi-person-fill"></i> Passenger</th>
<th><i class="bi bi-airplane"></i> Flight ID</th>
<th><i class="bi bi-people-fill"></i> Seats</th>
<th><i class="bi bi-currency-rupee"></i> Total Fare</th>
<th><i class="bi bi-info-circle-fill"></i> Status</th>
<th><i class="bi bi-calendar-event-fill"></i> Booking Date</th>

</tr>

</thead>

<tbody>

<%
if(bookings != null){

	for(Booking booking : bookings){
%>

<tr>

<td><strong><%=booking.getBookingReference()%></strong></td>

<td><%=booking.getPassengerName()%></td>

<td><%=booking.getFlightId()%></td>

<td><%=booking.getSeatCount()%></td>

<td>₹ <%=booking.getTotalFare()%></td>

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
}
else{
%>

<tr>

<td colspan="7" class="text-center text-danger">

No Booking Records Available

</td>

</tr>

<%
}
%>

</tbody>

</table>

</div>

<div class="text-center mt-4 no-print">

<button class="btn btn-print btn-lg"
onclick="window.print()">

<i class="bi bi-printer-fill"></i>
Print Report

</button>

<a href="<%=request.getContextPath()%>/AdminDashboardServlet"
class="btn btn-secondary btn-lg">

<i class="bi bi-speedometer2"></i>
Dashboard

</a>

</div>

</div>

</div>

<div class="footer">

✈ Airline Reservation System • Flight Booking Management Report

</div>

</div>

</body>
</html>