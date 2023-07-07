<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAll</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>유저목록</h1>
	
	<div style="padding:5px">
		<form action="u_searchList.do">
			<select name="searchKey" id="searchKey">
				<option value="name">name</option>
				<option value="tel">tel</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" value="ki">
			<input type="submit" value="검색">
		</form>
	</div>

	<table id="usersList">
	<thead>
		<tr>
			<th>id</th>
			<th>user_id</th>
			<th>pw</th>
			<th>eng_name</th>
			<th>region</th>
			<th>tel</th>
			<th>email</th>
			<th>type</th>
			<th>point</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td><a href="u_selectOne.do?id=${vo.id}">${vo.id}</a></td>
				<td>${vo.user_id}</td>
				<td>${vo.eng_name}</td>
				<td>${vo.region}</td>
				<td>${vo.tel}</td>
				<td>${vo.email}</td>
				<td>${vo.type}</td>
				<td>${vo.point}</td>			
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="7">1 2 3 4 5 6 7</td>
		</tr>
	</tfoot>
	</table>
</body>
</html>