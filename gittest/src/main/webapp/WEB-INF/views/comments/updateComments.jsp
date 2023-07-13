<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 수정 화면</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>후기 수정 화면</h1>

	<form action="updateCommentsOK.do" method="POST"
		enctype="multipart/form-data">
		<input type="hidden" name="id" value="${vo2.id}"> 
		<input type="hidden" name="user_id" value="${vo2.user_id}"> 
		<input type="hidden" name="act_id" value="${vo2.act_id}"> 
		<label for="content">Content:</label>
		<tr>
			<td><label for="content">content:</label></td>
			<td><input type="text" id="content" name="content"
				value="${vo2.content}"></td>
		</tr>
		<%-- <tr>
			<td><label for="file">file:</label></td>
			<td><input type="file" id="file" name="file"> <input
				type="hidden" id="id" name="id"
				value="${vo2.id}"></td>
		</tr> --%>
		<tr>
			<td colspan="2"><input type="submit" value="수정완료"></td>
		</tr>
	</form>
</body>
</html>
