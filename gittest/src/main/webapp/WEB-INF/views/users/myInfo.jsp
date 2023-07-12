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
	<h1>내 정보 수정</h1>
	<form action="u_updateOK.do" method="post" enctype="multipart/form-data">
		<table id="usersList">
			<tr>
				<td><label for="img">프로필 사진:</label></td>
				<td><input type="file" id="img" name="img">
			</tr>
			<tr>
				<td><label for="name">이름:</label></td>
				<td><input type="text" id="name" name="name" value=""></td>
			</tr>
			<tr>
				<td><label for="name">영문명:</label></td>
				<td>
					<input type="text" id="last_name" name="last_name" value="" placeholder="영문 성">
					<input type="text" id="first_name" name="first_name" value="" placeholder="영문 이름">
				</td>
			</tr>
			<tr>
				<td><label for="tel">전화번호:</label></td>
				<td>
					<input type="text" id="tel1" name="tel1" value="010">
					<input type="text" id="tel2" name="tel2" value="">
					<input type="text" id="tel3" name="tel3" value="">
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일:</label></td>
				<td>
					<input type="text" id="email1" name="email1" value="tester">
					<input type="text" id="email2" name="email2" value="@naver.com">
				</td>
			</tr>
			<tr style="margin-top:100px">
				<th colspan="2">
				<input type="submit" value="저장하기">
				</th>
			</tr>
		</table>
	</form>
	<button type="button" class="myButton">회원탈퇴</button>
</body>
</html>
	
	
</body>
</html>