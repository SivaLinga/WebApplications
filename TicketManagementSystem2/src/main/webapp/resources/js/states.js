$(document).ready(function(){
	$.ajax({url:"getState", success: function(responseTxt){
			$("#x103").html(responseTxt);
	}});
});