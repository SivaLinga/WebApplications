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
        url : "display",
        datatype :"json",
        mtype : 'POST',
        colNames : [ 'Ticket Number', 'Category', 'Sub Category', 'Description', 'Status' , 'Comments'],
        colModel : [ 
        {
                name : 'ticketNumber',
                index : 'ticketNumber',
                width : 150
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
        pager : '#jqGridPager',
        rowList : [ 10, 20, 30 ],
        viewrecords : true,
        gridview : true,
        caption : 'Existed Tickets',
        jsonReader : {
                repeatitems : false,
        },
});
jQuery("#jqGrid").jqGrid('navGrid', '#jqGridPager',{edit:false,add:false,del:false});
});
</script>

<script>
$(document).ready(function(){
	$.ajax({url:"getCategories", success: function(responseTxt){
			$("#tcategory").html(responseTxt);
	}});
});

$(document).ready(function(){
$("#tcategory").change(function(){
	var categoryValue = $('select[name=tcategory]').val();
	var param = {categoryValue : categoryValue};
	 $.ajax({data: param, url:"getSubCategories", success: function(responseTxt){
		 $("#tsubcategory").html(responseTxt);
		}});
});
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
	padding: 32px;
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

#sbmtbtn {
	background-color: #999999;
	color: black;
	font-size: 18px;
	height: 50px;
	width: 200px;
}
</style>
</head>


<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home">Ektha HelpCenter</a>
			</div>

			<!--NavbarData -->
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="ticket">Tickets DashBoard</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>MyAccount</a></li>
					<li><a href="logout"><span
							class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
				</ul>
			</div>

		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4">
				<table id="jqGrid"></table>
				<div id="jqGridPager"></div>
				<br>
			</div>
		</div>
		<button type="button" id="sbmtbtn" class="btn btn-default btn-lg"
			data-toggle="modal" data-target="#addticket">Create Ticket</button>

		<form action="addTicket" method="POST">
			<div class="modal fade" id="addticket" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">

						<div class="modal-header text-center">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title">Add New Ticket</h3>
						</div>


						<div class="modal-body">

							<div class="form-horizontal">

								<div class="form-group">
									<label class="control-label col-sm-2" for="tId">Ticket
										Id:</label>
									<div class="col-sm-8">
										<input type="number" class="form-control" id="tId"
											placeholder="Auto Generated" name="tId" disabled>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="tcategory">Category:</label>
									<div class="col-sm-8">
										<select class="form-control" id="tcategory" name="tcategory"
											required></select>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-2" for="tsubcategory">SubCategory</label>
									<div class="col-sm-8">
										<select class="form-control" id="tsubcategory"
											name="tsubcategory" required></select>
									</div>
								</div>

								<div class="form-group">
									<label for="tdescription" class="col-sm-2">Description:</label>
									<div class="col-sm-8">
										<textarea class="form-control" rows="5" id="tdescription"
											name="tdescription" required></textarea>
									</div>
								</div>

							</div>
						</div>

						<div class="modal-footer">
							<div class="row">
								<div class="col-sm-10"></div>
								<div class="col-sm-2">
									<button type="submit" id="#sbmtbtn1" class="btn btn-default">Add</button>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>