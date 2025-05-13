<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Cancel</title>
<style type="text/css">

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f7f9fc;
     display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-image: url(img/login_bg.jpg);
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
    background-color: rgba(255, 255, 255, 0.395);
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 80%;
    max-width: 600px;
    text-align: left;

}
h1{
text-align: center;
color: rgb(0, 21, 255);
text-shadow: 0 0 4px white;
}

table {
    width: 100%;
    margin-top: 20px;
    border-collapse: collapse;
}

td {
    padding: 12px;
    text-align: left;
    font-size: 16px;
}



input {
    padding: 8px;
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
    background-color: #f9f9f9;
}

.submit{
    background-color: rgb(0, 140, 255) ;
    color: white;
    border: none;
    text-shadow: 0 0 4px white;
    font-weight: 700;
}
.submit:hover{
    background-color: white;
    color: rgb(0, 140, 255) ;
    box-shadow: 0 0 7px rgb(0, 140, 255) ;
}



input:focus {
    outline: none;
    border-color: #509fe8;
    box-shadow: 0 0 5px rgba(80, 159, 232, 0.5);
}





@media screen and (max-width: 768px) {
    .container {
        padding: 20px;
    }

    h2 {
        font-size: 20px;
    }

    input, td {
        font-size: 14px;
    }
}


</style>
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
        <a href="WelcomePage.jsp"> <img src="img/exit.png" width="25px"> </a> 
    </header>
<div class="container">	
<h1>TICKET CANCELLATION</h1>

<form action="BookingCancel" method="post">
<table>
<tr>
<td>Passanger Name </td>
<td> <input type="text" name="name" id="name"> </td>
</tr>
<tr>
<td>Booking Id </td>
<td><input type="text" name="bookingid" id="bookingid"></td>
</tr>
<tr>
<td>From Destination </td>
<td><input type="text" name="fromdest" id="fromdest"></td>
</tr>
<tr>
<td>To Destination </td>
<td><input type="text" name="todest" id="todest"></td>
</tr>
<tr>
<td>Passanger Number </td>
<td><input type="text" name="phoneno" id="phoneno"></td>
</tr>
<tr>
<td>Date </td>
<td><input type="date" name="date" id="date"></td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="submit" id="submit" class="submit"></td>
</tr>
</table>
</form>
</div>
</body>
</html>