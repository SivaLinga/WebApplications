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


<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/vader/jquery-ui.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.0/css/ui.jqgrid.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.0/jquery.jqgrid.min.js"></script>
<script src="<c:url value="/resources/js/emptickets.js" />"></script>
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

			<!--NavbarData -->
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="showTickets">Tickets DashBoard</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout"><span
							class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
				</ul>
			</div>

		</div>
	</nav>

	<div class="container">
		<h4 class="text-center">Pending Tickets Data</h4>
		<table id="jqGrid">
		</table>
		<div id="jqGridPager"></div>
		<br>
		<div class="row">
			<div class="col-sm-7"></div>
			<button type="button" class="btn btn-success btn-lg col-sm-2"
				data-toggle="modal" data-target="#approveticket" id="a1">Approve</button>
			<div class="col-sm-1"></div>
			<button type="button" class="btn btn-danger btn-lg col-sm-2"
				data-toggle="modal" data-target="#rejectticket" id="a2">Reject</button>
		</div>

		<!--Modal Section -->
		<form action="approveTicket" method="post">
			<div class="modal fade" id="approveticket" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">

						<div class="modal-header text-center">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title">Add Comments</h3>
						</div>


						<div class="modal-body">

							<div class="form-horizontal">

								<div class="form-group">
									<label class="control-label col-sm-3" for="ticketNumber">Ticket
										Number:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="t1"
											placeholder="Auto Generated" name="ticketNumber" readonly>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="tcategory">Category:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="t2"
											placeholder="Category" name="tcategory" readonly>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="tsubcategory">SubCategory</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="t3"
											placeholder="Sub Category" name="tsubcategory" readonly>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="tdescription">Description</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="t4"
											placeholder="Description" name="tdescription" readonly>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="comments">Comment:</label>
									<div class="col-sm-8">
										<textarea class="form-control" rows="5" id="comments"
											name="comments"></textarea>
									</div>
								</div>

							</div>
						</div>

						<div class="modal-footer">
							<div class="row">
								<div class="col-sm-10"></div>
								<div class="col-sm-2">
									<button type="submit" class="btn btn-default">Submit</button>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</form>

		<!--Reject_Model_Section -->
		<form action="rejectTicket" method="post">
			<div class="modal fade" id="rejectticket" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">

						<div class="modal-header text-center">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title">Add Comments</h3>
						</div>


						<div class="modal-body">

							<div class="form-horizontal">

								<div class="form-group">
									<label class="control-label col-sm-2" for="ticketNumber">Ticket
										Id:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="t5"
											placeholder="Auto Generated" name="ticketNumber" readonly>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="tcategory">Category:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="t6"
											placeholder="Category" name="tcategory" readonly>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="tsubcategory">SubCategory</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="t7"
											placeholder="Sub Category" name="tsubcategory" readonly>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="tdescription">Description</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="t8"
											placeholder="Description" name="tdescription" readonly>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="comments">Comment:</label>
									<div class="col-sm-8">
										<textarea class="form-control" rows="5" id="comments"
											name="comments"></textarea>
									</div>
								</div>

							</div>
						</div>

						<div class="modal-footer">
							<div class="row">
								<div class="col-sm-10"></div>
								<div class="col-sm-2">
									<button type="submit" class="btn btn-default">Submit</button>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</form>
		<h4 class="text-center">Approved Tickets Data</h4>
		<table id="jqGrid2">
		</table>
		<div id="jqGridPager2"></div>
		<br>
		<br>
		<h4 class="text-center">Rejected Tickets Data</h4>
		<table id="jqGrid3">
		</table>
		<div id="jqGridPager3"></div>
		<br>
		<br>
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
</body>
</html>