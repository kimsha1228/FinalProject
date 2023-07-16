<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAll</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>나의 포인트</h1>
	
	<div><h3>현재 포인트 ${vo.point}</h3></div>
<%-- 	<c:if test=""> --%>
	<c:forEach var="vos" items="${vos}">
		<table border="1">
			<tr>
				<th>적립내역</th>
				<td>${vos.history}</td>
			</tr>
			<tr>
				<th>포인트</th>
				<td>${vos.point}</td>
			</tr>
			<tr>
				<th>적립일</th>
				<td>${vos.point_date}</td>
			</tr>
		</table>
	</c:forEach>
<%-- 	</c:if> --%>
</body>
</html>