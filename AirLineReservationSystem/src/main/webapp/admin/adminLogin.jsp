<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Airline Admin Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
      rel="stylesheet">

<style>

body{
    margin:0;
    padding:0;
    height:100vh;
    background:linear-gradient(rgba(0,25,60,0.75),rgba(0,25,60,0.75)),
    url("https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=1600&q=80");
    background-size:cover;
    background-position:center;
    display:flex;
    justify-content:center;
    align-items:center;
    font-family:Arial, Helvetica, sans-serif;
}

.login-card{
    width:420px;
    border:none;
    border-radius:18px;
    background:rgba(255,255,255,0.95);
}

.card-header{
    background:#003366;
    color:white;
    border-radius:18px 18px 0 0 !important;
    text-align:center;
    padding:25px;
}

.card-header h3{
    margin-top:10px;
}

.logo{
    font-size:55px;
}

.form-control{
    border-radius:10px;
    height:48px;
}

.btn-login{
    background:#0066cc;
    color:white;
    height:48px;
    border-radius:10px;
    font-size:18px;
}

.btn-login:hover{
    background:#004d99;
    color:white;
}

.footer{
    text-align:center;
    color:#666;
    margin-top:20px;
    font-size:14px;
}

</style>

</head>

<body>

<div class="card shadow-lg login-card">

<div class="card-header">

<div class="logo">
<i class="bi bi-airplane-engines-fill"></i>
</div>

<h3>Airline Admin Login</h3>

<p class="mb-0">Airline Reservation System</p>

</div>

<div class="card-body p-4">

<%
String error = request.getParameter("error");
if(error != null){
%>

<div class="alert alert-danger text-center">
<i class="bi bi-exclamation-triangle-fill"></i>
<%= error %>
</div>

<%
}
%>

<form action="<%= request.getContextPath() %>/AdminLoginServlet" method="post">

<div class="mb-3">

<label class="form-label">
<i class="bi bi-person-fill"></i>
Username
</label>

<input type="text"
       name="username"
       class="form-control"
       placeholder="Enter Username"
       required>

</div>

<div class="mb-4">

<label class="form-label">
<i class="bi bi-lock-fill"></i>
Password
</label>

<input type="password"
       name="password"
       class="form-control"
       placeholder="Enter Password"
       required>

</div>

<button type="submit" class="btn btn-login w-100">

<i class="bi bi-box-arrow-in-right"></i>
Login

</button>

</form>

<div class="footer">

<i class="bi bi-airplane-fill"></i>
Secure Airline Administration Portal

</div>

</div>

</div>

</body>
</html>