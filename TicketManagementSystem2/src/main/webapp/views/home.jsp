<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Ticket Management</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png"
	href="http://www.ncat.edu/cost/help-desk/helpdesk.jpg">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/test.css" />" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="/resources/js/states.js"></script>
</head>


<body id="myPage">

	<nav class="navbar navbar-default">
		<div class="container-fluid">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home">Ektha Help Center</a>
			</div>

			<!--Navbar Data -->
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li data-toggle="modal" data-target="#registrationModal"><a
						href="#"><span class="glyphicon glyphicon-user"></span> Sign
							Up</a></li>
					<li data-toggle="modal" data-target="#loginModal"><a href="#"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
			</div>

		</div>
	</nav>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img
					src="https://static.pexels.com/photos/356079/pexels-photo-356079.jpeg"
					alt="Los Angeles" style="width: 1366px; height: 700px;">
			</div>

			<div class="item">
				<img
					src="https://static.pexels.com/photos/265702/pexels-photo-265702.jpeg"
					alt="Chicago" style="width: 1366px; height: 700px;">
			</div>

			<div class="item">
				<img src="https://static.pexels.com/photos/33999/pexels-photo.jpg"
					alt="New york" style="width: 1366px; height: 700px;">
			</div>

		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<!-- Footer -->
	<footer class="text-center">
		<a class="up-arrow" href="#myPage" data-toggle="tooltip"
			title="TO TOP"> <span class="glyphicon glyphicon-chevron-up"></span>
		</a><br>
		<br>
		<p>
			<span class="glyphicon glyphicon-copyright-mark"></span>EkthaSolutons
		</p>
	</footer>

	<!--Modal Section -->
	<form action="signup" method="POST">
		<div class="modal fade" id="registrationModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">

					<div class="modal-header text-center">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title">Sign Up</h3>
					</div>


					<div class="modal-body" id="test1">

						<!--Registration Form -->
						<h4 class="text-center">
							<b>Personal Details</b>
						</h4>

						<div class="form-horizontal">

							<div class="form-group">
								<label class="control-label col-sm-3" for="firstName">First
									Name:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="firstName"
										placeholder="Enter First Name" name="firstName" required>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-3" for="lastName">Last
									Name:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="lastName"
										placeholder="Enter Last Name" name="lastName" required>
								</div>
							</div>

							<h4 class="text-center">
								<b>Address Details</b>
							</h4>

							<div class="form-group">
								<label class="control-label col-sm-3" for="addressLine1">Address
									Line 1:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="addressLine1"
										placeholder="Enter Address Line1" name="address.addressLine1"
										required>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-3" for="addressLine2">Address
									Line2:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="addressLine2"
										placeholder="Enter Address Line2" name="address.addressLine2"
										required>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-3" for="city">City:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="city"
										placeholder="Enter City" name="address.city" required>
								</div>
							</div>


							<div class="form-group">
								<label for="state" class="control-label col-sm-3">State:</label>
								<div class="col-sm-4">
									<select class="form-control" id="x103" name="address.state">
									</select>
								</div>

								<label class="control-label col-sm-1" for="zip">Zip:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="zip"
										placeholder="Enter Zip" name="address.zip" required>
								</div>

							</div>

							<h4 class="text-center">
								<b>User Details</b>
							</h4>

							<div class="form-group">
								<label class="control-label col-sm-3" for="email">Email:</label>
								<div class="col-sm-8">
									<input type="email" class="form-control" id="email"
										placeholder="Enter email" name="login.email" required>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-3" for="password">Password:</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="password"
										placeholder="Enter Password" name="login.password" required>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-3" for="phone">Phone:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="phone"
										placeholder="Enter Phone Number" name="phone" required>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-3" for="userType">User
									Type:</label>
								<div class="col-sm-8">
									<!-- <input type="text" class="form-control" id="userType" placeholder="Enter User Type" name="login.userType"> -->
									<select class="form-control" id="userType"
										name="login.userType">
										<option value="student">Student</option>
										<option value="consultant">Consultant</option>
										<option value="employee">Employee</option>
									</select>
								</div>
							</div>

						</div>
					</div>

					<div class="modal-footer">
						<div class="row">
							<div class="col-sm-10"></div>
							<div class="col-sm-2">
								<button type="submit" class="btn btn-default" id="sbmtbtn1">Submit</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</form>

	<!--Login Form-->
	<!--Modal Section -->
	<form action="login" method="POST">
		<div class="modal fade" id="loginModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">

					<div class="modal-header text-center">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title">Login</h3>
					</div>


					<div class="modal-body" id="test2">
						<br>
						<br>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input id="email"
								type="email" class="form-control" name="email"
								placeholder="Enter Email" required>
						</div>
						<br>
						<br>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input id="password"
								type="password" class="form-control" name="password"
								placeholder="Enter Password" required>
						</div>
						<br>
						<br>
					</div>

					<div class="modal-footer">
						<div class="row">
							<div class="col-sm-10"></div>
							<div class="col-sm-2">
								<button type="submit" class="btn btn-default btn-md"
									id="sbmtbtn">
									<b>Submit</b>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>