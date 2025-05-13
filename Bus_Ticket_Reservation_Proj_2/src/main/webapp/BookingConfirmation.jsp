<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Confirmation Page</title>
<style type="text/css">

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f7f9fc;
    color: #333;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-image: url(img/wal.jpg);
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


.container {
    width: 50%;
    margin-top: 50px;
    justify-content: center;
    align-items: flex-start;
    max-width: 900px;
    background-color: rgba(255, 255, 255, 0.231);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}


form {
    flex: 1;
    margin-right: 20px; 
}

table {
    width: 100%;
    border-collapse: collapse;
}

td {
    padding: 15px;
    text-align: left;
    vertical-align: middle;
    border-bottom: 1px solid #ddd;
}

td:last-child {
    text-align: right;
}

tr:last-child td {
    border-bottom: none;
}

input {
    padding: 8px;
    width: 100%;
    border: none;
    border-radius: 5px;

    box-sizing: border-box;
    font-size: 14px;
}

input:focus {
    outline: none;
    border-color: #509fe8;
    box-shadow: 0 0 5px rgba(80, 159, 232, 0.5);
}

input[readonly] {
    background-color: transparent;
    cursor: not-allowed;
}

#submit {
    background-color: rgb(0, 140, 255);
    color: white;
    text-shadow: 0 0 4px white;
    border: none;
    border-radius: 20px;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: 100%;
}

#submit:hover {
    background-color: white;
    color: rgb(0, 140, 255);
    text-shadow: 0 0 4px rgb(0, 140, 255);
    box-shadow: 0 0 7px rgb(0, 140, 255);
}


.paying {
    text-align: center;
    width: 180px;
    height: auto;
    align-self: flex-start;
}

@media screen and (max-width: 768px) {
    .container {
        flex-direction: column;
        align-items: center;
    }

    form {
        width: 100%;
        margin-right: 0; 
    }

    .paying {
        margin-top: 20px;
        align-self: center;
    }
}

</style>
<script>
    function calculateAmount() {
        let seats = document.getElementById("seats").value;
        let price = document.getElementById("price").value;

        if (seats && price) {
            document.getElementById("amount").value = seats * price;
        }
    }
</script>
</head>
<body>
<%
    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("username") == null || session.getAttribute("password") == null) {
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.invalidate();
        response.sendRedirect("LoginPage.html");
    }
%>
 <header>
        <div class="logo"><img src="img/logo.png" width="80" height="80" ></div>
        <a href="WelcomePage.html"> <img src="img/exit.png" width="25px"> </a> 
    </header>
    <div class="container">
<h1>Bus Details </h1>
<form action="Bookingconfirmed" method="post">
<table>
<tr>
    <td>Bus Id</td>
    <td><input class="border" type="text" id="busid" name="busid" value="${busid}" readonly></td>
</tr>
<tr>
    <td>Bus Number</td>
    <td><input class="border" type="text" id="busno" name="busno" value="${busno}" readonly></td>
</tr>
<tr>
    <td>From Destination</td>
    <td><input class="border" type="text" id="fromdest" name="fromdest" value="${fromdest}" readonly></td>
</tr>
<tr>
    <td>To Destination</td>
    <td><input class="border" type="text" id="todest" name="todest" value="${todest}" readonly></td>
</tr>
<tr>
    <td>Date</td>
    <td><input class="border" type="date" id="date" name="date" value="${travelingdate}" readonly></td>
</tr>
<tr>
    <td>Driver Name</td>
    <td><input class="border" type="text" id="drivername" name="drivername" value="${drivername}" readonly></td>
</tr>
<tr>
    <td>Available Seats</td>
    <td><input class="border" type="text" id="availableseats" name="availableseats" value="${capacity}" readonly></td>
</tr>
<tr>
    <td>Price Per Seat</td>
    <td><input class="border" type="text" id="price" value="${price}" readonly></td>
</tr>
<tr>
<td colspan="2">If you want to confirm your booking, please enter your details and pay the amount </td><td></td>
</tr>
<tr>
    <td>Passanger Name </td>
    <td>
        <input type="text" id="passangername" name="passangername"  >	
    </td>
</tr>
<tr>
    <td>Passanger Number </td>
    <td>
        <input type="text" id="passangernumber" name="passangernumber"  >
    </td>
</tr>
<tr>
    <td>Number of Seats </td>
    <td>
        <input type="number" id="seats" name="seats" min="1" max="${capacity}" required oninput="calculateAmount()">
    </td>
</tr>
<tr>
    <td>Total Amount </td>
    <td><input type="text" id="amount" name="amount" readonly></td>
</tr>
<tr>
    <td></td>
    <td colspan="2"><img  class="paying" src="img/pay.png" >  </td>
</tr>
<tr>
    <td>Enter Transaction Number </td>
    <td> <input type="text" name="upino" id="upino"> </td>
</tr>
<tr>
    <td></td>
    <td colspan="2"> <input type="submit" name="submit" id="submit"> </td>
</tr>
</table>
</form>
</div>
</body>
</html>
