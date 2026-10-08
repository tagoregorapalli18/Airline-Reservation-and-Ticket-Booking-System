<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Aviation - User Registration</title>

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
	text-align:center;
}

label{
	font-weight:bold;
	color:#003366;
}

.form-control,
.form-select{
	border-radius:8px;
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
	margin-top:25px;
	padding-bottom:15px;
}
</style>

</head>

<body>

<%
String error = request.getParameter("error");

if(error != null){
%>

<div class="container mt-3">
	<div class="alert alert-danger text-center">
		<%=error%>
	</div>
</div>

<%
}
%>

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
					<h3>User Registration</h3>
				</div>

				<div class="card-body">

					<form action="<%=request.getContextPath()%>/RegisterServlet"
						method="post">

						<div class="mb-3">
							<label>Full Name</label>
							<input
								type="text"
								name="fullName"
								class="form-control"
								placeholder="Enter your full name"
								minlength="3"
								maxlength="100"
								required>
						</div>

						<div class="mb-3">
							<label>Email Address</label>
							<input
								type="email"
								name="email"
								class="form-control"
								placeholder="Enter your email"
								required>
						</div>

						<div class="mb-3">
							<label>Phone Number</label>
							<input
								type="tel"
								name="phone"
								class="form-control"
								placeholder="Enter 10-digit mobile number"
								pattern="[0-9]{10}"
								maxlength="10"
								required>
						</div>

						<div class="mb-3">
							<label>Gender</label>
							<select
								name="gender"
								class="form-select"
								required>

								<option value="">Select Gender</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>

							</select>
						</div>

						<div class="mb-4">
							<label>Password</label>
							<input
								type="password"
								name="password"
								class="form-control"
								placeholder="Create a password"
								minlength="6"
								required>
						</div>

						<div class="d-flex justify-content-center gap-3">

							<button
								type="submit"
								class="btn btn-aviation px-4">
								Register
							</button>

							<a href="login.jsp"
								class="btn btn-secondary px-4">
								Login
							</a>

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