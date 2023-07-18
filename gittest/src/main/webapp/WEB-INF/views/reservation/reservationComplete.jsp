<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<jsp:include page="../css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h3>결제가 완료되었습니다!</h3>
	<a href="home.do">메인페이지로</a>
	<a href="selectAllReservation.do?user_id=${user.user_id}">예약내역 보기</a>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>