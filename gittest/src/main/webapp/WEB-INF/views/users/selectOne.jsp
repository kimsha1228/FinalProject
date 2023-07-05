<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<table id="usersList">
		<thead>
			<tr>
				<td>${vo.id}</td>
				<td>${vo.user_id}</td>
				<td>${vo.eng_name}</td>
				<td>${vo.region}</td>
				<td>${vo.tel}</td>
				<td>${vo.email}</td>
				<td>${vo.type}</td>
				<td>${vo.point}</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo.id}</td>
				<td>${vo.user_id}</td>
				<td>${vo.eng_name}</td>
				<td>${vo.region}</td>
				<td>${vo.tel}</td>
				<td>${vo.email}</td>
				<td>${vo.type}</td>
				<td>${vo.point}</td>
			</tr>
			<tr>
				<td colspan="7">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><a href="u_update.do?num=${param.num}">회원수정</a>
					<a href="u_deleteOK.do?num=${param.num}">회원삭제</a></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>