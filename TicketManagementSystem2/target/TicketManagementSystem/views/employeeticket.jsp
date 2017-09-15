<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
<script>
jQuery(document).ready(function() {
$("#jqGrid").jqGrid({
        url : "displayPending",
        datatype :"json",
        mtype : 'POST',
        colNames : [ 'Ticket Number', 'Category', 'Sub Category', 'Description','Satus','Comments'],
        colModel : [ 
                {
                        name : 'ticketNumber',
                        index : 'ticketNumber',
                        width: 150
                }, 
                {
                        name : 'tcategory',
                        index : 'tcategory',
                        width : 75
                }, 
                {
                        name : 'tsubcategory',
                        index : 'tsubcategory',
                        width : 100
                }, 
                {
                        name : 'tdescription',
                        index : 'tdescription',
                        width : 400
                },
                {
                    name : 'tstatus',
                    index : 'tstatus',
                    width : 150
                },
                {
                    name : 'comments',
                    index : 'comments',
                    width : 150
                }
        
],
        loadonce : true,
        width : 1200,
        height: "100%",
        rowNum : 10,
        multiselect : true,
        pager : '#jqGridPager',
        rowList : [ 10, 20, 30 ],
        viewrecords : true,
        gridview : true,
        caption : 'Pending Tickets',
        jsonReader : {
                repeatitems : false,
        },
});
jQuery("#jqGrid").jqGrid('navGrid', '#jqGridPager',{edit:false,add:false,del:false});
jQuery("#a1").click( function(){
	  var id = jQuery("#jqGrid").jqGrid('getGridParam','selrow');
	  if (id) {
	    var ret = jQuery("#jqGrid").jqGrid('getRowData',id);
	    $("#t1").val(ret.ticketNumber);
	    $("#t2").val(ret.tcategory);
	    $("#t3").val(ret.tsubcategory);
	    $("#t4").val(ret.tdescription);
	  } else { 
		  alert("Please select row");
		  }
	});
	
jQuery("#a2").click( function(){
	  var id = jQuery("#jqGrid").jqGrid('getGridParam','selrow');
	  if (id) {
	    var ret = jQuery("#jqGrid").jqGrid('getRowData',id);
	    $("#t5").val(ret.ticketNumber);
	    $("#t6").val(ret.tcategory);
	    $("#t7").val(ret.tsubcategory);
	    $("#t8").val(ret.tdescription);
	  } else { alert("Please select row");}
	});

<!--ApprovedGrid -->
	$("#jqGrid2").jqGrid({
	        url : "displayApproved",
	        datatype :"json",
	        mtype : 'POST',
	        colNames : [ 'ticketNumber', 'tcategory', 'tsubcategory', 'tdescription','tsatus','comments'],
	        colModel : [ 
	                {
	                        name : 'ticketNumber',
	                        index : 'ticketNumber',
	                        width: 150
	                }, 
	                {
	                        name : 'tcategory',
	                        index : 'tcategory',
	                        width : 75
	                }, 
	                {
	                        name : 'tsubcategory',
	                        index : 'tsubcategory',
	                        width : 100
	                }, 
	                {
	                        name : 'tdescription',
	                        index : 'tdescription',
	                        width : 400
	                },
	                {
	                    name : 'tstatus',
	                    index : 'tstatus',
	                    width : 150
	                },
	                {
	                    name : 'comments',
	                    index : 'comments',
	                    width : 150
	                }
	        
	],
	        loadonce : true,
	        width : 1200,
	        height: "100%",
	        rowNum : 10,
	        pager : '#jqGridPager2',
	        rowList : [ 10, 20, 30 ],
	        viewrecords : true,
	        gridview : true,
	        caption : 'Approved Tickets',
	        jsonReader : {
	                repeatitems : false,
	        },
	        editurl : "display"
	});
	jQuery("#jqGrid2").jqGrid('navGrid', '#jqGridPager2',{edit:false,add:false,del:false});
<!--RejectedGrid -->
	$("#jqGrid3").jqGrid({
	        url : "displayRejected",
	        datatype :"json",
	        mtype : 'POST',
	        colNames : [ 'ticketNumber', 'tcategory', 'tsubcategory', 'tdescription','tsatus','comments'],
	        colModel : [ 
	                {
	                        name : 'ticketNumber',
	                        index : 'ticketNumber',
	                        width: 150
	                }, 
	                {
	                        name : 'tcategory',
	                        index : 'tcategory',
	                        width : 75
	                }, 
	                {
	                        name : 'tsubcategory',
	                        index : 'tsubcategory',
	                        width : 100
	                }, 
	                {
	                        name : 'tdescription',
	                        index : 'tdescription',
	                        width : 400
	                },
	                {
	                    name : 'tstatus',
	                    index : 'tstatus',
	                    width : 150
	                },
	                {
	                    name : 'comments',
	                    index : 'comments',
	                    width : 150
	                }
	        
	],
	        loadonce : true,
	        width : 1200,
	        height: "100%",
	        rowNum : 10,
	        pager : '#jqGridPager3',
	        rowList : [ 10, 20, 30 ],
	        viewrecords : true,
	        gridview : true,
	        caption : 'Rejected Tickets',
	        jsonReader : {
	                repeatitems : false,
	        }
	});
	jQuery("#jqGrid3").jqGrid('navGrid', '#jqGridPager3',{edit:false,add:false,del:false});
	});

</script>
<style>
body {
	background-color: #D0D3D4;
}

.navbar {
	font-family: Montserrat, sans-serif;
	margin-bottom: 100px;
	background-color: #2d2d30;
	border: 0;
	font-size: 18px !important;
	letter-spacing: 2px;
	opacity: 0.9;
	padding: 15px 0px;
}

.navbar li a, .navbar .navbar-brand {
	color: #d5d5d5 !important;
}

.navbar-nav li a:hover {
	color: #fff !important;
}

.navbar-nav li.active a {
	color: #fff !important;
	background-color: #29292c !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
}

.open .dropdown-toggle {
	color: #fff;
	background-color: #555 !important;
}

.dropdown-menu li a {
	color: #000 !important;
}

.dropdown-menu li a:hover {
	background-color: red !important;
}

footer {
	background-color: #2d2d30;
	color: #f5f5f5;
	padding: 18px;
	font-size: 18px !important;
}

footer a {
	color: #f5f5f5;
}

footer a:hover {
	color: #777;
	text-decoration: none;
}

.form-control {
	border-radius: 0;
}

.modal-body {
	background-color: #999999;
}

.modal-footer, .modal-header {
	background-color: #d5d5d5;
}
</style>
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
									<label class="control-label col-sm-2" for="ticketNumber">Ticket
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
		<hr>
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