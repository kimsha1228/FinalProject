<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" >
<link rel="stylesheet" href="resources/css/tablesorter/theme.default.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/route/tablesorter/jquery.tablesorter.min.js"></script>


<title>루트목록</title>
<script>
	let user_id = '${user.user_id}';
	let dest_id = ${param.dest_id};
	console.log("현재 로그인 되어있는 아이디:",user_id,dest_id);
</script>
<script type="text/javascript" src="resources/js/route/selectOneDestRoute.js?ver=1"></script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>여행지 화면</h1>
	<div class="dropdown">
	  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    정렬
	  </button>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
	    <a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(1);">최근 등록</a>
  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(2);">오래된 순</a>
  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(3);">조회순</a>
  	 	<a class="dropdown-item" href="javascript:void(0);" onclick="sortFunction(4);">추천순</a>
	  </div>
	  <a class="btn btn-outline-danger" href="javascript:sortFunction(5);" role="button">초기화</a>
	</div>
	
	<table id="myTable">
	<thead>
		<tr>
			<th class="sorter-false">id</th>
			<th class="sorter-false">route_name</th>
			<th class="sorter-false">summary</th>
			<th class="sorter-false">routes</th>
			<th class="sorter-false">dest_id</th>
			<th class="sorter-false">date</th>
			<th class="sorter-false">vcount</th>
			<th class="sorter-false">likes</th>
		</tr>
	</thead>
	<tbody id="vos">
		
	</tbody>
	<tfoot>
	</tfoot>
	</table>
<!-- BootStrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" ></script>
</body>
</html>