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
<title>Indian Aviation - My Bookings</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body{
	background:linear-gradient(135deg,#0A3D62,#1E5799,#87CEEB);
	font-family:Arial,Helvetica,sans-serif;
	min-height:100vh;
}

.header{
	text-align:center;
	margin:30px 0;
}

.header h1{
	color:#FFD700;
	font-weight:bold;
	letter-spacing:2px;
}

.header p{
	color:white;
	font-style:italic;
	font-size:16px;
}

.card{
	border:none;
	border-radius:15px;
}

.card-header{
	background:#003366;
	color:white;
}

.table thead{
	background:#003366;
	color:white;
}

.table tbody tr:hover{
	background:#eef7ff;
}

.btn-aviation{
	background:#003366;
	color:white;
	font-weight:bold;
}

.btn-aviation:hover{
	background:#001F4D;
	color:white;
}

.footer{
	text-align:center;
	color:white;
	font-weight:bold;
	margin:20px 0;
}
</style>

</head>

<body>

<div class="container">

	<div class="header">
		<h1>✈ INDIAN AVIATION</h1>
		<p>Safe • Secure • Comfortable Journey</p>
	</div>

	<div class="card shadow-lg">

		<div class="card-header">
			<h3 class="mb-0">My Flight Bookings</h3>
		</div>

		<div class="card-body">

			<div class="table-responsive">

				<table class="table table-bordered table-hover align-middle">

					<thead>

						<tr>
							<th>Booking Ref</th>
							<th>Passenger</th>
							<th>Seats</th>
							<th>Total Fare</th>
							<th>Status</th>
							<th>Booking Date</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>

					<%
					if(bookings != null && !bookings.isEmpty()){

						for(Booking booking : bookings){
					%>

						<tr>

							<td><%=booking.getBookingReference()%></td>

							<td><%=booking.getPassengerName()%></td>

							<td><%=booking.getSeatCount()%></td>

							<td>₹ <%=booking.getTotalFare()%></td>

							<td>

								<%
								if("Booked".equalsIgnoreCase(booking.getBookingStatus())){
								%>

								<span class="badge bg-success">
									Booked
								</span>

								<%
								}else{
								%>

								<span class="badge bg-danger">
									Cancelled
								</span>

								<%
								}
								%>

							</td>

							<td><%=booking.getBookingDate()%></td>

							<td>

								<%
								if("Booked".equalsIgnoreCase(booking.getBookingStatus())){
								%>

								<a href="<%=request.getContextPath()%>/CancelBookingServlet?bookingId=<%=booking.getBookingId()%>"
									class="btn btn-danger btn-sm mb-2"
									onclick="return confirm('Are you sure you want to cancel this booking?');">
									Cancel
								</a>

								<br>

								<a href="<%=request.getContextPath()%>/PrintTicketServlet?bookingId=<%=booking.getBookingId()%>"
									class="btn btn-primary btn-sm">
									Print Ticket
								</a>

								<%
								}else{
								%>

								<span class="text-muted">
									No Actions
								</span>

								<%
								}
								%>

							</td>

						</tr>

					<%
						}
					}else{
					%>

						<tr>

							<td colspan="7" class="text-center text-danger fw-bold">
								No Bookings Found
							</td>

						</tr>

					<%
					}
					%>

					</tbody>

				</table>

			</div>

			<div class="text-center mt-4">

				<a href="<%=request.getContextPath()%>/user/userDashboard.jsp"
					class="btn btn-aviation">
					← Back to Dashboard
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