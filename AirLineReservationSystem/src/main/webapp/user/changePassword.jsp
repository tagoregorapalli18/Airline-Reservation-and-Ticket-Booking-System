<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.model.User"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Aviation - Change Password</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body{
	background: linear-gradient(135deg,#0a3d62,#1e5799,#87CEEB);
	font-family: Arial, Helvetica, sans-serif;
	min-height:100vh;
}

.navbar{
	background:#003366 !important;
}

.logo{
	font-size:24px;
	font-weight:bold;
	color:#FFD700;
	letter-spacing:1px;
}

.card{
	border:none;
	border-radius:15px;
}

.card-header{
	background:#004080;
	color:white;
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

.footer{
	text-align:center;
	color:white;
	margin-top:25px;
	font-weight:bold;
}
</style>

</head>

<body>

<!-- Navigation -->

<nav class="navbar navbar-expand-lg navbar-dark">

	<div class="container">

		<span class="navbar-brand logo">
			✈ INDIAN AVIATION
		</span>

		<span class="text-white">
			Welcome, <strong><%=user.getFullName()%></strong>
		</span>

	</div>

</nav>

<div class="container mt-5">

	<div class="row justify-content-center">

		<div class="col-md-6">

			<div class="card shadow-lg">

				<div class="card-header text-center">

					<h3>🔒 Change Password</h3>

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

					<form action="<%=request.getContextPath()%>/ChangePasswordServlet"
						method="post">

						<div class="mb-3">

							<label>Current Password</label>

							<input type="password"
								name="currentPassword"
								class="form-control"
								required>

						</div>

						<div class="mb-3">

							<label>New Password</label>

							<input type="password"
								name="newPassword"
								class="form-control"
								required>

						</div>

						<div class="mb-3">

							<label>Confirm New Password</label>

							<input type="password"
								name="confirmPassword"
								class="form-control"
								required>

						</div>

						<div class="d-grid">

							<button type="submit"
								class="btn btn-aviation">
								Update Password
							</button>

						</div>

					</form>

					<div class="text-center mt-4">

						<a href="userDashboard.jsp"
							class="btn btn-secondary">
							← Back to Dashboard
						</a>

					</div>

				</div>

			</div>

		</div>

	</div>

</div>

<div class="footer">
	© 2026 Indian Aviation Reservation System
</div>

</body>
</html>