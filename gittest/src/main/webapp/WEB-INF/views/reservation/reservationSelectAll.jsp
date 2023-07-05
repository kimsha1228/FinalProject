<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationComplete</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>reservationSelectAll</h1>
	
	<div style="padding:5px">
		<form action="selectCancelReservation.do">
			<input type="submit" value="취소내역">
		</form>
	</div>

	<table id="memberList">
	<thead>
		<tr>
			<th>num</th>
			<th>id</th>
			<th>pw</th>
			<th>name</th>
			<th>tel</th>
			<th>img</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td><a href="selectOneReservation.do?id=${vo.id}">${vo.id}</a></td>
			</tr>
			<tr>
				<td>${vo.id}</td>
			</tr>
			<tr>
				<td>${vo.name}</td>
			</tr>
			<tr>
				<td>${vo.pw}</td>
			</tr>
				<td>${vo.tel}</td>
			<tr>
				<td>${vo.}</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5">1 2 3 4 5</td>
		</tr>
	</tfoot>
	</table>
</body>
</html>