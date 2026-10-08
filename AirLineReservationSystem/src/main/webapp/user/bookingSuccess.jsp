<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.model.Booking"%>

<%
Booking booking = (Booking) request.getAttribute("booking");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Aviation - Booking Confirmation</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body{
	background: linear-gradient(135deg,#0a3d62,#1e5799,#87CEEB);
	font-family: Arial, Helvetica, sans-serif;
}

.header{
	text-align:center;
	margin-top:30px;
	color:white;
}

.header h1{
	font-size:34px;
	font-weight:bold;
	color:#FFD700;
	letter-spacing:2px;
}

.header p{
	font-size:16px;
	font-style:italic;
}

.card{
	border:none;
	border-radius:15px;
}

.card-header{
	background:#004080;
	color:white;
	text-align:center;
}

.table th{
	background:#eaf4ff;
	color:#003366;
	width:40%;
}

.table td{
	font-weight:500;
}

.badge{
	font-size:14px;
	padding:8px 15px;
}

.btn-aviation{
	background:#004080;
	color:white;
	font-weight:bold;
}

.btn-aviation:hover{
	background:#00264d;
	color:white;
}

.footer{
	text-align:center;
	margin-top:20px;
	color:white;
	font-weight:bold;
}
</style>

</head>

<body>

<div class="container">

	<div class="header">
		<h1>✈ INDIAN AVIATION</h1>
		<p>Safe • Secure • Comfortable Journey</p>
	</div>

	<div class="card shadow-lg mt-4">

		<div class="card-header">
			<h2>✅ Booking Confirmed Successfully</h2>
		</div>

		<div class="card-body">

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

			</table>

			<div class="text-center mt-4">

				<a href="<%=request.getContextPath()%>/ViewMyBookingsServlet"
					class="btn btn-aviation me-2">
					📄 My Bookings
				</a>

				<a href="userDashboard.jsp"
					class="btn btn-success">
					🏠 Dashboard
				</a>

			</div>

		</div>

	</div>

	<div class="footer">
		© 2026 Indian Aviation Reservation System
	</div>

</div>

</body>
</html>