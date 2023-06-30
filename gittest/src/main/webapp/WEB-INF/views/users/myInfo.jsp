<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>내 정보 관리</h1>
	<form action="myInfo.do" method="post">
		<table id="memberList">
			<tr>
				<td><label for="img">프로필 사진:</label></td>
				<td><input type="image" id="img" name="img" value="tester">
				<button type="button" onclick="idCheck()" class="myButton">사진 업로드</button>
					<span id="demo"></span></td>
			</tr>
			<tr>
				<td><label for="name">이름:</label></td>
				<td><input type="text" id="name" name="name" value="tester"></td>
			</tr>
			<tr>
				<td><label for="name">영문명:</label></td>
				<td>
				    <label for="name">first name:</label>
					<input type="text" id="name" name="name" value="tester">
					<hr>
					<label for="name">last name:</label>
					<input type="text" id="name" name="name" value="tester">
				</td>
			</tr>
			<tr>
				<td><label for="tel">전화번호:</label></td>
				<td><input type="text" id="tel" name="tel" value="tester"></td>
			</tr>
			<tr>
				<td><label for="email">이메일:</label></td>
				<td><input type="text" id="email" name="email" value="tester"></td>
			</tr>
			<tr>
				<td colspan="2">
				<button type="button" onclick="idCheck()" class="myButton">회원탈퇴</button>
				<input type="submit" class="myButton">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
	
	
</body>
</html>