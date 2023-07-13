<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내용</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/contact/selectAllcontact.js"></script>
<script>
	let user_id = '<%= session.getAttribute("user_id") %>';
	console.log("현재 로그인 되어있는 아이디:",user_id);
</script>	
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>문의내용</h1>
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>title</th>
				<th>content</th>
				<th>con_date</th>
				<th>attach_img</th>
				<th>user_id</th>
				<th>seller_id</th>
				<th>act_id</th>
				<th>act_name</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><a href="selectOneContact.do?id=${vo.id}">${vo.id}</a></td>
					<td>${vo.id}</td>
					<td>${vo.title}</td>
					<td>${vo.content}</td>
					<td>${vo.con_date}</td>
					<td>${vo.attach_img}</td>
					<td>${vo.user_id}</td>
					<td>${vo.seller_id}</td>
					<td>${vo.act_id}</td>
					<td>${vo.act_name}</td>
				</tr>
			</c:forEach>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>
	<br>
</body>
</html>
