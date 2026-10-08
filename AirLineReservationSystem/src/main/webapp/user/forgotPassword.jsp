<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Aviation - Forgot Password</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body{
	background: linear-gradient(135deg,#0a3d62,#1e5799,#87CEEB);
	font-family: Arial, Helvetica, sans-serif;
	min-height:100vh;
}

.logo{
	text-align:center;
	margin-top:35px;
	color:#FFD700;
	font-size:34px;
	font-weight:bold;
	letter-spacing:2px;
}

.tagline{
	text-align:center;
	color:white;
	font-size:16px;
	font-style:italic;
	margin-bottom:25px;
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

label{
	font-weight:bold;
	color:#003366;
}

.form-control{
	border-radius:8px;
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

.login-link{
	text-decoration:none;
	font-weight:bold;
	color:#004080;
}

.login-link:hover{
	color:#00264d;
}

.footer{
	text-align:center;
	margin-top:25px;
	color:white;
	font-weight:bold;
}
</style>

</head>

<body>

<div class="container">

	<div class="logo">
		✈ INDIAN AVIATION
	</div>

	<div class="tagline">
		Safe • Secure • Comfortable Journey
	</div>

	<div class="row justify-content-center">

		<div class="col-md-5">

			<div class="card shadow-lg">

				<div class="card-header">
					<h3>🔑 Forgot Password</h3>
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

					<form action="<%=request.getContextPath()%>/ForgotPasswordServlet"
						method="post">

						<div class="mb-3">
							<label>Email Address</label>
							<input type="email"
								name="email"
								class="form-control"
								placeholder="Enter your registered email"
								required>
						</div>

						<div class="mb-3">
							<label>New Password</label>
							<input type="password"
								name="newPassword"
								class="form-control"
								placeholder="Enter new password"
								required>
						</div>

						<div class="mb-3">
							<label>Confirm Password</label>
							<input type="password"
								name="confirmPassword"
								class="form-control"
								placeholder="Confirm new password"
								required>
						</div>

						<div class="d-grid">
							<button type="submit"
								class="btn btn-aviation">
								Reset Password
							</button>
						</div>

					</form>

					<div class="text-center mt-4">
						<a href="login.jsp" class="login-link">
							← Back to Login
						</a>
					</div>

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