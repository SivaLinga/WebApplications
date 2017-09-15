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
