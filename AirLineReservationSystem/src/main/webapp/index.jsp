<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Airline Reservation & Ticket Booking System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    min-height:100vh;
    overflow:hidden;
    font-family:'Segoe UI',sans-serif;
    background:url("https://images.unsplash.com/photo-1436491865332-7a61a109cc05?q=80&w=1920&auto=format&fit=crop") no-repeat center center/cover;
    position:relative;
}

/* Dark Overlay */

body::before{
    content:"";
    position:absolute;
    inset:0;
    background:rgba(0,0,0,.45);
}

/* Airplane Animation */

.airplane{
    position:absolute;
    top:15%;
    left:-250px;
    font-size:70px;
    animation:fly 15s linear infinite;
    z-index:2;
}

@keyframes fly{

0%{
transform:translateX(0) translateY(0) rotate(5deg);
}

25%{
transform:translateX(35vw) translateY(-40px) rotate(8deg);
}

50%{
transform:translateX(70vw) translateY(20px) rotate(2deg);
}

75%{
transform:translateX(100vw) translateY(-20px) rotate(6deg);
}

100%{
transform:translateX(150vw) translateY(-50px) rotate(8deg);
}

}

/* Clouds */

.cloud{
    position:absolute;
    color:white;
    opacity:.6;
    font-size:55px;
    animation:cloudMove 35s linear infinite;
}

.cloud1{
    top:12%;
    left:-200px;
}

.cloud2{
    top:35%;
    left:-500px;
    animation-delay:10s;
}

.cloud3{
    top:60%;
    left:-300px;
    animation-delay:20s;
}

@keyframes cloudMove{

from{
left:-300px;
}

to{
left:110%;
}

}

/* Card */

.container{
    position:relative;
    z-index:5;
}

.card{

background:rgba(255,255,255,.18);
backdrop-filter:blur(12px);
border-radius:20px;
border:1px solid rgba(255,255,255,.25);
box-shadow:0 15px 35px rgba(0,0,0,.45);
color:white;

}

.card-body{
    padding:45px;
}

h1{
    font-size:38px;
    font-weight:bold;
}

h5{
    color:#f8f9fa !important;
}

hr{
    border:1px solid rgba(255,255,255,.3);
}

.btn{
    width:100%;
    margin-top:15px;
    border-radius:12px;
    font-size:18px;
    font-weight:600;
    transition:.3s;
}

.btn:hover{
    transform:translateY(-5px) scale(1.03);
    box-shadow:0 10px 20px rgba(0,0,0,.4);
}

.footer{
    margin-top:25px;
    color:#eee;
    font-size:14px;
}

</style>

</head>

<body>

<!-- Flying Airplane -->




<div class="container">

    <div class="row justify-content-center align-items-center vh-100">

        <div class="col-md-5">

            <div class="card">

                <div class="card-body text-center">

                    <h1>✈ Airline Reservation</h1>

                    <h5 class="mb-4">
                        Ticket Booking System
                    </h5>

                    <hr>

                    <a href="admin/adminLogin.jsp"
                       class="btn btn-primary btn-lg">
                        👨‍💼 Admin Login
                    </a>

                    <a href="user/login.jsp"
                       class="btn btn-success btn-lg">
                        👤 User Login
                    </a>

                    <a href="user/register.jsp"
                       class="btn btn-warning btn-lg">
                        📝 User Registration
                    </a>

                    <div class="footer">
                        Fly Smart • Book Easy • Travel Happy ✈
                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>