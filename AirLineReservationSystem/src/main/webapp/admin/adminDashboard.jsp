<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.model.Admin"%>

<%
Admin admin = (Admin) session.getAttribute("admin");

if (admin == null) {
	response.sendRedirect("adminLogin.jsp");
	return;
}

int totalFlights = (request.getAttribute("totalFlights") != null)
		? (Integer) request.getAttribute("totalFlights")
		: 0;

int totalUsers = (request.getAttribute("totalUsers") != null)
		? (Integer) request.getAttribute("totalUsers")
		: 0;

int totalBookings = (request.getAttribute("totalBookings") != null)
		? (Integer) request.getAttribute("totalBookings")
		: 0;

int activeBookings = (request.getAttribute("activeBookings") != null)
		? (Integer) request.getAttribute("activeBookings")
		: 0;

double totalRevenue = (request.getAttribute("totalRevenue") != null)
		? (Double) request.getAttribute("totalRevenue")
		: 0;

int todayBookings = (request.getAttribute("todayBookings") != null)
		? (Integer) request.getAttribute("todayBookings")
		: 0;

int monthlyBookings = (request.getAttribute("monthlyBookings") != null)
		? (Integer) request.getAttribute("monthlyBookings")
		: 0;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Airline Reservation - Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	font-family:'Poppins',sans-serif;
}

body{

	min-height:100vh;

	background:
	linear-gradient(rgba(0,40,80,.65),rgba(0,30,60,.75)),
	url("https://images.unsplash.com/photo-1436491865332-7a61a109cc05?q=80&w=1920&auto=format&fit=crop");

	background-size:cover;
	background-position:center;
	background-attachment:fixed;

}

/* Navbar */

.navbar{

	background:rgba(0,0,0,.45)!important;
	backdrop-filter:blur(12px);

}

/* Welcome Box */

.welcome-box{

	background:rgba(255,255,255,.15);
	backdrop-filter:blur(12px);
	border-radius:18px;
	color:white;
	padding:25px;
	box-shadow:0 10px 25px rgba(0,0,0,.3);

}

/* Statistics Cards */

.stats-card{

	border:none;
	border-radius:20px;
	color:white;
	overflow:hidden;
	transition:.35s;
	box-shadow:0 15px 30px rgba(0,0,0,.25);

}

.stats-card:hover{

	transform:translateY(-8px);

}

.stats-card .card-body{

	padding:28px;

}

.stats-card h2{

	font-size:40px;
	font-weight:bold;

}

.bg1{

	background:linear-gradient(135deg,#1d4ed8,#60a5fa);

}

.bg2{

	background:linear-gradient(135deg,#059669,#34d399);

}

.bg3{

	background:linear-gradient(135deg,#d97706,#fbbf24);

	color:#222;

}

.bg4{

	background:linear-gradient(135deg,#dc2626,#f87171);

}

.bg5{

	background:linear-gradient(135deg,#0ea5e9,#38bdf8);

}

.bg6{

	background:linear-gradient(135deg,#6d28d9,#a78bfa);

}

.bg7{

	background:linear-gradient(135deg,#111827,#4b5563);

}

/* Menu Cards */

.menu-card{

	background:rgba(255,255,255,.18);
	backdrop-filter:blur(15px);

	border:none;
	border-radius:20px;

	color:white;

	box-shadow:0 12px 30px rgba(0,0,0,.35);

	transition:.35s;

	height:100%;

}

.menu-card:hover{

	transform:translateY(-10px) scale(1.03);

}

.menu-card h1{

	font-size:55px;

}

.menu-card .btn{

	border-radius:12px;
	font-weight:600;

}

footer{

	background:rgba(0,0,0,.55);
	backdrop-filter:blur(10px);
	color:white;
	margin-top:40px;

}

</style>

</head>
<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg navbar-dark shadow-lg">

    <div class="container">

        <a class="navbar-brand fw-bold fs-4" href="#">
            ✈ Airline Reservation System
        </a>

        <div class="text-white fs-5">

            Welcome,

            <span class="fw-bold text-warning">
                <%=admin.getUsername()%>
            </span>

        </div>

    </div>

</nav>

<!-- ================= WELCOME ================= -->

<div class="container mt-4">

    <div class="welcome-box">

        <div class="row align-items-center">

            <div class="col-md-9">

                <h2 class="fw-bold">
                    🛫 Administrator Dashboard
                </h2>

                <p class="mb-0 mt-2">

                    Welcome to the Airline Reservation Management System.
                    Manage flights, bookings, users and reports from one
                    professional dashboard.

                </p>

            </div>

            <div class="col-md-3 text-center">

                <h1 style="font-size:90px;">✈</h1>

            </div>

        </div>

    </div>

</div>

<!-- ================= STATISTICS ================= -->

<div class="container mt-4">

<div class="row">

<div class="col-lg-3 col-md-6 mb-4">

<div class="card stats-card bg1">

<div class="card-body text-center">

<h5>Total Flights</h5>

<h2><%=totalFlights%></h2>

<p class="mb-0">Available Routes</p>

</div>

</div>

</div>

<div class="col-lg-3 col-md-6 mb-4">

<div class="card stats-card bg2">

<div class="card-body text-center">

<h5>Total Users</h5>

<h2><%=totalUsers%></h2>

<p class="mb-0">Registered Users</p>

</div>

</div>

</div>

<div class="col-lg-3 col-md-6 mb-4">

<div class="card stats-card bg3">

<div class="card-body text-center">

<h5>Total Bookings</h5>

<h2><%=totalBookings%></h2>

<p class="mb-0">Confirmed Tickets</p>

</div>

</div>

</div>

<div class="col-lg-3 col-md-6 mb-4">

<div class="card stats-card bg4">

<div class="card-body text-center">

<h5>Active Bookings</h5>

<h2><%=activeBookings%></h2>

<p class="mb-0">Current Reservations</p>

</div>

</div>

</div>

<div class="col-lg-4 col-md-6 mb-4">

<div class="card stats-card bg5">

<div class="card-body text-center">

<h5>Total Revenue</h5>

<h2>

₹ <%=String.format("%.2f", totalRevenue)%>

</h2>

<p class="mb-0">Overall Earnings</p>

</div>

</div>

</div>

<div class="col-lg-4 col-md-6 mb-4">

<div class="card stats-card bg6">

<div class="card-body text-center">

<h5>Today's Bookings</h5>

<h2><%=todayBookings%></h2>

<p class="mb-0">Today's Reservations</p>

</div>

</div>

</div>

<div class="col-lg-4 col-md-6 mb-4">

<div class="card stats-card bg7">

<div class="card-body text-center">

<h5>Monthly Bookings</h5>

<h2><%=monthlyBookings%></h2>

<p class="mb-0">Current Month</p>

</div>

</div>

</div>

</div>

</div>

<!-- ================= MENU STARTS BELOW ================= -->
<!-- ================= DASHBOARD MENU ================= -->

<div class="container mb-5">

    <div class="row g-4">

        <!-- Add Flight -->

        <div class="col-lg-4 col-md-6">

            <div class="card menu-card">

                <div class="card-body text-center p-4">

                    <div class="display-3 mb-3">🛫</div>

                    <h4 class="fw-bold">Add Flight</h4>

                    <p class="text-light">
                        Create and publish new flight schedules.
                    </p>

                    <a href="<%=request.getContextPath()%>/admin/addFlight.jsp"
                        class="btn btn-primary w-100">

                        Add Flight

                    </a>

                </div>

            </div>

        </div>

        <!-- View Flights -->

        <div class="col-lg-4 col-md-6">

            <div class="card menu-card">

                <div class="card-body text-center p-4">

                    <div class="display-3 mb-3">✈️</div>

                    <h4 class="fw-bold">View Flights</h4>

                    <p class="text-light">
                        Manage all available airline routes.
                    </p>

                    <a href="<%=request.getContextPath()%>/ViewFlightsServlet"
                        class="btn btn-success w-100">

                        View Flights

                    </a>

                </div>

            </div>

        </div>

        <!-- View Bookings -->

        <div class="col-lg-4 col-md-6">

            <div class="card menu-card">

                <div class="card-body text-center p-4">

                    <div class="display-3 mb-3">🎫</div>

                    <h4 class="fw-bold">Bookings</h4>

                    <p class="text-light">
                        View and manage passenger reservations.
                    </p>

                    <a href="<%=request.getContextPath()%>/ViewBookingsServlet"
                        class="btn btn-warning w-100">

                        View Bookings

                    </a>

                </div>

            </div>

        </div>

        <!-- Reports -->

        <div class="col-lg-4 col-md-6">

            <div class="card menu-card">

                <div class="card-body text-center p-4">

                    <div class="display-3 mb-3">📊</div>

                    <h4 class="fw-bold">Reports</h4>

                    <p class="text-light">
                        Generate booking and revenue reports.
                    </p>

                    <a href="<%=request.getContextPath()%>/BookingReportServlet"
                        class="btn btn-info text-white w-100">

                        View Reports

                    </a>

                </div>

            </div>

        </div>

        <!-- Users -->

        <div class="col-lg-4 col-md-6">

            <div class="card menu-card">

                <div class="card-body text-center p-4">

                    <div class="display-3 mb-3">👨‍👩‍👧‍👦</div>

                    <h4 class="fw-bold">Users</h4>

                    <p class="text-light">
                        View all registered customers.
                    </p>

                    <a href="<%=request.getContextPath()%>/ViewUsersServlet"
                        class="btn btn-secondary w-100">

                        Manage Users

                    </a>

                </div>

            </div>

        </div>

        <!-- Logout -->

        <div class="col-lg-4 col-md-6">

            <div class="card menu-card">

                <div class="card-body text-center p-4">

                    <div class="display-3 mb-3">🚪</div>

                    <h4 class="fw-bold">Logout</h4>

                    <p class="text-light">
                        Securely sign out from the dashboard.
                    </p>

                    <a href="<%=request.getContextPath()%>/AdminLogoutServlet"
                        class="btn btn-danger w-100">

                        Logout

                    </a>

                </div>

            </div>

        </div>

    </div>

</div>

<!-- ================= FOOTER ================= -->

<footer class="text-center py-4">

    <h5 class="mb-2">
        ✈ Airline Reservation and Ticket Booking System
    </h5>

    <p class="mb-1">
        Manage Flights • Bookings • Users • Reports
    </p>

    <small>
        © 2026 Airline Reservation System | Java • JSP • Servlets • JDBC • MySQL • Bootstrap 5
    </small>

</footer>

</body>
</html>