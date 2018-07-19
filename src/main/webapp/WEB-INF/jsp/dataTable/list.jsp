
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>

	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script type="text/javascript" class="init">

	$.extend( true, $.fn.dataTable.defaults,
	{
		"language": {
			"url": "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Korean.json"
		}
	});
	
	
	

	$(document).ready(function() {
		
		$(".datepicker")
		.datepicker({dateFormat:'yy-mm-dd'})
		.on("change",function(){
			table.draw();
		})

		var table = $('#example').DataTable({
			"processing": true,
			"serverSide": true,
			"ajax": {
				"url": "<c:url value='/ajax.do'/>",
				"data": function ( d ) {
					d.table = "lettczip";
					d.dateColumn='FRST_REGISTER_ID';
					d.dateStart=$('#dateStart').val();
					d.dateEnd=$('#dateEnd').val();
					
				}
			},
			"columns": [
				{"title": "ZIP", "data": "ZIP","visible":true,"searchable":false},
				{"title": "SN", "data": "SN","visible":true,"searchable":true},
				{"title": "CTPRVN", "data": "CTPRVN_NM","visible":true,"searchable":true},
				{"title": "SIGNGU", "data": "SIGNGU_NM","visible":true,"searchable":true},
				{"title": "EMD", "data": "EMD_NM","visible":true,"searchable":true},
				{"title": "LI_BULD", "data": "LI_BULD_NM","visible":true,"searchable":false},
				{"title": "LNBR_DONG", "data": "LNBR_DONG_HO","visible":true,"searchable":false},
				{"title": "LAST_PNTTM", "data": "LAST_UPDT_PNTTM","visible":true,"searchable":false
					,"render": function (data, type, row, meta){
						 return new Date(data).toLocaleDateString();
					}
				},
				{"title": "FRST_REGIST", "data": "FRST_REGIST_PNTTM","visible":true,"searchable":false
					,"render": function (data, type, row, meta)
					{
						 return new Date(data).toLocaleDateString();
					}
				},
				{"title": "action"
					,"render": function (data, type, row, meta)
					{
						 return "<button class='btn btn-info'>수정</button>";
					}
				}  
				
				
			],
			"order": [[1, 'asc']]
		});

	} );
	
	</script>
	
</head>

<body>
	<div class="container">
		<h1>게시글 목록</h1>
		등록일:<input type='text' id='dateStart' class='datepicker form-control input-sm'/>~
		<input type='text' id='dateEnd' class='datepicker form-control input-sm'/>
		<table style="100%" id="example" class="table table-striped table-bordered" >
		</table>
	</div>
</body>
</html>
