<%@ page import="com.model.Flight"%>

<%
Flight flight = (Flight) request.getAttribute("flight");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Aeroplane - Flight Booking</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body{
	background: linear-gradient(to right,#0f2027,#203a43,#2c5364);
	font-family: Arial, sans-serif;
}

.card{
	border-radius:15px;
}

.card-header{
	background:#003366;
	color:white;
	text-align:center;
}

.logo{
	font-size:28px;
	font-weight:bold;
	color:#ff9933;
}

.subtitle{
	color:white;
	font-size:15px;
}

label{
	font-weight:bold;
	color:#003366;
}

.btn-airforce{
	background:#003366;
	color:white;
	font-weight:bold;
}

.btn-airforce:hover{
	background:#001f4d;
	color:white;
}

.btn-back{
	background:#6c757d;
	color:white;
	font-weight:bold;
}

.footer{
	text-align:center;
	color:white;
	margin-top:20px;
	font-size:14px;
}
</style>

</head>

<body>

<div class="container mt-5">

	<div class="text-center mb-4">
		<div class="logo">🇮🇳  AVIATION</div>
		<div class="subtitle">Touch The Sky With Glory</div>
	</div>

	<div class="card shadow-lg">

		<div class="card-header">
			<h3>Confirm Flight Booking</h3>
		</div>

		<div class="card-body">

			<form action="<%=request.getContextPath()%>/ConfirmBookingServlet"
				method="post">

				<input type="hidden" name="flightId"
					value="<%=flight.getFlightId()%>">

				<div class="row">

					<div class="col-md-6 mb-3">
						<label>Flight Number</label>
						<input class="form-control"
							value="<%=flight.getFlightNumber()%>" readonly>
					</div>

					<div class="col-md-6 mb-3">
						<label>Airline</label>
						<input class="form-control"
							value="<%=flight.getAirlineName()%>" readonly>
					</div>

					<div class="col-md-6 mb-3">
						<label>Ticket Price (₹)</label>
						<input class="form-control"
							value="<%=flight.getTicketPrice()%>" readonly>
					</div>

					<div class="col-md-6 mb-3">
						<label>Available Seats</label>
						<input class="form-control"
							value="<%=flight.getAvailableSeats()%>" readonly>
					</div>

					<div class="col-md-6 mb-3">
						<label>Source</label>
						<input class="form-control"
							value="<%=flight.getSource()%>" readonly>
					</div>

					<div class="col-md-6 mb-3">
						<label>Destination</label>
						<input class="form-control"
							value="<%=flight.getDestination()%>" readonly>
					</div>

				</div>

				<hr>

				<h5 class="text-primary mb-3">Passenger Details</h5>

				<div class="mb-3">
					<label>Passenger Name</label>
					<input type="text"
						name="passengerName"
						class="form-control"
						required>
				</div>

				<div class="mb-3">
					<label>Passenger Age</label>
					<input type="number"
						name="passengerAge"
						class="form-control"
						min="1"
						max="120"
						required>
				</div>

				<div class="mb-3">
					<label>Passenger Gender</label>
					<select name="passengerGender"
						class="form-select"
						required>

						<option value="">Select Gender</option>
						<option>Male</option>
						<option>Female</option>
						<option>Other</option>

					</select>
				</div>

				<div class="mb-3">
					<label>Number of Seats</label>
					<input type="number"
						name="seatCount"
						class="form-control"
						min="1"
						max="<%=flight.getAvailableSeats()%>"
						required>
				</div>

				<div class="text-center">

					<button class="btn btn-airforce px-4">
						Confirm Booking
					</button>

					<a href="<%=request.getContextPath()%>/user/searchFlights.jsp"
						class="btn btn-back px-4 ms-2">
						Back
					</a>

				</div>

			</form>

		</div>

	</div>

	<div class="footer">
		©  Aviation Flight Reservation System
	</div>

</div>

</body>
</html>