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
<script type="text/javascript" src="resources/js/activity/selectAllAct.js?ver=1"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>상품목록</h1>
	
	<label for="searchWord">상품 이름</label>
	<input type="hidden" name="searchKey" id="searchKey" value="act_name">
	<input type="text" name="searchWord" id="searchWord">
	<button class="myButton" onclick="searchList()" >검색</button>

	<table>
	<thead>
		<tr>
			<th>id</th>
			<th>act_name</th>
			<th>content</th>
			<th>rate</th>
			<th>vcount</th>
			<th>tag</th>
			<th>add</th>
			<th>price</th>
			<th>act_date</th>
			<th>seller_id</th>
			<th>dest_id</th>
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
</body>
</html>