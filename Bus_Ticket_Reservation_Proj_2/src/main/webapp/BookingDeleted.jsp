<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Deleted</title>
<style type="text/css">
body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        line-height: 1.6;
        background-image: url(img/cancel.jpg);
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
        max-width: 800px;
        margin: 0 auto;
        margin-top: 100px;
        background: rgba(255, 255, 255, 0.286);
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.763);
    }
    h1{
        text-align: center;
        color: rgb(0, 21, 255);
        text-shadow: 0 0 7px white;

    }

    h2 {
        color: rgb(0, 21, 255);
        text-align: center;
        margin-top: 20px;
    }

    p {
        margin: 10px 0;
        padding: 0 20px;
    }
    .namecolor{
        color:rgb(0, 21, 255) ;
        font-size: medium;
        font-weight: bold;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        border-radius: 20px;
        background-color: rgba(255, 255, 255, 0.421);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.404);
    }

    

    th, td {
        padding: 12px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        color: #555;
    }

    td {
        color: #333;
    }

    

    footer {
        text-align: center;
        margin-top: 20px;
        padding: 10px;
        background: #007BFF;
        color: #fff;
        font-size: 14px;
    }
</style>

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
		<div class="logo">
			<img src="img/logo.png" width="80" height="80">
		</div>
		<a href="WelcomePage.jsp"> <img src="img/exit.png" width="25px">
		</a>
	</header>
	<div class="container">

		<h1>YOUR BOOKING IS SUCCESSFULLY CANCEL</h1>
		<br>

		<p>
			Dear <span class="namecolor">${name}</span>,
		</p>
		<br>

		<p>We hope this message finds you well.</p>
		<br>

		<p>We are writing to confirm that your bus booking has been
			successfully canceled. Below are the details of your canceled
			booking:</p>
		<br>

		<table>
			<tr>
				<td><b>Booking ID:</b></td>
				<td>${bookingid}</td>
			</tr>

			<tr>
				<td><b>Passanger Name:</b></td>
				<td>${name}</td>
			</tr>

			<tr>
				<td><b>Mobile Number:</b></td>
				<td>${mobileno }</td>
			</tr>

		</table>
		<br>


		<h2>Refund Information:</h2>
		<br>
		<p>Your refund of Amount will be processed within 2 business days
			to your original payment method.</p>
		<br>

		<p>We apologize for any inconvenience this may have caused and
			hope to serve you again in the future.</p>
		<br>

	</div>

</body>
</html>