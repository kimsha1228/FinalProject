<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>회원정보</h1>

	<table border="1">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>영문이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<td>포인트</td>
				<th>프로필</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.id}</td>
				<td>${vo2.user_id}</td>
				<td>${vo2.pw}</td>
				<td>${vo2.name}</td>
				<td>${vo2.eng_name}</td>
				<td>${vo2.tel}</td>
				<td>${vo2.email}</td>
				<td>${vo2.point}</td>
				<td><img width="50px" src="resources/uploadimg/${vo2.img}"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="9"><a href="u_update.do?user_id=${param.user_id}">회원수정</a>
					<a href="u_deleteOK.do?user_id=${param.user_id}">회원삭제</a></th>
			</tr>
		</tfoot>
	</table>
	<c:if test="${vo2.type==3}">
	<form action="pointPlus.do">
		<table>
			<tr>
				<td>포인트</td>
				<td>
					<input type="hidden" name="user_id" value="${vo2.user_id}">
					<input type="text" name="history" value="" placeholder="적립내역">
					<input type="number" name="point" value="" placeholder="포인트">
					<input type="submit" value="완료">
				</td>
			</tr>
		</table>
	</form>
	</c:if>
</body>
</html>