<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.model.Flight"%>

<%
List<Flight> flights = (List<Flight>) request.getAttribute("flights");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Aviation - Available Flights</title>

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
	padding:30px 0 20px;
}

.header h1{
	color:#FFD700;
	font-size:36px;
	font-weight:bold;
	letter-spacing:2px;
	margin-bottom:5px;
}

.header p{
	color:white;
	font-size:16px;
	font-style:italic;
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
	background:#eef6ff;
}

.btn-book{
	background:#003366;
	color:white;
	font-weight:bold;
}

.btn-book:hover{
	background:#001F4D;
	color:white;
}

.footer{
	text-align:center;
	color:white;
	font-weight:bold;
	margin-top:20px;
	padding-bottom:15px;
}
</style>

</head>

<body>

<div class="container">

	<!-- Header -->

	<div class="header">
		<h1>✈ INDIAN AVIATION</h1>
		<p>Safe • Secure • Comfortable Journey</p>
	</div>

	<div class="card shadow-lg">

		<div class="card-header">
			<h3 class="mb-0 text-center">Available Flights</h3>
		</div>

		<div class="card-body">

			<div class="table-responsive">

				<table class="table table-bordered table-hover align-middle">

					<thead>

						<tr>
							<th>Flight No</th>
							<th>Airline</th>
							<th>Departure</th>
							<th>Arrival</th>
							<th>Date</th>
							<th>Dep. Time</th>
							<th>Arr. Time</th>
							<th>Fare (₹)</th>
							<th>Seats</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>

					<%
					if(flights != null && !flights.isEmpty()){

						for(Flight flight : flights){
					%>

						<tr>

							<td><%=flight.getFlightNumber()%></td>

							<td><%=flight.getAirlineName()%></td>

							<td><%=flight.getSource()%></td>

							<td><%=flight.getDestination()%></td>

							<td><%=flight.getDepartureDate()%></td>

							<td><%=flight.getDepartureTime()%></td>

							<td><%=flight.getArrivalTime()%></td>

							<td>₹ <%=flight.getTicketPrice()%></td>

							<td><%=flight.getAvailableSeats()%></td>

							<td>

								<a href="<%=request.getContextPath()%>/BookFlightServlet?flightId=<%=flight.getFlightId()%>"
									class="btn btn-book btn-sm">
									Book Now
								</a>

							</td>

						</tr>

					<%
						}

					}else{
					%>

						<tr>

							<td colspan="10"
								class="text-center text-danger fw-bold">
								No Flights Found
							</td>

						</tr>

					<%
					}
					%>

					</tbody>

				</table>

			</div>

			<div class="text-center mt-4">

				<a href="<%=request.getContextPath()%>/user/searchFlights.jsp"
					class="btn btn-secondary">
					← Back to Search
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