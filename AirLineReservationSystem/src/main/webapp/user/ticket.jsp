<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.model.Booking"%>
<%@ page import="com.model.Flight"%>

<%
Booking booking = (Booking) request.getAttribute("booking");
Flight flight = (Flight) request.getAttribute("flight");

if (booking == null || flight == null) {
	response.sendRedirect(request.getContextPath() + "/ViewMyBookingsServlet");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Aviation - E-Ticket</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>

body{
	background:linear-gradient(135deg,#0A3D62,#1E5799,#87CEEB);
	font-family:Arial,Helvetica,sans-serif;
}

.ticket{
	background:white;
	border-radius:15px;
	padding:30px;
	border:3px solid #003366;
}

.ticket-header{
	background:#003366;
	color:white;
	padding:20px;
	border-radius:10px;
	text-align:center;
	margin-bottom:25px;
}

.ticket-header h2{
	color:#FFD700;
	font-weight:bold;
	margin-bottom:5px;
}

.ticket-header p{
	margin:0;
	font-style:italic;
}

.table th{
	background:#EAF4FF;
	color:#003366;
	width:35%;
}

.table td{
	font-weight:500;
}

.footer{
	text-align:center;
	margin-top:20px;
	color:white;
	font-weight:bold;
}

@media print{

	body{
		background:white;
	}

	.no-print{
		display:none;
	}

	.ticket{
		border:2px solid #003366;
		box-shadow:none;
	}

}

</style>

</head>

<body>

<div class="container mt-5">

	<div class="ticket shadow-lg">

		<div class="ticket-header">

			<h2>✈ INDIAN AVIATION</h2>

			<p>Electronic Flight Ticket</p>

			<p>Safe • Secure • Comfortable Journey</p>

		</div>

		<table class="table table-bordered">

			<tr>
				<th>Booking Reference</th>
				<td><%=booking.getBookingReference()%></td>
			</tr>

			<tr>
				<th>Passenger Name</th>
				<td><%=booking.getPassengerName()%></td>
			</tr>

			<tr>
				<th>Passenger Age</th>
				<td><%=booking.getPassengerAge()%></td>
			</tr>

			<tr>
				<th>Passenger Gender</th>
				<td><%=booking.getPassengerGender()%></td>
			</tr>

			<tr>
				<th>Flight Number</th>
				<td><%=flight.getFlightNumber()%></td>
			</tr>

			<tr>
				<th>Airline</th>
				<td><%=flight.getAirlineName()%></td>
			</tr>

			<tr>
				<th>Departure</th>
				<td><%=flight.getSource()%></td>
			</tr>

			<tr>
				<th>Arrival</th>
				<td><%=flight.getDestination()%></td>
			</tr>

			<tr>
				<th>Departure Date</th>
				<td><%=flight.getDepartureDate()%></td>
			</tr>

			<tr>
				<th>Departure Time</th>
				<td><%=flight.getDepartureTime()%></td>
			</tr>

			<tr>
				<th>Seats Booked</th>
				<td><%=booking.getSeatCount()%></td>
			</tr>

			<tr>
				<th>Total Fare</th>
				<td>₹ <%=booking.getTotalFare()%></td>
			</tr>

			<tr>
				<th>Booking Status</th>
				<td>
					<span class="badge bg-success">
						<%=booking.getBookingStatus()%>
					</span>
				</td>
			</tr>

			<tr>
				<th>Booking Date</th>
				<td><%=booking.getBookingDate()%></td>
			</tr>

		</table>

		<div class="text-center mt-4 no-print">

			<button class="btn btn-success"
				onclick="window.print()">
				🖨 Print Ticket
			</button>

			<a href="<%=request.getContextPath()%>/ViewMyBookingsServlet"
				class="btn btn-primary">
				My Bookings
			</a>

			<a href="<%=request.getContextPath()%>/user/userDashboard.jsp"
				class="btn btn-secondary">
				Back to Dashboard
			</a>

		</div>

	</div>

	<div class="footer">
		© 2026 Indian Aviation Reservation System
	</div>

</div>

</body>
</html>