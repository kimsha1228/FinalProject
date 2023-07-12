<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/faq/selectAllFaq.js"></script>
<script>
	let user_id = '<%= session.getAttribute("user_id") %>';
	console.log("현재 로그인 되어있는 아이디:",user_id);
</script>	
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>FAQ</h1>
	<table>
		<thead>
			<tr>
				<th>id</th>
				<th>title</th>
				<th>content</th>
				<th>faq_date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><a href="selectOneFaq.do?id=${vo.id}">${vo.id}</a></td>
					<td>${vo.id}</td>
					<td>${vo.title}</td>
					<td>${vo.content}</td>
					<td>${vo.faq_date}</td>
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