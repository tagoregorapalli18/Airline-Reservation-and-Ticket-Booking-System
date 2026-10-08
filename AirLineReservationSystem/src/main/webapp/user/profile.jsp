<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.model.User"%>

<%
User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Aviation - My Profile</title>

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

.form-control{
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
					<h3>My Profile</h3>
				</div>

				<div class="card-body">

					<%
					String success = request.getParameter("success");
					String error = request.getParameter("error");

					if(success != null){
					%>

					<div class="alert alert-success">
						<%=success%>
					</div>

					<%
					}

					if(error != null){
					%>

					<div class="alert alert-danger">
						<%=error%>
					</div>

					<%
					}
					%>

					<form action="<%=request.getContextPath()%>/UpdateProfileServlet"
						method="post">

						<input type="hidden"
							name="userId"
							value="<%=user.getUserId()%>">

						<div class="mb-3">
							<label>Full Name</label>
							<input
								type="text"
								name="fullName"
								class="form-control"
								value="<%=user.getFullName()%>"
								required>
						</div>

						<div class="mb-3">
							<label>Email Address</label>
							<input
								type="email"
								name="email"
								class="form-control"
								value="<%=user.getEmail()%>"
								required>
						</div>

						<div class="mb-3">
							<label>Phone Number</label>
							<input
								type="text"
								name="phone"
								class="form-control"
								value="<%=user.getPhone()%>"
								required>
						</div>

						<div class="mb-4">
							<label>Gender</label>
							<input
								type="text"
								class="form-control"
								value="<%=user.getGender()%>"
								readonly>
						</div>

						<div class="d-flex justify-content-between">

							<button
								type="submit"
								class="btn btn-aviation">
								Update Profile
							</button>

							<a href="<%=request.getContextPath()%>/user/userDashboard.jsp"
								class="btn btn-secondary">
								← Back
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