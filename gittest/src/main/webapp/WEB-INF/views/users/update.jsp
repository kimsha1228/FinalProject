<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>회원수정</h1>
	
	<form action="u_updateOK.do" method="post" enctype="multipart/form-data">
		<table id="usersList">
			<tr>
				<td><label for="id">회원번호:</label></td>
				<td><span id="span_id">${vo2.id}</span><input type="hidden" id="id" name="id"
					value="${vo2.id}"></td>
			</tr>
			<tr>
				<td><label for="user_id">user_id:</label></td>
				<td><span id="span_user_id">${vo2.user_id}</span></td>
			</tr>
			<tr>
				<td><label for="pw">pw:</label></td>
				<td><input type="password" id="pw" name="pw" value="${vo2.pw}"></td>
			</tr>
			<tr>
				<td><label for="eng_name">eng_name:</label></td>
				<td><input type="text" id="eng_name" name="eng_name"
					value="${vo2.eng_name}"></td>
			</tr>
			<tr>
				<td><label for="region">region:</label></td>
				<td><input type="text" id="region" name="region" value="${vo2.region}"></td>
			</tr>
			<tr>
				<td><label for="tel">tel:</label></td>
				<td><input type="text" id="tel" name="tel" value="${vo2.tel}"></td>
			</tr>
			<tr>
				<td><label for="email">email:</label></td>
				<td><input type="text" id="email" name="email" value="${vo2.email}"></td>
			</tr>
			<tr>
				<td><label for="type">type:</label></td>
				<td><input type="text" id="type" name="type" value="${vo2.type}"></td>
			</tr>
			<tr>
				<td><label for="point">point:</label></td>
				<td><input type="text" id="point" name="point" value="${vo2.point}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원수정완료"></td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>