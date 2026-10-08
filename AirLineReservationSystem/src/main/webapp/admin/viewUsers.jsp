<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.model.Admin"%>
<%@ page import="com.model.User"%>

<%
Admin admin = (Admin) session.getAttribute("admin");

if (admin == null) {
	response.sendRedirect("adminLogin.jsp");
	return;
}

List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users | Airline Reservation System</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<style>

body{
	background:linear-gradient(rgba(0,32,63,.75),rgba(0,32,63,.75)),
	url("https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=1600&q=80");
	background-size:cover;
	background-position:center;
	background-attachment:fixed;
	font-family:Arial, Helvetica, sans-serif;
}

.navbar{
	background:#002b5c !important;
}

.user-card{
	border:none;
	border-radius:15px;
	background:rgba(255,255,255,.96);
}

.card-header{
	background:#0d6efd;
	color:white;
}

.table thead{
	background:#003366;
	color:white;
}

.table tbody tr:hover{
	background:#eaf4ff;
}

.btn-delete{
	background:#dc3545;
	color:white;
}

.btn-delete:hover{
	background:#bb2d3b;
	color:white;
}

.footer{
	text-align:center;
	color:white;
	margin-top:20px;
	font-size:15px;
}

</style>

</head>

<body>

<!-- Navigation -->

<nav class="navbar navbar-dark shadow">

<div class="container">

<span class="navbar-brand fs-4">

<i class="bi bi-airplane-engines-fill"></i>

Airline Reservation System

</span>

<span class="text-white">

<i class="bi bi-person-circle"></i>

Welcome,

<b><%=admin.getUsername()%></b>

</span>

</div>

</nav>

<div class="container mt-5">

<div class="card shadow-lg user-card">

<div class="card-header d-flex justify-content-between align-items-center">

<h3 class="mb-0">

<i class="bi bi-people-fill"></i>

Manage Users

</h3>

</div>

<div class="card-body">

<div class="table-responsive">

<table class="table table-bordered table-hover align-middle">

<thead>

<tr>

<th>User ID</th>
<th>Full Name</th>
<th>Email</th>
<th>Phone</th>
<th>Gender</th>
<th>Action</th>

</tr>

</thead>

<tbody>

<%
if (users != null && !users.isEmpty()) {

	for (User user : users) {
%>

<tr>

<td><%=user.getUserId()%></td>

<td>

<i class="bi bi-person-fill text-primary"></i>

<%=user.getFullName()%>

</td>

<td>

<i class="bi bi-envelope-fill text-success"></i>

<%=user.getEmail()%>

</td>

<td>

<i class="bi bi-telephone-fill text-info"></i>

<%=user.getPhone()%>

</td>

<td>

<i class="bi bi-gender-ambiguous text-secondary"></i>

<%=user.getGender()%>

</td>

<td>

<a href="<%=request.getContextPath()%>/DeleteUserServlet?userId=<%=user.getUserId()%>"
class="btn btn-delete btn-sm"
onclick="return confirm('Are you sure you want to delete this user?');">

<i class="bi bi-trash-fill"></i>

Delete

</a>

</td>

</tr>

<%
	}

}else{
%>

<tr>

<td colspan="6" class="text-center text-danger">

<i class="bi bi-exclamation-circle-fill"></i>

No Users Found

</td>

</tr>

<%
}
%>

</tbody>

</table>

</div>

<div class="text-center mt-4">

<a href="<%=request.getContextPath()%>/AdminDashboardServlet"
class="btn btn-secondary btn-lg">

<i class="bi bi-arrow-left-circle"></i>

Back to Dashboard

</a>

</div>

</div>

</div>

<div class="footer">

✈ Airline Reservation System • User Management Portal

</div>

</div>

</body>
</html>