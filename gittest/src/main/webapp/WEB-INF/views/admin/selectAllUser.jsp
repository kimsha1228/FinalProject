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
	<h1><a href="selectAllUser.do">회원목록</a></h1>
	
	<div style="padding:5px">
		<form action="searchUserList.do">
			<select name="searchKey" id="searchKey">
				<option value="user_id">아이디</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" value="" placeholder="검색어 입력">
			<input type="submit" value="검색">
		</form>
	</div>
	<table border="1">
	<thead>
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td><a href="selectOneUser.do?user_id=${vo.user_id}">${vo.id}</a></td>
				<td>${vo.user_id}</td>
				<td>${vo.name}</td>
				<td>${vo.tel}</td>
				<td>${vo.email}</td>
			</tr>
		</c:forEach>
	</tbody>
<!-- 	<tfoot> -->
<!-- 		<tr> -->
<!-- 			<td colspan="5">1 2 3 4 5</td> -->
<!-- 		</tr> -->
<!-- 	</tfoot> -->
	</table>
</body>
</html>