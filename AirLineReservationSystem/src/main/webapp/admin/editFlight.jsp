<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.model.Flight"%>
<%@ page import="com.model.Admin"%>

<%
Admin admin = (Admin) session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}

Flight flight = (Flight) request.getAttribute("flight");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Flight | Airline Reservation System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
rel="stylesheet">

<style>

body{
    background:linear-gradient(rgba(0,30,60,.75),rgba(0,30,60,.75)),
    url("https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=1600&q=80");
    background-size:cover;
    background-position:center;
    background-attachment:fixed;
    font-family:Arial, Helvetica, sans-serif;
}

.navbar{
    background:#002b5c;
}

.card{
    border:none;
    border-radius:15px;
    background:rgba(255,255,255,.96);
}

.card-header{
    background:#0d6efd;
    color:white;
}

.form-control,
.form-select{
    border-radius:8px;
}

.btn-update{
    background:#0d6efd;
    color:white;
}

.btn-update:hover{
    background:#0b5ed7;
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

<nav class="navbar navbar-dark shadow">

<div class="container">

<span class="navbar-brand fs-4">
<i class="bi bi-airplane-engines-fill"></i>
Airline Reservation System
</span>

<span class="text-white">
<i class="bi bi-person-circle"></i>
Welcome,
<b><%= admin.getUsername() %></b>
</span>

</div>

</nav>

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-lg-9">

<div class="card shadow-lg">

<div class="card-header">

<h3>
<i class="bi bi-pencil-square"></i>
Edit Flight Details
</h3>

</div>

<div class="card-body">

<form action="<%= request.getContextPath() %>/UpdateFlightServlet" method="post">

<input type="hidden"
name="flightId"
value="<%= flight.getFlightId() %>">

<div class="row">

<div class="col-md-6 mb-3">

<label class="form-label">
<i class="bi bi-hash"></i>
Flight Number
</label>

<input type="text"
class="form-control"
name="flightNumber"
value="<%= flight.getFlightNumber() %>"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
<i class="bi bi-building"></i>
Airline Name
</label>

<input type="text"
class="form-control"
name="airlineName"
value="<%= flight.getAirlineName() %>"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
<i class="bi bi-geo-alt-fill"></i>
Source
</label>

<input type="text"
class="form-control"
name="source"
value="<%= flight.getSource() %>"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
<i class="bi bi-geo-fill"></i>
Destination
</label>

<input type="text"
class="form-control"
name="destination"
value="<%= flight.getDestination() %>"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
<i class="bi bi-calendar-event"></i>
Departure Date
</label>

<input type="date"
class="form-control"
name="departureDate"
value="<%= flight.getDepartureDate() %>"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
<i class="bi bi-clock"></i>
Departure Time
</label>

<input type="time"
class="form-control"
name="departureTime"
value="<%= flight.getDepartureTime().toString().substring(0,5) %>"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
<i class="bi bi-clock-history"></i>
Arrival Time
</label>

<input type="time"
class="form-control"
name="arrivalTime"
value="<%= flight.getArrivalTime().toString().substring(0,5) %>"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
<i class="bi bi-currency-rupee"></i>
Ticket Price
</label>

<input type="number"
step="0.01"
class="form-control"
name="ticketPrice"
value="<%= flight.getTicketPrice() %>"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
<i class="bi bi-people-fill"></i>
Total Seats
</label>

<input type="number"
class="form-control"
name="totalSeats"
value="<%= flight.getTotalSeats() %>"
required>

</div>

<div class="col-md-6 mb-3">

<label class="form-label">
<i class="bi bi-info-circle-fill"></i>
Flight Status
</label>

<select class="form-select" name="status">

<option value="Available"
<%= flight.getStatus().equals("Available") ? "selected" : "" %>>
Available
</option>

<option value="Cancelled"
<%= flight.getStatus().equals("Cancelled") ? "selected" : "" %>>
Cancelled
</option>

</select>

</div>

</div>

<div class="text-center mt-4">

<button class="btn btn-update btn-lg">

<i class="bi bi-check-circle-fill"></i>
Update Flight

</button>

<a href="<%= request.getContextPath() %>/ViewFlightsServlet"
class="btn btn-secondary btn-lg">

<i class="bi bi-arrow-left-circle"></i>
Back

</a>

</div>

</form>

</div>

</div>

<div class="footer">

✈ Airline Reservation System • Flight Management Portal

</div>

</div>

</div>

</div>

</body>
</html>