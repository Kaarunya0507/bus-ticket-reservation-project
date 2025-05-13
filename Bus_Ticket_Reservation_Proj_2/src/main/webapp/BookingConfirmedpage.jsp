<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Confirmed</title>
<style type="text/css">

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f7f9fc;
    color: #333;
    min-height: 100vh;
    background-image: url(img/bus_ticket.webp);
    background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
}
header{
    position: absolute;
    width: 100%;
    top:0;
    right: 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: rgba(255, 255, 255, 0.542);
    height:60px;
}
header a{
    margin-right: 20px;
}
h1 {
    text-align: center;
    font-size: 28px; 
    color: rgb(0, 140, 255);  
    text-shadow: 0 0 3px rgb(0, 140, 255);
    margin-bottom: 30px;
    font-weight: bold; 
    text-transform: uppercase; 
}
.container{
    width: 40%;
    margin-top: 50px;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: rgba(255, 252, 252, 0.311);
    border-radius: 10px;
    box-shadow: 0 4px 8px black;
    overflow: hidden;
}

td {
    padding: 15px;
    border-bottom: 1px solid #ddd;
    text-align: left;
    font-size: 16px;
}


tr:last-child td {
    border-bottom: none;
}

td:first-child {
    font-weight: bold;
    width: 40%;
}

td:last-child {
    text-align: right;
}


h1 {
    text-align: center;
    font-size: 24px;
    color: rgb(0, 21, 255);
    margin-bottom: 20px;
}


@media screen and (max-width: 768px) {
    table {
        width: 90%;
    }

    td {
        font-size: 14px;
        padding: 10px;
    }

    h1 {
        font-size: 20px;
    }
}

</style>
</head>
<body>
<header>
        <div class="logo"><img src="img/logo.png" width="80" height="80" ></div>
        <a href="WelcomePage.jsp"> <img src="img/exit.png" width="25px"> </a> 
    </header>
    <div class="container">
<h1>Ticket Detail <img src="img/tickets.png" alt="" width="30px" height="30px"></h1>
<table>
<tr>
<td>Passanger Name </td>
<td>${passname}</td>
</tr>
<tr>
<td>Passanger Number </td>
<td>${phoneno}</td>
</tr>
<tr>
<td>Booking Id </td>
<td>${bookingid}</td>
</tr>
<tr>
<td>Bus Id</td>
<td>${busid1}</td>
</tr>
<tr>
<td>From Destination </td>
<td>${fromdest1}</td>
</tr>
<tr>
<td>To Destination </td>
<td>${todest1}</td>
</tr>
<tr>
<td>Bus Number </td>
<td>${busno1}</td>
</tr>
<tr>
<td>Bus Date </td>
<td>${busdate}</td>
</tr>
<tr>
<td>Amount You Payed </td>
<td>${amountpay}</td>
</tr>
<tr>
<td>Transaction ID </td>
<td>${upino1}</td>
</tr>
<tr>
<td>Seat Booked </td>
<td>${seatbooked}</td>
</tr>
<tr>
<td>Driver Name </td>
<td>${drivername1}</td>
</tr>
<tr>
<td>Booking Date And Time </td>
<td>${datetime}</td>
</tr>
</table>
</div>
</body>
</html>