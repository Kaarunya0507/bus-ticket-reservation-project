<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome page</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f9;
	background-image: url(img/login_bg.jpg);
    background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}


header{
            position: fixed;
            width: 100%;
            top:0;
            right: 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: rgba(255, 255, 255, 0.542);
            height:60px;
}


header button{
	background-color: rgb(0, 140, 255);
	border-radius: 5px;
	border: none;
	margin-right: 20px;
}

.logout input{
	background-color: rgb(0, 140, 255);
	color: white;
	font-weight: 700 ;
	border: none;
	padding: 5px;
}

.link{
	text-align: center;
	justify-content: space-between;
	color: black;
}

header a {
	text-decoration: none;
	margin-left: 30px;
}

header a:hover {
	text-decoration: underline;
}


.table-box {
	margin: 20px auto;
	margin-top: 200px;
	width: 60%;
	height: 300px;
	background-color: rgba(255, 255, 255, 0.395);
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	margin-top: 20px;
	font-family: serif;
	font-size: 16px;
	border-collapse: collapse;
}

table td {
	padding: 10px;
	vertical-align: middle;
}

table input, .select {
	width: 95%;
	padding: 8px;
	font-family: serif;
	font-size: 16px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}
.date {
	width: 95%;
}
.submit {
	font-weight: 700;
	width: 100%;
	border-radius: 20px;
	background: rgb(0, 140, 255) ;
    text-shadow: 0 0 4px white;
	border: none;
	color: white;
	padding: 10px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}
.submit:hover {
	background-color: white;
    color: rgb(0, 140, 255);
    box-shadow: 0 0 7px rgb(0, 140, 255) ;
    text-shadow: 0 0 7px rgb(0, 140, 255);
}
@media screen and (max-width: 768px) {
	.table-box {
		width: 90%;
	}
	header {
		flex-direction: column;
		height: auto;
		text-align: center;
	}
	.nav2 {
		margin-left: 0;
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
		<div class="logo">
			<img src="img/logo.png" width="80" height="80">
		</div>
		<div class="link">
			<a href="ViewTicket.jsp" class="nav2">View Ticket</a> <a
				href="CancelTicket.jsp" class="nav3">Ticket Cancel</a>
		</div>
		<button>
			<form class="logout" action="Logout" method="get">
				<input type="submit" value="Logout" name="submit" id="submit">
			</form>
		</button>

	</header>
	<div class="container">
		<div class="table-box">
			<form action="CheckBus" method="get">
				<table>
					<tr>
						<td>From Destination</td>
						<td><select id="to_dest" name="from_dest" class="select"
							required>
								<option value="chennai">chennai</option>
								<option value="kanchipuram">kanchipuram</option>
								<option value="villupuram">villupuram</option>
								<option value="puducherry">puducherry</option>
								<option value="cuddalore">cuddalore</option>
								<option value="thanjavur">thanjavur</option>
								<option value="pudukkottai">pudukkottai</option>
								<option value="erode">erode</option>
								<option value="theni">theni</option>
						</select></td>
					</tr>
					<tr>
						<td>To Destination</td>
						<td><select id="to_dest" name="to_dest" class="select"
							required>
								<option value="kanchipuram">kanchipuram</option>
								<option value="chennai">chennai</option>
								<option value="villupuram">villupuram</option>
								<option value="puducherry">puducherry</option>
								<option value="cuddalore">cuddalore</option>
								<option value="thanjavur">thanjavur</option>
								<option value="pudukkottai">pudukkottai</option>
								<option value="erode">erode</option>
								<option value="theni">theni</option>
						</select></td>
					</tr>
					<tr>
						<td>Date</td>
						<td><input type="date" name="date" class="date" id="date"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" name="submit"
							value="Search" class="submit" id="submit"></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>