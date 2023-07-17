<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>내 정보 관리</h1>
		<table id="usersList">
			<tr>
				<td><label for="img">프로필</label></td>
				<td><img width="100px" src="resources/uploadimg/${users.img}"></td>
			</tr>
			<tr>
				<td><label for="user_id">아이디</label></td>
				<td>${users.user_id}</td>
			</tr>
			<tr>
				<td><label for="name">이름</label></td>
				<td>${users.name}</td>
			</tr>
			<tr>
				<td><label for="eng_name">영문명</label></td>
				<td>
					${users.first_name} ${users.last_name}
				</td>
			</tr>
			<tr>
				<td><label for="tel">전화번호</label></td>
				<td>
					${users.tel1} - ${users.tel2} - ${users.tel3}
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일</label></td>
				<td>
					${users.email1}@${users.email2}
				</td>
			</tr>
		</table>
		<a href="u_update.do?user_id=${user.user_id}">정보수정</a>
		<a href="u_deleteOK.do?user_id=${user.user_id}">회원탈퇴</a>
</body>
<<<<<<< HEAD
</html>
=======
</html>

>>>>>>> branch 'master' of https://github.com/kimsha1228/FinalProject.git
