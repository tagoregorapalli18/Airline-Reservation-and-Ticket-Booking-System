<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Aviation - User Login</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body{
	background: linear-gradient(135deg,#0A3D62,#1E5799,#87CEEB);
	font-family: Arial, Helvetica, sans-serif;
	min-height:100vh;
}

.logo{
	text-align:center;
	margin-top:35px;
	font-size:36px;
	font-weight:bold;
	color:#FFD700;
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
}

.btn-aviation:hover{
	background:#001F4D;
	color:white;
}

.links a{
	text-decoration:none;
	font-weight:bold;
	color:#003366;
}

.links a:hover{
	color:#001F4D;
}

.footer{
	text-align:center;
	color:white;
	margin-top:25px;
	font-weight:bold;
}
</style>

</head>

<body>

<div class="container">

	<!-- Header -->

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
					<h3>User Login</h3>
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

					<form action="<%=request.getContextPath()%>/UserLoginServlet"
						method="post">

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

							<label>Password</label>

							<input
								type="password"
								name="password"
								class="form-control"
								placeholder="Enter your password"
								required>

						</div>

						<div class="d-grid">

							<button
								type="submit"
								class="btn btn-aviation">

								✈ Login

							</button>

						</div>

					</form>

					<div class="links text-center mt-4">

						<p>
							<a href="forgotPassword.jsp">
								Forgot Password?
							</a>
						</p>

						<p>
							<a href="register.jsp">
								New User? Register Here
							</a>
						</p>

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