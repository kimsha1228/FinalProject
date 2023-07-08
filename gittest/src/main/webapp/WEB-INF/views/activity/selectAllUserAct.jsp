<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Include DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
<!-- Include DataTables JS -->
<script type="text/javascript" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script>
	let user_id = '<%= session.getAttribute("user_id") %>';
	console.log("현재 로그인 되어있는 아이디:",user_id);
</script>
<script type="text/javascript" src="resources/js/activity/selectAllUserAct.js?ver=4"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>상품</h1>
	<div>추천 리스트</div>
	<table>
	<thead>
		<tr>
			<th>id</th>
			<th>act_name</th>
			<th>rate</th>
			<th>vcount</th>
			<th>tag</th>
			<th>price</th>
			<th>wishList</th>
		</tr>
	</thead>
	<tbody id="vos">
	</tbody>
	</table>
	
	<br>
	<br>
	<label for="searchWord">상품 이름</label>
	<input type="hidden" name="searchKey" id="searchKey" value="act_name">
	<input type="text" name="searchWord" id="searchWord">
	<button class="myButton" onclick="searchList()" >검색</button>
	
	<div id="tableContainer">
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>act_name</th>
					<th>rate</th>
					<th>price</th>
					<th>wishList</th>
				</tr>
			</thead>
			<tbody id="vos2">
				<c:forEach var="vo" items="${vos}">
					<tr>
						<td>				
							<a href="selectOneUserAct.do?id=${vo.id}">${vo.id}</a>
						</td>
						<td>${vo.act_name}</td>
						<td>${vo.rate}</td>
						<td>${vo.price}</td>
						<td><button onclick="addWish(user_id,${vo.id})">♥</button></td>				
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>