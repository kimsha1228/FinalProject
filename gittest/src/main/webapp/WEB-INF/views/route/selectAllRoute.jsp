<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	let user_id = '${user.user_id}';
	console.log("현재 로그인 되어있는 아이디:", user_id);
</script>
<script type="text/javascript" src="resources/js/route/selectAllRoute.js?ver=1"></script>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div id="selectAllRoute">
	<h1>루트목록</h1>
	
	<label for="searchWord">루트 이름</label>
	<input type="hidden" name="searchKey" id="searchKey" value="route_name">
	<input type="text" name="searchWord" id="searchWord">
	<button class="myButton" onclick="searchRoute()" >검색</button>

	<table id="routetable">
	<thead>
		<tr>
			<th>id</th>
			<th>route_name</th>
			<th>summary</th>
			<th>routes</th>
			<th>seller_id</th>
		</tr>
	</thead>
	<tbody id="vos">
		
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5">1 2 3 4 5</td>
		</tr>
	</tfoot>
	</table>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>