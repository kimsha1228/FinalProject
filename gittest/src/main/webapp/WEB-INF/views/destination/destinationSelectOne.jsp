<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Name Details</title>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>${destination.name}</h1>

	<table>
		<tr>
			<th>여행지명</th>
			<th>여행지번호</th>
			<th>카테고리</th>
		</tr>
		<c:if test="${not empty destination}">
			<tr>
				<td>${destination.name}</td>
				<td>${destination.id}</td>
				<td>${destination.category}</td>
			</tr>
		</c:if>
	</table>
</body>
</html>
