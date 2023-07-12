<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h3><a href="u_insert.do">회원가입</a></h3>
	<h3><a href="u_update.do?user_id=john123">회원수정</a></h3>
	<h4><a href="myInfo.do?user_id=john123">내 정보 관리</a></h4>
	<h4><a href="logout.do">로그아웃</a></h4>
</body>
</html>