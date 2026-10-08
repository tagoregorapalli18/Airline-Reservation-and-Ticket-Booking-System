<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Aviation - Search Flights</title>

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
	padding:35px 0 20px;
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
	text-align:center;
}

.card-header h3{
	margin:0;
	font-weight:bold;
}

label{
	font-weight:bold;
	color:#003366;
}

.form-control{
	border-radius:8px;
}

.btn-aviation{
	background:#003366;
	color:white;
	font-weight:bold;
	padding:10px 25px;
}

.btn-aviation:hover{
	background:#001F4D;
	color:white;
}

.footer{
	text-align:center;
	color:white;
	font-weight:bold;
	margin-top:25px;
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

	<div class="row justify-content-center">

		<div class="col-md-6">

			<div class="card shadow-lg">

				<div class="card-header">
					<h3>Search Flights</h3>
				</div>

				<div class="card-body">

					<form action="<%=request.getContextPath()%>/SearchFlightServlet"
						method="get">

						<div class="mb-3">

							<label>Departure City</label>

							<input
								type="text"
								name="source"
								class="form-control"
								placeholder="Enter departure city"
								required>

						</div>

						<div class="mb-3">

							<label>Destination City</label>

							<input
								type="text"
								name="destination"
								class="form-control"
								placeholder="Enter destination city"
								required>

						</div>

						<div class="mb-4">

							<label>Departure Date</label>

							<input
								type="date"
								name="departureDate"
								class="form-control"
								required>

						</div>

						<div class="text-center">

							<button
								type="submit"
								class="btn btn-aviation">
								✈ Search Flights
							</button>

						</div>

					</form>

				</div>

			</div>

		</div>

	</div>

	<div class="footer">
		© 2026 Indian Aviation Reservation System
	</div>

</div>

</body>
</html>